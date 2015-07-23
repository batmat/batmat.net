---
Title: "Limitation Oracle antédiluvienne"
Date: 2007-10-26
Author: "Baptiste Mathus"
url: "2007/10/26/Limitation-Oracle-antediluvienne"
---



Je découvre avec une relative stupeur que la taille maximale des noms de
tables, de colonnes, de contraintes est limitée sur Oracle à **[30
caractères](http://www.orafaq.com/forum/t/20654/0/)** seulement !

Imaginez que vous ayez une contrainte d'intégrité référentielle entre
deux tables :

-   PRODUIT
-   CATEGORIE\_PRODUIT

Par convention, on préfixe souvent ces contraintes de clés étrangères
par FK (voire C\_FK par exemple, pour *Constraint* et *Foreign Key*). Ça
me donne quelque chose comme ça :

-   FK\_PRODUIT\_CATEGORIE\_PRODUIT

Là, j'ai 28 caractères, je passe limite. Si je rajoute "C\_", je suis à
fond...

Imaginons maintenant que votre fonctionnel vous indique qu'il y a une
relation de réflexivité sur CategorieProduit. Les catégories de produit
forment en effet un arbre avec des catégories, des sous-catégories, etc.
Ben là, vous oubliez le nommage ci-dessus :

-   FK\_CATEGORIE\_PRODUIT\_PRODUIT\_CATEGORIE\_PRODUIT, ça passe pas...

Autre cas, si vous avez deux relations entre deux mêmes tables. Par
exemple, Adresse et Client : un client peut avoir une adresse de
facturation et une adresse de livraison. En base, on doit donc retrouver
deux contraintes d'intégrité. La première idée qui vient est de
concaténer par exemple le rôle au nommage ci-dessus. Euuu, ça commence à
exclure pas mal de cas.

Franchement, à l'occasion du passage de la mise à jour de Oracle v10,
Oracle aurait pu supprimer ou au moins augmenter cette limitation
antédiluvienne !!! Pour la petite histoire, cette limitation n'existe
pas sur les autres SGBD que nous pouvons utiliser : HSQLDB, MySQL,
PostgreSQL... Je comprends mieux pourquoi les schémas d'entreprise sont
truffés de noms absolument incompréhensibles. L'auto-documentation du
nommage est impossible avec une limitation aussi importante.

À l'heure de l'auto-complétion omniprésente, il est courant d'avoir des
variables qui atteignent 30 caractères. Je ne dis pas qu'il faut
forcément des noms de variable à rallonge, mais si la longueur apporte
en clarté, en maintenabilité, en compréhension, ne vous en privez
surtout pas !

Très très déçu par Oracle sur ce coup là.

