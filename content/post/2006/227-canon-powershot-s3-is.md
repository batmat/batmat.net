---
Title: "Canon Powershot S3 IS"
Date: 2006-10-01
Author: "Baptiste Mathus"
---



Même si je suis déjà convaincu que le classement par répertoire est un
concept mort, le fait de ne pouvoir placer ce billet **que** dans la
catégorie Linux me le rappelle de façon un peu insolente... J'y
reviendrai.

Depuis quelques temps déjà, je voulais changer d'appareil. Les photos de
mon [Powershot
A80](http://www.cnetfrance.fr/produits/materiels/appareils_photo/test/0,39030521,39130609,00.htm)
commençait à être trop souvent floues à mon goût. Cela faisait donc
quelques mois que l'idée d'investir dans un nouvel appareil photo
numérique trottait dans nos têtes... L'achat s'est finalement porté sur
le [Powershot S3
IS](http://www.dpreview.com/reviews/CanonS3IS/Default.asp).

Ce qui m'a attiré dans cet appareil :

-   réputé pour être un très bon intermédiaire compact/reflex
-   mode vidéo impressionnant (640x480 à 30 images par secondes)
-   une évolution, avancée certes, de mon ancien appareil, donc plus
    rapide à appréhender
-   des dimensions correctes : identiques pour hauteur et largeur, 2
    fois plus large en profondeur
-   zoom 12x **optique**, 4x en numérique, avec stabilisateur de bonne
    qualité (dixit les spécialistes)
-   La vignette orientable, fonction qui m'avait d'ailleurs déjà fait
    choisir mon a80

![](/dotclear/images/s3is.jpg)

Ce qui m'embête un petit peu :

-   le protocole de connexion de Canon : certes, Canon a fait un très
    bon choix d'utiliser un protocole normé (PTP), mais ~~je ne
    comprends pas pourquoi les constructeurs ne choisissent pas plutôt
    systématiquement que l'appareil soit vu comme une clé USB par
    l'ordinateur.~~ Serait-ce parce que ce protocole est bidirectionnel
    et qu'il faut que l'appareil puisse envoyer un ordre, d'impression
    par exemple, pour pouvoir imprimer directement sur une imprimante
    compatible [PictBridge](http://fr.wikipedia.org/wiki/Pictbridge) ?
    Ça doit être ça...
-   le switch entre les modes de visualisation des photos prises et la
    prise de vue aurait pu être un rien plus ergonomique. Ça marche
    bien, mais je ne sais pas, je trouve que le bouton est un rien trop
    petit, peut-être. Mais ce n'est pas rédhibitoire, évidemment.
-   le flash qui ne sort pas seul. Alors, c'est certain, c'est bien pour
    les cas où on ne veut surtout pas de flash, mais je ne suis pas
    habitué à devoir penser à le sortir... Heureusement, l'appareil
    prévient toutefois lors de la prise de vue : si vous ne l'avez pas
    sorti et qu'il estime qu'il serait nécessaire, il l'indique sur
    l'écran. L'avenir me dira si ça me dérange vraiment ou pas :-).

##### Utilisation sous Linux

Pour récupérer les photos, quel que soit le système d'exploitation, il y
a deux solutions :

-   sortir la carte et la lire via un lecteur de carte ;
-   utiliser le câble USB fourni pour récupérer directement les photos
    en le branchant à l'appareil.

Je me suis dit que j'allais lire directement l'appareil. J'ai donc lancé
gtkam, le logiciel de gestion d'appareil photo numérique pour gnome et
essayer de récupérer mes photos. Impossible.

Après quelques recherches sur le net, j'ai compris que gtkam n'était en
fait qu'un frontend pour gphoto2. Si celui-ci n'était pas capable de
voir mon appareil, ce n'était même pas la peine d'ouvrir gtkam. Gphoto2
possède un mode où il est capable d'autodétecter l'appareil photo
branché à l'ordinateur, le problème, c'est que chez moi, ça donnait ça :

    baptiste@pumte:~$ gphoto2 --auto-detect
    Model                          Port
    ----------------------------------------------------------

En farfouillant un peu au hasard, je suis tombé sur un [bug report pour
digikam](http://sourceforge.net/mailarchive/forum.php?thread_id=7444192&forum_id=35249)
qui n'avait a priori aucun rapport avec mon problème. C'est cette phrase
qui a attiré mon attention :

> don't worry about the mount path (it's an internal thing). if you have
> commandline gphoto2 installed, try this commands:
>
> gphoto2 --auto-detect gphoto2 -l
>
> try both as user and as root

Tiens ? Aaaah, mais ouiii, c'est peut-être un problème de droit.
J'essaie :

    baptiste@pumte:~$ sudo gphoto2 --auto-detect
    Model                          Port
    ----------------------------------------------------------
    Canon PowerShot S3 IS (PTP mode) usb:

Bingo ! Je prends même le temps d'essayer aussi avec l'A80.

    baptiste@pumte:~$ sudo gphoto2 --auto-detect
    Model                          Port
    ----------------------------------------------------------
    Canon PowerShot A80 (normal mode) usb:

Parfait. Tout fonctionne très bien en fait. Il ne me reste donc plus
qu'à gérer la sécurité pour autoriser *baptiste* à utiliser les
appareils photo numériques. Pour info, sachez que ce genre de chose est
souvent gérée par l'intermédiaire d'un groupe sous Linux. Ces groupes
sont déclarés dans le fichier /etc/group. Chaque ligne définit un
groupe, pour que *baptiste* fasse partie du groupe *pouet*, il suffit
d'ajouter baptiste à la liste des utilisateurs déclarés sur la ligne du
groupe, après le ":", simple.

Il est même possible de lancer le logiciel qu'on désire au branchement
de l'appareil, j'ai trouvé une documentation complète qui explique
comment faire. C'est là que j'ai trouvé que le groupe duquel il faut
faire partie pour accéder aux APN est *camera*.

Soit vous faites `adduser votreuser camera` en mode texte dans une
console. Soit vous pouvez toujours passer par l'interface graphique.
Sous gnome, ça donne ça : dans le menu Administration/Utilisateurs et
groupes :

![](/dotclear/images/gnome/gnome-groups.png)![](/dotclear/images/gnome/gnome-membre-groupe-camera.png)

Une fois ces manipulations effectuées, gtkam est totalement fonctionnel.
L'auto-détection est opérationnelle, je peux récupérer mes photos et
tout va pour le mieux dans le meilleur des mondes. Je ne sais trop que
penser de la mini-mésaventure que j'ai vécue dans la détection de mon
appareil. Est-ce un bug ? Ou plutôt devrait-on le considérer comme tel ?
Je ne pense pas. Toutefois, il est vrai que des utilisateurs moins
expérimentés auraient pu y passer un temps bien plus important sans
trouver de réponse claire (l'un des buts de ce billet, d'ailleurs). Sous
Linux lorsqu'on vient de windows, il faut assimiler une chose très
importante issue du monde unix : **les droits**. Soit vous avez droit
d'accéder un fichier, soit vous ne l'avez pas. Si ce n'est pas le cas
que ça ne devrait pas être ainsi, il faudra demander à l'administrateur
de changer cet état de fait. Ce n'est pas un bug, ce n'est que de la
configuration. Ce n'est évidemment pas fait que pour faire chier
l'utilisateur, mais pour le protéger, lui et surtout les autres dans le
cas où l'utilisateur en question serait malveillant. En procédant ainsi,
vous limitez les risques qu'un utilisateur inexpérimenté n'accède à des
choses qu'il ne devrait pas. Le même principe est présent sous Linux
pour l'accès au graveur de CD, l'accès au clés USB, etc. Au final, c'est
simplement l'habitude d'accéder à tout sans jamais poser de questions
qui doit changer.

Après, que les logiciels qui gèrent cela vous préviennent lorsque vous
possédez des droits limités (cf. ce que fait par exemple k3b, le
logiciel de gravure de KDE) me paraît évidemment une très bonne chose,
lorsque c'est possible, mais c'est un autre débat. Le système
sous-jacent de gestion des droits n'est alors plus en cause.

Pour finir, voici un tout petit extrait sans prétention aucune de ce que
fait le S3 IS. Il possède une fonctionnalité amusante (faisable aussi
après coup sur ordinateur, je le reconnais) qui permet de passer sur une
image tout en noir et blanc, sauf pour une couleur indiquée :

![Toulouse, dimanche 1er octobre, 18h](/dotclear/images/photos/test.jpg)

