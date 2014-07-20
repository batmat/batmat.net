---
Title: "Remplacement de commande"
Date: 2004-05-22
Author: "Baptiste Mathus"
---



Voici donc le premier billet sur les astuces linux, j'espère qu'il y en
aura beaucoup d'autres :-). Ci-dessous et par la suite, comme partout
ailleurs, le dollar représentera la ligne de commande.

### Comment remplacer très rapidement la commande précédente par une autre ?

Cas classique : vous avez machinalement tapé *\$more
/etc/X11/XF86Config-4* et vous avez soudainement envie de modifier le
fichier pré-cité et vous utilisez *bash* (je ne sais pas si ça marche
sur d'autres shells, peut-être mais je n'ai pas testé).

Zut ! Au plus rapide, ça donne :

-   flèche vers le haut,
-   flèche début ou CTRL-A
-   suppr suppr suppr suppr
-   puis finalement vi et [ENTRÉE]

Un peu lourd, n'est-il point ?

Au lieu de ça, tapez simplement *\$\^more\^vi* et c'est fini...

PS : Vous pouvez voir au passage avec l'image de la catégorie mes
premiers pas avec Gimp... Ce que j'ai ramé...

