---
Title: "Subversion"
Date: 2004-10-11
Author: "Baptiste Mathus"
url: "2004/10/13/88-subversion"
---



Ça faisait quelques temps que j'avais envie d'écrire sur un sujet plus
technique. J'en ai d'autres en tête, le problème étant de trouver le
temps pour les traiter durant cette dernière année d'école d'ingénieurs
qui nécessite tant de travail, comme le [dit aussi
Vincent](http://www.genezys.net/blog/2004/10/11/20-dotclear)...

Cette année, pour mes projets j'utilise
[Subversion](http://subversion.tigris.org) alias svn à la place de
[CVS](http://www.cvshome.org) que j'utilisais l'année dernière.

Je parlerai surtout de son utilisation côté client parce que je n'ai
installé un serveur que pour CVS. L'installation d'un serveur svn a
toutefois l'air plus complexe, mais je me fourvoie très certainement,
j'en conviens.

### Pourquoi Subversion ? Pourquoi pas CVS ?

En fait, svn ne se pose pas en concurrent de CVS, mais en successeur. Il
n'y a donc pas de raisons de chercher à trouver CVS meilleur, il ne
l'est pas. C'est très simple, j'ai même entendu dire que ce sont des
anciens développeurs de CVS qui ont codé svn. Ils ont repris ce qui
était bon et modifié ou supprimé ce qui était mauvais.

### Qu'est-ce qui change ?

Ils ont gardé les mêmes commandes (enfin, pour celles qu'on utilise le
plus couramment, je n'ai pourtant vu aucune différence) :

-   cvs co ... =\> svn co ...
-   cvs update =\> svn update
-   cvs commit =\> svn commit
-   ...

Donc, si vous commencez un projet, n'hésitez pas utiliser svn plutôt que
CVS. Il est d'ores et déjà prêt pour une utilisation en production
(dixit la [FAQ de
Subversion](http://subversion.tigris.org/project_faq.html#stable)).

### Mon avis

Comme je l'ai dit plus haut, je n'ai testé que le côté client. Voici en
vrac quelques points que j'ai retenus. Ils ne sont pas forcément très
importants, mais c'est ceux qui me viennent à l'esprit alors que j'écris
ce billet :

-   Pour le checkout initial, si vous utilisez un serveur qui fonctionne
    en http ou https, je trouve ça plus simple. cvs co
    http://svn.monServeurAMoi.org/monRepository et c'est OK. Pour ceux
    qui connaissent, fini les `export` qui précédaient l'appel du
    checkout avec CVS. (Bon, c'est vrai qu'il peut encore y avoir des
    `export` dans certains cas avec svn, mais jusqu'à maintenant, je
    n'en ai pas eu besoin, mais passons).
-   Les commits sont **atomiques**. Ça veut dire que votre serveur
    Subversion ne peut plus se retrouver en vrac après un souci (de
    commits en concurrence par exemple). Soit vous arrivez à "commiter"
    correctement, soit rien ne passe et le repository revient dans un
    état stable. Pour ceux qui veulent en savoir un peu plus : en fait,
    c'est grâce au fait qu'on n'utilise plus des fichiers mais une BD
    (Berkeley DB) qui apporte la gestion des transactions
    (rollback&commit world :-))
-   Le répertoire de travail du client n'est plus visible directement
    sous GNU/Linux. En effet, celui-ci se nommait CVS pour... CVS, oui,
    bien joué, “c'est encore un militaire qui gagne une tringle à
    rideauuuuuu!”. Il s'appelle désormais .svn pour subversion : ce qui
    correspond à une sorte de fichier caché sous mon OS favori. D'aucuns
    pourront considérer le fait de ne pas voir tout de suite qu'on est
    sur une "working copy" d'un repository comme un défaut,
    personnellement je trouve ça très bien de ne lister que les fichiers
    de mon projet (et non aussi le répertoire destiné à la gestion de
    l'outil de travail collaboratif).
-   Un meilleur support réseau. CVS a été développé comme une surcouche
    à rcs, un logiciel capable (en local) de gérer l'historique d'un
    fichier donné et qui stockait ça dans un fichier à l'extension `,v`
    :-). Subversion a été pensé pour être utilisé en réseau, il offre
    donc plusieurs moyens évolués et sécurisés d'accéder au repository,
    là où CVS obligeait à posséder un compte utilisateur sur la machine
    serveur...
-   Par la commande `svn rename`, svn offre la possibilité de renommer
    un fichier là où CVS obligeait à : déplacer le fichier, le supprimer
    du repository (`cvs remove`) et l'ajouter à nouveau avec le nouveau
    nom (`cvs add`)...

### Quelques pointeurs (en anglais)

-   Un
    [comparatif](http://better-scm.berlios.de/comparison/comparison.html)
    d'une dizaine d'outil de "gestion de configuration". Vous verrez
    que, contrairement à CVS, Subversion n'a plus rien à envier à des
    outils *closed-sources* et très chers.
-   Un extrait d'article (merci Greg) qui résume bien les changements
    importants entre CVS et Subversion. Je ne sais pas d'où il provient,
    si quelqu'un le sait, je veux bien rajouter la référence :

> CVS is aged, and it has many deficiencies. For example, you cannot
> move or rename files, the branch feature is very complicated, etc.
> Furthermore, CVS has only poor network support. To run it in a safe
> way, you must use it in conjunction with ssh, and this means that you
> must give all participants a system account. If the network connection
> breaks in the middle of a commit operation, this may damage your data.

> Subversion seems to implement all features that are missing in CVS.
> The version control model is more complete, as you can check in
> directories. The network support is much better, as it uses the
> well-known WebDAV protocol. One can tunnel it easily through SSL, and
> it is only required to have a web server user account to get write
> access. Last but not least, there is a modern database behind it with
> transactions, so you are not lost in space if your disk gets full, or
> if some other unpredicted incident happens.

Bien entendu, si vous avez des questions ou des compléments sur le
sujet, n'hésitez pas à utiliser les commentaires :-)

