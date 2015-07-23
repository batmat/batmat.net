---
Title: "Migration Dotclear 2 #2 - RewriteRule et appel à contribution"
Date: 2007-01-14
Author: "Baptiste Mathus"
url: "2007/01/14/Migration-Dotclear-2-2-RewriteRule-et-appel-a-contribution"
---



Bon, c'est mieux. Maintenant, normalement les flux RSS sont correctement
redirigés. Il me reste à supporter les anciennes URL, ce que je
m'escrime à faire depuis plusieurs heures sans succès.

Je suis principalement reparti du [billet de kozlika sur
dcTips](http://dissitou.klafoutis.org/index.php/post/2006/12/29/Redirection-des-urls).

Pour les flux des billets et des commentaires d'ici, ça marche sans
problème et ça donne ça :

    RewriteCond %{QUERY_STRING} ^$
    RewriteRule ^dotclear/rss.php /blog/feed/rss2 [R=301]
    RewriteCond %{QUERY_STRING} ^type=co$
    RewriteRule ^dotclear/rss.php /blog/feed/rss2/comments? [R=301]
    RewriteCond %{QUERY_STRING} ^$
    RewriteRule ^dotclear/atom.php /blog/feed/atom [R=301]
    RewriteCond %{QUERY_STRING} ^type=co$
    RewriteRule ^dotclear/atom.php /blog/feed/atom/comments? [R=301]

Par contre, pour la redirection des anciens billets, je patauge. Exemple
[http://batmat.net/blog/2005/05/02/1...](http://batmat.net/blog/2005/05/02/141-heureusement-qu-on-peut-changer-d-avis "http://batmat.net/blog/2005/05/02/141-heureusement-qu-on-peut-changer-d-avis")
ne fonctionne pas de base. La nouvelle inclut en fait simplement "post"
entre "blog/" et la date, ce qui donne
[http://batmat.net/blog/post/2005/05...](http://batmat.net/blog/post/2005/05/02/141-heureusement-qu-on-peut-changer-d-avis "http://batmat.net/blog/post/2005/05/02/141-heureusement-qu-on-peut-changer-d-avis").
J'ai donc fait comme ça :

    RewriteRule ^blog/(\d{4})/(\d{2})/(\d{2})/(\d+.+)$ /blog/post/$1/$2/$3/$4 [R=301]

Mais visiblement, cela ne fonctionne pas (cliquez sur le premier lien
pour en être convaincu :-)). Je ne comprends pas trop pourquoi. Ceci est
très certainement dû au fait que je ne connaissais de mod\_rewrite que
le nom il y a encore quelques heures. J'ai l'impression que le fait que
le fichier blog.php existe prend le pas et n'exécute pas la règle de
réécriture.

Si quelqu'un a une idée de comment résoudre le problème, et par la même
occasion pourquoi je mange une Internal Server Error dès que j'essaie
d'activer l'option
[RewriteLog](http://www.illiweb.com/manuel/Apache_1.3_VF/mod/mod_rewrite.html#RewriteLog)
pour comprendre ce qui se passe, je suis ouvert à toute proposition...

D'avance merci

