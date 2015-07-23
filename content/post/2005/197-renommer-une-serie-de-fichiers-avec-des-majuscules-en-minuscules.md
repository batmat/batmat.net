---
Title: "Renommer une série de fichiers avec des majuscules en minuscules"
Date: 2005-10-07
Author: "Baptiste Mathus"
url: "2005/10/07/197-renommer-une-serie-de-fichiers-avec-des-majuscules-en-minuscules"
---



Un peu pour pour toi lecteur chéri, mon amour, mais surtout pour moi
parce que j'ai souvent besoin de ça et que ça me fera un bon endroit
pour retrouver l'info. Voici une petite commande très rapide pour
renommer facilement un ensemble de fichiers possédant des majuscules de
façon plus ou moins "désordonnées".

Mon problème, en l'occurrence, est que IMG\_3.jpg est différent sous
Linux de img\_3.jpg ou encore de ImG\_3.jpg. Ce n'est pas très grave en
soi, je préfère cette différenciation majuscules/minuscules. Mais
lorsque tout n'est pas en minuscules, ou en majuscules, ça peut parfois
être chiant : ma copine a un répertoire de photos, listées sous windows.
Je suis censé avoir les mêmes, mais il semble m'en manquer une parce
qu'elle en a 76 et moi 75... Alors, je trie par ordre alphabétique les
photos... Le problème c'est que **A** vient après le **z** et non après
le **a** sur mon système, contrairement à windows qui trie sans regarder
la casse.

Un peu chiant pour comparer une liste de photos à l'oeil nu, vous en
conviendrez. Donc, je me décide à renommer d'un coup toutes les photos
de mon disque (au nombre de 1700 actuellement). De toute façon, ça fait
longtemps que je le prévoyais, je préfère : ce sera plus homogène.

La commande qui permet de faire ça d'un coup d'un seul :

    $ rename 'y/A-Z/a-z/' *

