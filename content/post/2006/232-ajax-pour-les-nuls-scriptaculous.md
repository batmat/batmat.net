---
Title: "Ajax pour les nuls, Scriptaculous"
Date: 2006-12-05
Author: "Baptiste Mathus"
---



Franchement génial ce qu'on peut faire en trois coups de cuillère à pot
grâce à [Scriptaculous](http://script.aculo.us). J'avais fait, il y a un
moment déjà, un petit test pour voir comment fonctionnait Ajax au
marteau et au burin, sans aller bien loin. Ça avait donné
[ça](http://tests.batmat.net/ajax/departements/departements.html).

Après en avoir entendu parlé un peu, ce soir, j'ai testé la bibliothèque
Scriptaculous. Et [voilà ce que ça
donne](http://tests.batmat.net/ajax/scriptaculous/pof.html).
Franchement, en partant du wiki de scriptaculous, il m'aura fallu moins
d'une heure, le temps de refaire un bout de php et trouver la fonction
stristr à utiliser ! J'ai par ailleurs testé les effets (bibliothèque
Effects) et c'est aussi très impressionnant : rien à faire ou presque et
on peut tout de suite obtenir de superbes effets de fondus sur n'importe
quel élément HTML.

Ajax en mode marteau/burin, j'y crois mais alors pas du tout. Faut être
chtarbé pour envisager de faire coder à des dizaines de développeurs un
truc aussi difficile à maintenir et à débugguer. Par contre, avec des
bibliothèques comme celles-ci, ça devient tout de suite plus crédible.
Toutefois, attention, comme c'est souvent rappelé, il ne faut pas
s'emballer à en faire à bloc partout tout le temps : ça tape quand même
beaucoup sur le serveur à coup de requêtes HTTP (exemple avec
l'autocomplétion : à chaque lettre un échange avec le serveur est
effectué, ben oui, c'est pas magique non plus), donc ça peut vite
devenir gênant en terme de performance. Ne pas en abuser et à
surveiller, donc.

Bravo pour cet outil si bien documenté et simple à utiliser, c'est pas
toujours comme ça :-).

