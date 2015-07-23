---
Title: "Ça y est, @Override fonctionne enfin comme je l'ai toujours voulu :-)"
Date: 2008-02-02
Author: "Baptiste Mathus"
url: "2008/02/02/Ca-y-est-Override-fonctionne-enfin-comme-je-lai-toujours-voulu-:-"
---



Depuis Java 5, les annotations ont été ajoutées. L'une des premières a
été @Override, une annotation destinée à informer le compilateur que la
méthode ainsi annotée
[redéfinit](http://batmat.net/blog/post/2005/11/26/205-surcharge-ou-redefinition)
une méthode parente.

Le problème, c'est qu'en Java 5, cette annotation ne pouvait être
utilisée que sur des méthodes en provenance d'une **classe** parente,
pas d'une interface.

Je l'ignorais jusqu'à hier soir, mais en posant la question de la
justification de ce choix d'implémentation sur ma liste de diffusion
favorite, c'est mon [ancien prof de Java et de Génie
Logiciel](http://weblogs.java.net/blog/forax/) qui m'a répondu que
c'était possible depuis Java 6. Cf. le [blog de Peter
Ahé](http://blogs.sun.com/ahe/entry/override).

En clair :

    public interface MonInterface
    {
        void methode();
    }

    class MonImpl implements MonInterface
    {
        // L'annotation suivante est valide depuis Java6, mais produit à la compilation le 
        // message suivant en Java5 :
        // "The method methode() of type MonImpl must override a superclass method"
        @Override
        public void methode()
        {
        }
    }

Ça fait un outil de plus pour augmenter la qualité du code, en
l'occurrence en diminuant le risque de se retrouver avec du code mort.

