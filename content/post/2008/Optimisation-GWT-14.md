---
Title: "Optimisation GWT 1.4"
Date: 2008-02-02
Author: "Baptiste Mathus"
url: "2008/02/02/Optimisation-GWT-14"
---



Wouah, je viens de regarder l'[interview de Bruce Johnson par InfoQ à
propos de GWT](http://www.infoq.com/interviews/bruce-johnson-gwt).

Bruce explique les nombreuses optimisations qu'ils effectuent au niveau
du compilateur GWT. Il explique notamment qu'ils (les développeurs GWT)
cherchent sans cesse à optimiser le compilateur, pour cela il comparent
par exemple les requêtes qu'une webapp classique effectue vers le
serveur et les requêtes que GWT fait.

Et en exemple, autour de la dixième minute, il explique l'optimisation
concernant les images : l'ImageBundle. Dans une application classique,
il y a des dizaines d'images, souvent toutes petites (icônes, fonds...).
Le problème, c'est que le navigateur, même pour se voir répondre que
l'image est à jour ouvre très souvent des connexions, d'autant plus
qu'il y a d'image ! Ça peut créer (dixit Bruce) une contention en raison
du grand nombre de sockets ouvertes côté serveur.

Et bien si vous utilisez cet objet ImageBundle, **GWT construit côté
serveur une image composite**. Comme ça, le navigateur n'a qu'une seule
image à télécharger puis vérifier, et les morceaux sont déconstruits
côté client en récupérant les bouts de la grosse image et en les plaçant
au bon endroit (cf. 10m40s). C'est quand même génial comme idée.

Bon après, il faut que la machine sur laquelle le navigateur tourne
dépote d'autant plus, mais on n'a rien sans rien.

*PS : Ce que je viens de dire n'est que le reflet de ce que j'ai compris
de l'interview. Je n'ai pas testé cette fonctionnalité.*

