---
Title: "ServerTokens, kééé ?"
Date: 2004-03-16
Author: "Baptiste Mathus"
url: "2004/03/16/6-servertokens-keee"
---



En lisant une fois de plus (un peu plus attentivement, faut-il croire)
le fichier de conf de mon serveur web, je suis tombé sur un des
paramètres de sécurité dont j'avais déjà entendu parler (ça fait déjà
deux choses aujourd'hui dont “j'ai entendu parler”, notez) : celui qui
indique le niveau de "verbosité" des réponses du serveur. Avec [Apache
2](http://www.apache.org/), il y a par exemple 6 niveaux de
configuration possibles (les numéros étant croissants avec
l'augmentation du niveau de sécurité du serveur) :

1.  Full
2.  OS
3.  Minor
4.  Minimal
5.  Major
6.  Prod

Si vous êtes un peu comme moi, vous devriez vous dire  : “Mais qu'est ce
que ce paramètre peut bien changer concrètement dans la réponse ?!?” Eh
bien, j'ai un début de réponse pour vous, bande de brigands. Je ne suis
toutefois pas allé jusqu'à regarder les en-têtes http envoyés (quoi
qu'en partie si en fait, mais je n'en parlerai pas ici (-:), j'ai
simplement regardé les modifications du niveau de détail dans le code
html de la page renvoyé en cas d'`erreur 404` (page introuvable) (ne me
dites pas que vous ne connaissez pas et n'avez jamais eu cette erreur,
je ne vous croierai pas...).

Voici donc les résultats de ce formidable test qui a bien
[dû](http://www.psydk.org/FrenchTips.php#f2) me prendre 15 minutes :-) :

1.  Full : Apache/2.0.48 (Win32) PHP/4.3.4 Server at localhost Port 80
2.  OS : Apache/2.0.48 (Win32) Server at localhost Port 80
3.  Minor : Apache/2.0 Server at localhost Port 80
4.  Minimal : Apache/2.0.48 Server at localhost Port 80
5.  Major : Apache/2 Server at localhost Port 80
6.  Prod : Apache/2 Server at localhost Port 80

C'est y pas formidable de savoir encore une chose de plus ? Que de
mystères nous reste-t-il à découvrir... Vers l'infini et au delààààà
---\>[] Au lit !

