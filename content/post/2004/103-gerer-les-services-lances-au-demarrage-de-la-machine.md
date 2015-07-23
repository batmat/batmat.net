---
Title: "Gérer les services lancés au démarrage de la machine"
Date: 2004-11-30
Author: "Baptiste Mathus"
url: "2004/11/30/103-gerer-les-services-lances-au-demarrage-de-la-machine"
---



Une personne a posé une
[question](http://lists.debian.org/debian-user-french/2004/11/msg02108.html)
hier soir sur la mailing-list debian au sujet des services que sa
Knoppix (distribution dérivée de [debian](http://debian.org)) lance au
démarrage.

Comme il n'était pas d'accord avec tout ce que la machine lancait, il a
essayé d'empêcher ça en supprimant les scripts présents dans
/etc/init.d... Je lui ai alors
[expliqué](http://lists.debian.org/debian-user-french/2004/11/msg02122.html)
comment faire mieux et plus propre à mon sens.

Voici donc l'explication en question revue un petit peu. Je pense
qu'elle évoluera s'il s'avère que j'ai dit des bêtises. Je suis bien sûr
conscient que ce type d'explications existe déjà en maints endroits,
mais je vais le refaire moi-même pour plusieurs raisons :

-   c'est une explication rapide destinée à un problème précis : éviter
    de démarrer des services inutiles. Ce n'est pas une explication
    complète du fonctionnement des runlevels sous Linux ;
-   ça me permet de mieux comprendre ;
-   avec tes yeux et tes connaissances, lecteur, si je raconte n'importe
    quoi, tu pourras me le dire. J'éviterai ainsi de continuer à
    raconter ledit n'importe quoi :-) ;
-   et **SURTOUT** ... je suis sur mon blog alors je fais ce que je
    veux, na !

### Les services sur debian (selon batmat, donc...)

Déjà, première chose, si on souhaite qu'un service ne soit *jamais
jamais jamais* lancé, a priori, la meilleure solution est de supprimer
le logiciel par `apt-get remove`.

Si on souhaite par contre le garder, mais qu'on ne veut pas qu'il soit
lancé au démarrage "normal" de ta machine, il vaut mieux simplement
supprimer le lien symbolique dans /etc/rcX.d.

**/etc/rcX.d ?**

Le noyau Linux fonctionne avec ce qu'on appelle des runlevels, des
niveaux d'exécution. Le runlevel par défaut est défini en haut du
fichier /etc/inittab (man inittab) par la ligne suivante :

    id:2:initdefault:

Le plus souvent, c'est comme ci-dessus le niveau 2 qui est utilisé pour
le démarrage "normal" (0 pour halt, 1 pour single-user : mode
sans-réseau en mode utilisateur unique, 2 à 5 pour les modes
multi-utilisateurs, 6 pour le reboot).

Il y a autant de /etc/rcX.d que de runlevels (i.e. X vaut de 0 à 6).
Dans le répertoire rcX.d tous les script commençant par S seront
exécutés à l'entrée dans le runlevel. Ceux commençant par K seront
exécutés au moment de la sortie du runlevel. Ces scripts ne sont en fait
que des liens symboliques vers ceux de /etc/init.d.

Si le runlevel 2 est aussi celui par défaut sur votre machine, il suffit
donc de regarder les /etc/rc2.d/S\* et de supprimer ceux qui
correspondent aux services qu'on ne veut pas lancer.

Comme ça, on garde la possibilité de démarrer simplement un service en
cas de besoin (en root /etc/init.d/un\_service start) sans pour autant
qu'il soit chargé tout seul au démarrage de la machine. C'est par
exemple ce que je fais pour Apache/MySQL que je n'utilise
qu'occasionnellement pour des tests et que je ne veux pas lancer
systématiquement sur mon poste de travail.

