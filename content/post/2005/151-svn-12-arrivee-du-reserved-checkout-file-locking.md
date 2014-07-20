---
Title: "Svn 1.2 : arrivée du reserved checkout (file locking)"
Date: 2005-05-25
Author: "Baptiste Mathus"
---



J'avais déjà parlé de subversion dans un [billet
précédent](http://batmat.net/blog/2004/10/13/88-subversion).

Via
[a19s](http://www.application-servers.com/comments.do?reqCode=readComments&sid=2005-05-25-12:43:51),
on apprend à l'instant que la [version 1.2 de
Subversion](http://subversion.tigris.org/svn_1.2_releasenotes.html)
vient de sortir.

Cette version apporte une fonctionnalité extrêmement importante : le
reserved checkout. Cette fonctionnalité permet de poser un verrou sur un
fichier donné (file locking) afin d'éviter les conflits par exemple.

Autant je trouve que c'est une fonction qui se doit d'être utilisée avec
parcimonie, autant je comprends que beaucoup de boîtes aient besoin de
cette "sécurité". Pouvoir éviter qu'un fichier soit modifié alors qu'il
ne devrait pas l'être me semble effectivement une bonne idée.

Nous allons enfin pouvoir adopter la notion de "package fermé" (bonjour
à [DR](http://www-igm.univ-mlv.fr/~dr/) :-)) et véritablement fermer les
packages qui ne doivent pas être touché sans autorisation préalable.
J'ai hâte de pouvoir tester ça.

