---
Title: "Problème Gmail avec Adblock plus"
Date: 2007-11-24
Author: "Baptiste Mathus"
---



Depuis quelques jours, j'avais des problèmes à l'utilisation de gmail.
Je n'ai pas fait le rapprochement tout de suite. La page principale de
la boite de réception s'affichait, mais cliquer sur un message
n'affichait jamais ce dernier. Certaines fois, même, Firefox m'affichait
le message indiquant qu'un "script (javascript) ne répond pas"...

Après réflexion, je me suis demandé si adblock plus, l'extension
anti-pub pour firefox que j'ai installée ne pouvait pas être en cause ?
[Bingo avec Google](http://www.google.fr/search?q=adblock+plus+gmail).
Je n'ai par contre pas compris pourquoi les [billets comme
celui-ci](http://www.almaren.ch/archives/2005/10/28/adblock-plus-bloque-gmail/)
dataient déjà de 2005, alors que je suis persuadé que ça fait une ou
deux semaines au moins que j'utilisais déjà conjointement adblock plus
et gmail sans soucis. Peut-être une mise à jour d'adblock plus récente
que j'aurais faite sans y faire attention ?

Bref, la solution est simple. Il suffit d'ajouter *mail.google.com* à la
[liste blanche](http://en.wikipedia.org/wiki/White_list). Pour faire
ceci, on peut se référer au billet en lien ci-dessus ou à la
[documentation d'adblock plus](http://adblockplus.org/fr/filters). En
fait, pour ajouter un filtre à la liste blanche, il faut simplement
préfixer le filtre par @@ (enfin, simplement, faut le savoir, quand
même...).

Une fois ceci fait, tout roule normalement à nouveau.

