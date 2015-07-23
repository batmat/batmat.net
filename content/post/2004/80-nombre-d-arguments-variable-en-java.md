---
Title: "Nombre d'arguments variable en Java"
Date: 2004-08-30
Author: "Baptiste Mathus"
url: "2004/08/30/80-nombre-d-arguments-variable-en-java"
---



Les connaisseurs du langage se diront certainement que c'est impossible.
Et bien, ceux là n'auront pas encore découvert la nouvelle API de
*Tiger*, la version 1.5 de Java (parfois connue aussi sous le nom de
version 5). Les *varargs* font en effet partie des nombreux ajouts de
l'API qui devrait sortir en version finale (actuellement beta2) vers le
mois d'octobre.

Je vais donc décrire brièvement comment ça marche avec des petits bouts
de code. Vous verrez que c'est très simple à l'utilisation, beaucoup
plus que l'équivalent C :-).

Nous allons montrer un exemple avec l'ancienne et la nouvelle méthode.
Une simple fonction destinée à afficher les paramètres qui lui sont
demandés.

### C'était pas mieux aaavaannt (Cabrel's moment)

On utilisait un tableau d'arguments en entrée, ce qui pouvait s'avérer
lourd à l'utilisation.

    public maFonctionBof(String [] args)
    {
      //et paf, on fait des trucs en parcourant le tableau
      for(int i=0;i<args.length;++i)
      {
         System.out.println(args[i]);
      }
    }

Pour l'appeler, ça donnait un truc assez moche :

    maFonctionBof(new String[]{"nif-nif","naf-naf","nouf-nouf"});

### C'est mieux mainteeenaaannnt

En fait, seule la signature de la méthode change, le corps reste
totalement identique :

    public maFonctionPasBof(String... args)
    {
      //et paf, on fait des trucs en parcourant le tableau
      for(int i=0;i<args.length;++i)
      {
         System.out.println(args[i]);
      }
    }

Vous remarquerez que c'est le même symbole qu'en C. Et pour l'appeler,
ça simplifie la chose :

    maFonctionPasBof("nif-nif","naf-naf","nouf-nouf");

Mais alors, mais alors, mais alors ? Quelle est donc la fonction connue
par une génération de programmeur C, adulée que dis-je, utilisant ce
principe avec avantage et que beaucoup demandaient ? Oui, vous l'avez
rêvé, ils l'ont fait : printf est maintenant disponible dans l'API de la
version 1.5 de Java :-).

    float v = 1.5F;
    int nb = 2;
    System.out.printf("C'est-y-po formidable tout ça ? Que la version %.1f 
           nous apporte ces %05d améliorations ?",v,nb);

Pour des informations plus complètes sur les [nouveautés de
Tiger](http://lroux.developpez.com/article/java/tiger/).

