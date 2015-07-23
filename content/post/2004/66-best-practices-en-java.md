---
Title: "Bonnes pratiques de programmation en Java"
Date: 2004-06-28
Author: "Baptiste Mathus"
url: "2004/06/28/66-best-practices-en-java"
---



Aujourd'hui, on va parler de best practices (ou bonnes pratiques en bon
françois) de programmation en Java. On parlera entre autre des quelques
classes de l'API fonctionnellement dépréciées, on parlera aussi
d'évolutivité et d'héritages abusifs, le tout encadré de design
patterns.

#### Les classes interdites

Je rencontre encore sur le net certains projets qui utilisent encore les
2 classes suivantes (cette liste n'est certainement pas exhaustive, mais
ces deux là sont les plus courantes) :

-   Hashtable
-   Vector

Vous ne devez pas utiliser ces classes. Elles ne sont toujours présentes
que pour assurer une compatibilité ascendante : la jvm 1.4 doit pouvoir
faire tourner un programme écrit en 1.0 qui peut contenir des objets de
ce type puisque leur alternative n'est apparue que pour la version 1.2.

Depuis la 1.2 donc, il ne faut plus les utiliser. Mais alors pourquoi,
vous allez me dire, est-ce qu'ils n'ont pas déprécié ces classes à
partir de la 1.2 ? C'est très simple : hashtable est une table de
hâchage (une liste de clé-valeur) et Vector une classe qui gère une
liste d'objets... C'est à dire des objets extrêmement courants et
utilisés. Sun a donc décidé de ne pas les déprécier pour éviter
plusieurs centaines voire milliers de lignes de warning à la compilation
de projets développés à l'époque du jdk 1.2.

##### pourquoi ne pas les utiliser ?

Ces classes sont *synchronisées*, elles sont ce qu'on appelle
*thread-safe*. Cela signifie que dans un environnement contenant
plusieurs fils de processus, si vous utilisez ces objets, vous vous
garantissez une cohérence de leurs données, ce qui ne serait pas le cas
si elles n'étaient pas synchronisées.

Le problème c'est que cette fonctionnalité est loin d'être utilisée dans
tous les projets, on n'utilise pas forcément ses objets dans un contexte
concurrentiel partout (encore heureux). En terme de performances, cette
synchronisation n'est pas gratuite, on peut même dire qu'elle est plutôt
chère (on parle communément d'un rapport de 1 à 5). Vous vous rendez
alors bien compte qu'utiliser un Vector pour stocker vos listes est le
plus souvent une perte totalement inutile de performances.

##### Les alternatives

Mais alors donc quelles classes utiliser en remplacement ? Celles-ci,
leurs équivalents non thread-safe :

-   `ArrayList` pour Vector
-   `HashMap` pour Hashtable

##### Et si je veux un conteneur thread-safe ?

Si vous avez pensé à poser cette question, bravo. Dans un environnement
concurrentiel, il faut toujours synchroniser les objets d'une façon ou
d'une autre... Il y a deux solutions pour ce faire :

Synchronisation aux endroits où c'est nécessaire en utilisant un
conteneur non synchronisé

-   Avantage : Gain possible en performances car vous maîtrisez
    parfaitement la synchronisation de votre code ;
-   Inconvénient : Plus difficile parce que vous devez faire très
    attention de ne pas faire d'oubli dans cette synchro si vous ne
    voulez pas obtenir des résultats au mieux bizarres, au pire
    catastrophiques.

Utilisation de conteneur synchronisé :

-   Avantage : Il suffit de se concentrer une bonne fois sur le codage
    du conteneur et ensuite on peut l'utiliser sans crainte de créer des
    inconsistences à l'exécution ;
-   Inconvénient : Perte possible de performance parce qu'il va
    peut-être y avoir des synchronisation à des endroits où ce n'est pas
    nécessaire.

Heureusement, vous vous dites, il existe donc `Vector` pour les cas où
on veut utiliser un conteneur \_thread-safe\_. Et bien non, vous pouvez
*jeter cette classe, vous-n'en-aurez-plus-besoin* :-). À la place,
utilisez la méthode statique
[Collections.synchronizedList](http://java.sun.com/j2se/1.4.2/docs/api/java/util/Collections.html#synchronizedList(java.util.List) "Javadoc de la classe Collections sur le site de Sun").
Vous obtiendrez ainsi une liste synchronisée à partir d'une qui ne l'est
pas, en appliquant de plus l'important principe qui consiste à cacher
les implémentations dont je vais maintenant parler.

#### Améliorer l'évolutivité du code

##### Masquer l'implémentation

Ce qui fait que beaucoup (trop) d'utilisations de Vector subsistent
encore aujourd'hui, c'est que cette classe était utilisée partout sans
être masquée par une classe ou une interface.

Depuis la version 1.2, Vector implémente l'interface `List` comme le
font `ArrayList` et `LinkedList`. Lorsqu'on utilise une liste, il ne
faut donc plus indiquer à l'extérieur qu'on utilise telle ou telle
implémentation mais il faut simplement indiquer qu'on utilise une classe
qui implémente l'interface `List`. En faisant systématiquement comme ça,
vous vous laissez la possibilité de changer d'implémentation
ultérieurement. S'il vous prend par exemple l'envie de ne plus utiliser
une `ArrayList` mais une implémentation personnelle de `List` pour telle
ou telle raison, personne ne le saura et tout le reste du code restera
inchangé (et ça, c'est très important).

##### Les factory

Utilisez des factory pour créer vos objets. Vous pourrez ainsi
facilement cacher une implémentation.

Exemple : Pouet doit pouvoir dire bonjour

    public interface Pouet
    {
      /**
       * Affiche bonjour à l'écran
       */
      public void sayBonjour();
    }

Très bien, la première chose à faire est donc d'écrire une
implémentation de Pouet :

    public class PouetImpl implements Pouet
    {
      public void sayBonjour()
      {
         System.out.println("Bonjour");
      }
    }

Si vous ne faites que ça, les utilisateurs de votre classe n'auront pas
d'autre choix que d'écrire

    PouetImpl pouet = new PouetImpl();

Et s'ils sont un petit peu plus expérimentés

    Pouet pouet = new PouetImpl();

Et ils utiliseront Pouet et non PouetImpl partout dans leur code, mais
ce n'est pas forcément bon parce que vous laissez d'autres que vous
faire des choix de méthode d'utilisation de votre code. Autant que faire
se peut, il doit toujours y avoir un minimum de possibilité pour faire
quelque chose, sinon vous vous exposez à de gros problèmes de
maintenance...

Et s'ils le sont encore plus, ils pourront avoir envie d'utiliser un
framework de découplage, communément appelé conteneur léger en
opposition avec les conteneurs d'EJB beaucoup plus intrusifs et lourds à
mettre en oeuvre, comme [spring](http://www.springframework.org/),
[PicoContainer](http://www.picocontainer.org/) ou
[Avalon](http://avalon.apache.org/) qui permettent d'utiliser de simples
POJOs.

Ou alors, il écriront eux-mêmes la factory que vous auriez dû fournir :

    public final class PouetFactory
    {
      public Pouet createPouet()
      {
         return new PouetImpl();
      }
      /**
       * Singleton pour cette factory.
       */
      public static PouetFactory getFactory()
      {
         if(pouetFactory==null)
         {
            pouetFactory = new PouetFactory();
         }
         return pouetFactory;
      }
      private static final pouetFactory;

      private PouetFactory()
      {
      }
    }

Ici, on aura pris soin de faire 3 choses :

-   fournir une méthode statique `getFactory()` ou `getInstance()` ;
-   mettre un constructeur private pour interdire l'instanciation de la
    factory par du code extérieur ;
-   mettre la classe final pour empêcher sa dérivation.

Vous voyez bien ici que si j'ai envie d'utiliser autre chose que
PouetImpl, personne ne le saura si j'ai bien contraint à utiliser
correctement mon code (en mettant par exemple la classe PouetImpl
protected si c'est possible afin d'éviter qu'elle soit instanciable par
un autre objet que ceux du package). Je pourrai librement changer
d'implémentation en impactant le moins de code possible.

#### Héritage abusif

Dans la série du code anti-évolutif, mettons au top les dérivations
excessives. Qui n'a jamais dérivé une JFrame pour afficher une pauvre
fenêtre qui n'a rien de plus que la JFrame d'origine ? Et bien non, vous
devez déléguer dans la plupart des cas. C'est à dire encapsuler l'objet
que vous utilisez et fournir une méthode `getComponent()` renvoyant un
`Component` par exemple pour le fournir à l'extérieur.

On ne décide pas de faire une dérivation à la légère, ce choix de
conception doit être motivé par le fait que l'objet que vous voulez est
une variante de la classe dont vous souhaitez hériter. Si ce n'est pas
le cas, il y a de fortes chances pour que vous ne deviez pas hériter
mais plutôt déléguer.

#### Ça ira pour aujourd'hui

Voilà, ce sera tout pour aujourd'hui. J'ai encore d'autres trucs dont je
veux parler. Il faudra que j'en trouve le temps, ce qui n'est pas gagné.
J'ai envie de vous parler de DAO, de commons-logging, de JNI ... Bref,
encore de quoi dire pleins de choses :-).

Si vous n'êtes pas d'accord avec certains points ou que vous souhaitez
des éclaircissements, les commentaires sont là pour ça :-).

