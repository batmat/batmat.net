---
Title: "Rajouter une interface à une classe pendant l'exécution"
Date: 2005-01-22
Author: "Baptiste Mathus"
---



Je viens à l'instant de découvrir enfin les joies de
l'[ASM](http://asm.objectweb.org/) (j'ai bien dit **A**SM ! :-p). Je me
suis basé pour ce faire sur un exemple d'un de mes profs cette année,
[Rémi Forax](http://igm.univ-mlv.fr/~forax/) pour l'ASM et sur [ce
billet](http://blogs.sun.com/roller/page/sundararajan/20050106#tracing_class_loading_1_5)
pour mieux comprendre le principe de l'agent java (cf. plus loin). Comme
c'est encore frais, j'en profite pour en faire un petit article qui sera
profitable, je pense, à d'autres et à moi pour plus tard \^\^.

Cet outil permet en Java de rajouter du code à une classe pendant
l'exécution. C'est très impressionnant. Imaginons qu'on veuille faire
quelque chose que le compilateur ne permet pas. Je veux par exemple
renvoyer une classe d'un type différent, mais la même cependant, selon
des paramètres donnés, je n'ai pas d'autres choix que d'écrire les deux
classes différentes.

Pas avec ASM, justement.

Je vais ici expliquer avec un exemple le plus simple possible comment
rajouter une interface à une classe pendant l'exécution. Pour faire
cela, nous aurons besoin de trois choses (en plus de javac et java,
évidemment) :

-   [Le JDK 1.5](http://java.sun.com/j2se/1.5.0/download.jsp)
-   [La bibliothèque ASM](http://asm.objectweb.org/download/index.html),
    pour mes tests, j'ai utilisé la version 1.5.3.
-   L'outil jar livré avec le jdk.

Pensez aussi à vos petits doigts, ça peut servir.

Nous allons écrire une classe `AddInterfaceClassTransformer` qui hérite
de `ClassFileTransformer`. C'est cette classe qui va s'occuper de
modifier le bytecode de la classe qu'on veut changer au moment de son
chargement.

### Comment ça marche ?

1.  On utilise un pattern Visitor pour en quelque sorte *tager* les
    classes qu'on veut modifier ;
2.  On parcourt la classe pour réécrire le code qu'on souhaite en
    fonction des tags par exemple.

En fait, on va indiquer à la VM qu'elle doit utiliser un "java agent"
avant de charger les classes. C'est ce principe qui va nous permettre de
modifier le code si on le souhaite.

### La classe de test

On écrit cette toute petite classe qui "implémente" par exemple
EventListener, on lui fait implémenter quelque chose pour bien mettre
ensuite en évidence qu'il y en a bien une de plus :

    public class MyClassOfMe implements EventListener
    {
    }

### Le code de test

La classe suivante va nous permettre d'afficher par
*[reflection](http://java.sun.com/docs/books/tutorial/reflect/)* java
les interfaces de `MyClassOfMe` :

    public class MonTest
    {
       public static void main(String[] args)
       {
           System.out.println("Liste des interfaces de "+MyClassOfMe.class+" : ");
           for (Class interfaze : MyClassOfMe.class.getInterfaces())
           {
               System.out.println(interfaze);
           }
           System.out.println("Fin");
       }
    }

Si on lance cette classe après compilation, on obtient le résultat
suivant :

    $ java fr/umlv/bmathus/MonTest
    Liste des interfaces de class fr.umlv.bmathus.MyClassOfMe :
    interface java.util.EventListener
    Fin

Rien d'extraordinaire, on a affiché là ce qui est actuellement compilé
et qu'on a sous les yeux. Mais encore fallait-il vérifier que ça
fonctionne :-).

Maintenant, nous voudrions donc comme je l'ai dit que cette classe
affiche en fait une ligne de plus indiquant qu'elle implémente une
interface supplémentaire. J'ai choisi d'ajouter `Serializable`.

### Le transformer

Écrivons donc le `ClassFileTransformer` qui va nous permettre de faire
ça :

    public class AddInterfaceClassTransformer implements ClassFileTransformer
    {
       public byte[] transform(ClassLoader loader, String name, Class clazz,
               ProtectionDomain domain, byte[] code)
               throws IllegalClassFormatException
       {
           // if it's not the first load or a bootstrap class
           if (loader == null || clazz != null)
               return null;

           System.out.println("[Loading " + name + "]");

           ClassReader reader = new ClassReader(code);

           // On "tag" le code à modifier
           final MyVisitor myVisitor = new MyVisitor();

           // On fournit le visitor au reader, on ne s'occupe pas des méthodes de
           // debug (skipDebug=true)
           reader.accept(myVisitor, true);

           ClassWriter writer = new ClassWriter(false);

           MyRewriteClassAdapter rewriteClassAdapter = new MyRewriteClassAdapter(
                   writer, myVisitor.mustAddInterface);
           reader.accept(rewriteClassAdapter, true);

           byte[] remoteCode = writer.toByteArray();
           return remoteCode;
       }

Ici, on définit en tant que classe interne le visitor qui va s'occuper
de marquer les classes qu'on souhaite modifier.

       private class MyVisitor implements ClassVisitor
       {
           public MyVisitor()
           {
           }

           public void visit(int version, int access, String name,
                   String superName, String[] interfaces, String sourceFile)
           {
               System.out.println("Nom de la classe analysée = " + name);

Je n'arrive pas utiliser getInternalName(MyClassOfMe.class) et que ça
fonctionne encore ici, donc je mets la chaîne en dur. Si quelqu'un a une
explication, je suis preneur.

               if ("fr/umlv/bmathus/MyClassOfMe".equals(name))
               {
                   mustAddInterface = true;
               }
           }

           public void visitInnerClass(String _arg0, String _arg1, String _arg2,
                   int _arg3)
           {
           }

           public void visitField(int _arg0, String _arg1, String _arg2,
                   Object _arg3, Attribute _arg4)
           {
           }

           public CodeVisitor visitMethod(int _arg0, String _arg1, String _arg2,
                   String[] _arg3, Attribute _arg4)
           { 
               return null;
           }

           public void visitAttribute(Attribute _arg0)
           {
           }

           public void visitEnd()
           {
           }

           boolean mustAddInterface;
       }

       private static class MyRewriteClassAdapter extends ClassAdapter
       {

           private boolean mustAddInterface;

           public MyRewriteClassAdapter(ClassWriter writer,
                   boolean mustAddInterface)
           {
               super(writer);
               this.mustAddInterface = mustAddInterface;
           }

Ici, assez simplement, on récupère la liste des interfaces déjà
présentes. Et on y ajoute `Serializable`, l'utilisation d'un Set nous
permet de ne pas nous occuper de savoir si l'implémentation est déjà
présente. En effet, pour ceux qui l'ignorent, un Set est un ensemble.
Or, au sens mathématique, ça veut dire qu'on ne peut pas avoir deux fois
le même objet. Donc, ici, l'ajout ne se fera *que si l'interface n'est
pas encore présente*.

           public void visit(int version, int access, String name,
                   String superName, String[] interfaces, String sourceFile)
           {
               HashSet<String> set;
               if (interfaces == null)
                   set = new HashSet<String>();
               else
                   set = new HashSet<String>(Arrays.asList(interfaces));

               if (mustAddInterface)
               {
                   set.add(I_SERIALIZABLE);
               }
               super.visit(version, access, name, superName, set
                       .toArray(new String[set.size()]), sourceFile);
           }

           private static String I_SERIALIZABLE = getInternalName(Serializable.class);
       }

Là, nous donnons le point d'entrée du java agent. De la même façon que
la fonction main est le point d'entrée d'une classe normale, la méthode
premain est celui recherché par la vm lorsqu'on lui indique qu'une
classe est un agent java.

On lui passe ici une instance de notre transformer.

       public static void premain(String agentArgs, Instrumentation inst)
       {
           inst.addTransformer(new AddInterfaceClassTransformer());
       }

       private static String getInternalName(Class< ? > clazz)
       {
           return clazz.getName().replace('.', '/');
       }

       private static Method defineClass;
       static
       {
           try
           {
               defineClass = ClassLoader.class.getDeclaredMethod("defineClass",
                       String.class, byte[].class, int.class, int.class,
                       ProtectionDomain.class);
           }
           catch (NoSuchMethodException e)
           {
               throw new AssertionError(e);
           }
           defineClass.setAccessible(true);
       }

       private static HashSet<String> objectMethods = new HashSet<String>();
       static
       {
           objectMethods.add("equals" + "(Ljava/lang/Object;)Z");
           objectMethods.add("toString" + "()Ljava/lang/String;");
           objectMethods.add("hashCode" + "()I");
       }
    }

### Création du java agent

Comme je l'ai indiqué au début, cette classe doit être utilisée par la
vm avant de charger normalement les classes. Nous allons donc packager
notre classe dans un jar pour l'utiliser ensuite en tant qu'agent java.

#### Le manifest

Le manifest doit contenir une ligne indiquant la Premain-Class à
utiliser, il aura donc la forme suivante :

    Premain-Class: fr.umlv.bmathus.AddInterfaceClassTransformer

À présent, nous pouvons créer notre jar :

    $ jar cvfm transformer.jar META-INF/MANIFEST.MF fr

C'est presque fini, il ne reste plus qu'à lancer la même classe qu'au
début en précisant à la vm qu'elle doit utiliser notre java agent
*transformer.jar*. Bien entendu, il faut rajouter au classpath le jar
d'asm :

    java -javaagent:transformer.jar -cp asm-1.5.3.jar:. fr/umlv/bmathus/MonTest

Et ça affiche :

    [Loading fr/umlv/bmathus/MonTest]
    Nom de la classe analysée = fr/umlv/bmathus/MonTest
    [Loading fr/umlv/bmathus/MyClassOfMe]
    Nom de la classe analysée = fr/umlv/bmathus/MyClassOfMe
    Liste des interfaces de class fr.umlv.bmathus.MyClassOfMe :
    interface java.io.Serializable
    interface java.util.EventListener
    Fin

Gagné ! Nous avons réussi à ajouter l'interface qu'on voulait à notre
classe.

### Conclusion

ASM est très puissant, je n'ai fait là qu'en découvrir un petit morceau.
Ce type de traitement est applicable à n'importe quel attributs de votre
classe, vous pouvez ainsi modifier méthodes, champs, etc. Je reviendrai
certainement sur le sujet d'ici quelques temps si je trouve des
compléments intéressants à ce billet.

