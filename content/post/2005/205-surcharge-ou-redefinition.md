---
Title: "Surcharge ou redéfinition ?"
Date: 2005-11-26
Author: "Baptiste Mathus"
---



Comme si un billet en appelait un autre :-).

Je suis en train d'effectuer la relecture de la traduction d'une
documentation d'un framework Java très connu et je tombe sur une phrase
qui me choque :

> La classe identifiante doit **surcharger** *equals()* et *hashCode()*
> et implémenter *Serializable*

Je me dis que l'erreur vient peut-être de la version anglaise. Je
vérifie immédiatement que non :

> The identifier class must override equals() and hashCode() and
> implement Serializable.

Les équivalents anglais de *surcharge* et *redéfinition* sont
*overloading* et *overriding*. C'est pourtant simple à se souvenir :
overload contient le mot load, dont tout le monde sait, même les plus
anglophobes, qu'il veut dire charge (ou charger, selon le contexte,
bref).

Donc :

-   Over**load** =\> Sur**charge**
-   Override =\> redéfinition

### Rappel

#### Surcharge (overload)

Il y a surcharge lorsqu'on utilise le même nom qu'une autre méthode,
mais en changeant la signature des paramètres.

Exemple :

    class MaClasse
    {
       public void maMethode(int i) { ... }
       public void maMethode(float f) { ... }
    }

Ici, la méthode *maMethode* est **surchargée**.

#### Redéfinition

On touche ici à ce qu'on appelle le polymorphisme. Un des apports de la
POO qui permet d'appeler une méthode spécialisée dans une hiérarchie de
classes. La redéfinition d'une méthode est étroitement liée à la notion
de dérivation (ou d'héritage) et consiste à définir dans une sous-classe
une méthode déjà définie dans une classe parente. **La méthode en
question doit posséder exactement la même signature, sinon ce n'est
justement plus de la redéfinition, mais de la surcharge !**

Exemple :

    public class A
    {
       public void direDesBetises()
       {
          System.out.println("Hey, ça foire fouille ?");
       }
    }

    public class B extends A
    {
       public void direDesBetises()
       {
          System.out.println("Hey, vNr ?");
       }

       public void direDesBetises(String msg)
       {
          System.out.println("Alors, comme ça tu veux dire "+msg+" ?");
       }
    }

Avec le code ci-dessus, le code main suivant affiche quoi d'après vous ?

    public class Test
    {
        public static void main(String args[])
        {
            A a = new A();
            B b = new B();      
            A ab = new B();
            
            a.direDesBetises();
            b.direDesBetises();
            ab.direDesBetises();
        }
    }

Ici B.direDesBetises() est une redéfinition (override) de
A.direDesBetises(). En plus, j'ai surchargé (over**loaded**) dans la
classe B la méthode en question avec la méthode
B.direDesBetises(String).

##### Résultat

    baptiste@pumte:~/Temst$ java Test
    Hey, ça foire fouille ?
    Hey, vNr ?
    Hey, vNr ?

Mon propos ici étant simplement de récapituler brièvement ce que sont
surcharge et redéfinition en plus de rappeler la correspondance des
termes français et anglais, je n'entrerai pas plus dans les détails. Si
vous souhaitez en savoir plus, [Vincent](http://genezys.net) a par
contre déjà écrit un article très complet sur le
[polymorphisme](http://mess.genezys.net/polymorphisme "Dérivation & Polymorphisme, par Vincent ROBERT").

