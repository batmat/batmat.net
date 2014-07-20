---
Title: "Aidez à populariser Linux"
Date: 2007-03-14
Author: "Baptiste Mathus"
---



Je reprends le titre du [billet de NiKo de
PuC](http://www.prendreuncafe.com/blog/post/2007/03/14/Aidez-a-populariser-Linux).

Au cas où vous auriez raté ça dans l'actualité, [Dell envisage de livrer
des configurations avec des Linux
préinstallés](http://www.dell.fr/content/topics/global.aspx/corp/linux?s=corp).
Allez donc remplir leur
[sondage](http://www.dell.fr/content/topics/global.aspx/corp/linux?s=corp)
afin de leur montrer que les utilisateurs de Linux existent bel et bien.

En distribution, j'ai mis Ubuntu, puisque c'est à mon sens la seule
réponse sérieuse aujourd'hui.

Plus sérieusement et sans pousser gratuitement au troll comme dans ma
phrase précédente, pour la petite histoire : j'ai commencé à utiliser
Linux au début de mon DUT, Informatique c'était en 2000. Je ne
connaissais comme OS que Windows. J'avais pas mal bidouillé Windows 95
et 98, mais pas trop les précédentes versions puisque je n'ai vraiment
commencé à m'intéresser à l'informatique que lorsque j'étais en seconde.

### Slackware, un Linux pour les unixiens...

La première distribution que j'ai installée fut donc une Slackware (à
prononcer avec l'accent Ukrainien,
[Kostia](http://www.univ-paris12.fr/lacl/jaf/participants/verko.html),
si tu m'entends ;o)). Je peux vous garantir que j'ai lutté. Il m'a déjà
fallu plusieurs jours avant d'abandonner et de rapporter enfin le CD que
Kostia m'avait passé pour m'entendre dire : “Aaaaah, mais ce sont les
sources !”... Pour vous dire à quel point j'étais une tanche. Je ne me
souviens pas s'il est excusé de s'être trompé de CD. Toujours est-il que
je suis donc reparti avec un CD et un espoir flambant neufs. Au bout
d'une bonne dizaine de tentatives (je suis arrivé plusieurs fois à la
fin de l'install, mais comme j'avais peur de merder quelque part,
lorsqu'il manquait quelque chose d'important je recommencais tout à
zéro. Une habitude issue de windows, sûrement :-D).

En résumé, la slackware, pas simple. Faut aimer
`./configure&&make&&make install` en tout cas...

Bref, c'était pas le top. Il fallait passer à autre chose.

### Mandrake, the solution pour les newbies... Mouai...

C'est un peu comme ça qu'on me l'a vendue en fait. Je crois qu'à cette
époque, j'étais aide-administrateur à temps partiel, en plus du DUT, des
machines du département informatique, avec Peter. J'ai découvert ce à
quoi pouvait ressembler de l'administration système. Je vous avoue que
j'en ai un souvenir mitigé : à la fois intéressant, parce que j'ai
indéniablement appris des trucs, surtout sur Linux grâce à Peter, mais
aussi incroyablement chiant ces tâches répétitives d'install de x postes
à l'identiques, même en passant par des images...

Tout ça pour dire, donc, que l'école utilisait des Mandrake 8. Je crois
plus précisément que la Mandrake 8.0 était sortie récemment et que nous
l'avions installée sur tous les postes. Si je ne me trompe toujours pas,
je me souviens que c'est à la même époque qu'est sortie la RedHat 7,
qu'André arborait fièrement. De mémoire, toujours, je crois qu'André a
installé la RH7 et nous a sorti : “cette fois, je passe à Linux, c'est
pour de bon”. Je pense qu'André a prononcé ensuite plusieurs fois cette
phrase dans les 2 années qui ont suivi, Dédé si tu m'entends :-).

J'ai donc installé sur ma machine une Mdk8... “Énorme”, qu'on m'avait
dit. “L'outil rpm déchire, tu verras”, et tout et tout... Mon cul, oui !
À l'époque, pour installer un rpm alors que tu n'étais qu'un newbie,
fallait bien s'accrocher au lecteur de cd pour pas vomir. Aucune gestion
des dépendances, donc yavait intérêt à avoir tout sur place. Je me
souviens encore de la commande, tiens : ''rpm -Uivh' leRpm.rpm' (j'ai un
doute sur la casse des options). Bref, toujours pas génial tout ça.

### Debian, et la lumière fut

*En fait, je me rends que je vous raconte ça dans un léger désordre et
une certaine inexactitude, mais c'est pas très grave. J'ai dû récupérer
la Mdk8 avant d'être admin sys, puisqu'il me semble justement que c'est
le fait d'avoir été admin sys qui m'a permis de mieux connaître Peter.
Comme c'est Peter qui m'a convaincu d'installer Debian, doit y avoir un
truc comme ça. C'est pas grave, je suis pas loin de la réalité,
l'essentiel c'est que j'en arrive à vous parler de Debian, ou plutôt de
Debian et moi :-).*

Peter m'a donc poussé à installer la Debian. Heureusement, parce que
c'est vrai qu'à l'époque, vu mon niveau, je ne sais pas si j'aurais
franchi le pas si tôt. La Debian était en effet réputée pour être
complexe à installer, limite imbitable. Les légendes urbaines, tout ça.

Bon, je me disais qu'après la Slackware, ça pourrait pas être pire.
Donc, je me suis lancé. Effectivement, pour un windowsien habitué au
suivant-suivant, c'était un peu surprenant cette interface mode texte.
Mais finalement, une fois l'étape du partitionnement franchie, le reste
n'était en gros qu'une suite d'appui sur la touche entrée. Le plus long
consistait à choisir les packages qu'on souhaitait installer. Si on
décidait de dire oui ou non à chaque paquet, fallait vraiment être à
bloc, parce qu'on en voyait pas le bout. Bon, après tout, pas long pour
rien le bazar.

Une fois l'installation de base franchie, on commencait à saisir toute
l'ampleur de la magnificence de la Debian : apt-get. The *killer-app*
comme on dit en bon françois. Gestion des dépendances : tu demandes
gnome, il t'installe gnome et tout ce dont gnome a besoin. En gros, tu
tapes *apt-get install gnome*, tu attends que tout soit téléchargé,
installé et configuré, ça te rend la main et tu peux lancer gnome !

Depuis cette époque, je suis resté sur Debian. En fait, sur des
dérivées. J'ai essayé Knoppix, suis passé par Kanotix, deux fois,
distrib sur laquelle je tourne encore aujourd'hui sur *pumte*, ma
dernière machine, un Dell Inspiron 8600 justement, que j'ai depuis
environ 2 ans.

Donc, Debian, c'est clair, ya pas mieux. Apt-get est tout simplement
géniale. rpm à côté, à l'époque où je l'ai laissé, c'était de la merde
en boîte. Alors, pourquoi j'irais réessayer des distrib qui ne se sont
pas rendues à l'évidence qu'un système comme apt qui existait depuis si
longtemps et fonctionnait si bien était forcément la direction à suivre.
Franchement, je ne comprends pas pourquoi Mandrake, Opensuse et les
autres continuent à jouer avec leurs petits outils à côté d'apt-get, the
Legend :-).

Allez, bonne nuit et faites passer le message :-).

