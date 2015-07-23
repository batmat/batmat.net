---
Title: "De l'intérêt de Docker pour tout développeur !"
Date: 2014-10-02
Author: "Baptiste Mathus"
url: "2014/10/02/de-linteret-de-docker-pour-tout-developpeur"
---

Dans l'article qui suit, je vais vous montrer comment j'ai récemment eu l'occasion
d'utiliser Docker pour un cas concret. 

La particularité ici est que cela était un cas utile à un travail de développement : 
cela n'avait pas pour but de faire tourner une application, 
simplement d'accéder à un environnement (via Docker, donc), de récupérer des informations, 
puis de jeter. 

Pour ce cas, j'estime avoir gagné au bas mot plusieurs dizaines de minutes.

Le contexte
-----------

Alors que je travaillais sur une 
[pull request pour le projet maven-scm](https://github.com/apache/maven-scm/pull/21),
j'ai eu besoin pour les tests d'intégration d'une vieille version de Subversion
(oui, j'utilise Git sinon :-)).

Plus précisément, j'avais besoin de pouvoir faire un checkout d'un dépôt SVN avec
les métadonnées au format SVN 1.6.

Or, ma machine est à jour, et la version que j'ai en local est une récente 1.8.8...

Que faire ?

* Rétrograder la version de ma machine ? Bof, pas trop envie de risquer de péter mon existant.
* Une VM ? Où ? En local ? Pfiou, ça va être long... En IaaS ? Bof.
* ...

Mais dis-donc !

Docker à la rescousse
---------------------
Au final, cette manipulation m'a pris maximum 5 minutes. Le plus long a été de trouver sur 
[Google la version du paquet debian correspond à SVN 1.6](https://www.google.fr/search?q=debian+svn+1.6) 
la bonne version de Debian (pour aller au plus simple, puisqu'on pourrait aussi prendre une version plus 
récente et tenter d'installer une version spécifique de SVN).

Sur https://packages.debian.org/search?keywords=subversion, donc :

```
Paquet subversion
squeeze (oldstable) (vcs): Système de contrôle de version avancé 
1.6.12dfsg-7: amd64 armel i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 sparc
wheezy (stable) (vcs): Système de contrôle de version avancé 
1.6.17dfsg-4+deb7u6: amd64 armel armhf i386 ia64 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc s390 s390x sparc
wheezy-backports (vcs): système de gestion de version évolué 
1.8.10-1~bpo70+1: amd64 armel armhf i386 ia64 kfreebsd-amd64 kfreebsd-i386 mipsel powerpc s390 s390x
jessie (testing) (vcs): système de gestion de version évolué 
1.8.10-2: amd64 arm64 armel armhf i386 kfreebsd-amd64 kfreebsd-i386 mips mipsel powerpc ppc64el s390x
sid (unstable) (vcs): système de gestion de version évolué 
1.8.10-2: alpha amd64 arm64 armel armhf hppa hurd-i386 i386 kfreebsd-amd64 kfreebsd-i386 m68k mips mipsel powerpc ppc64 ppc64el s390x x32 
1.8.8-2: sparc 
1.7.13-3 [debports]: sparc64 
1.6.17dfsg-3 [debports]: sh4
```

OK, on va donc partir sur une version stable.


```
$ sudo docker run --rm -it debian:stable /bin/bash
root@d2645d786f6e:/# apt-get update
[snip]
root@d2645d786f6e:/# apt-get install subversion zip
[snip]
root@d2645d786f6e:/# svn --version
svn, version 1.6.17 (r1128011)
   compiled Mar 12 2014, 02:44:28
[snip]
root@d2645d786f6e:/# svn co -N http://svn.apache.org/repos/asf/maven/pom/trunk/asf/
A    asf/pom.xml
A    asf/site-pom.xml
 U   asf
Checked out revision 1629441]
root@d2645d786f6e:/# zip -rq asf.zip asf
```

Ensuite, depuis le _host_, dans un autre onglet de votre émulateur de terminal favori :

```Shell
$ sudo docker ps
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
dbd6d39cbdb1        debian:stable       "/bin/bash"         25 minutes ago      Up 25 minutes                           sick_archimedes
$ sudo docker cp sick_archimedes:/asf.zip .
$ unzip -t asf.zip 
Archive:  asf.zip
    testing: asf/                     OK
    testing: asf/.svn/                OK
    testing: asf/.svn/dir-prop-base   OK
    testing: asf/.svn/props/          OK
    testing: asf/.svn/entries         OK
    testing: asf/.svn/all-wcprops     OK
    testing: asf/.svn/tmp/            OK
    testing: asf/.svn/tmp/props/      OK
    testing: asf/.svn/tmp/prop-base/   OK
    testing: asf/.svn/tmp/text-base/   OK
    testing: asf/.svn/prop-base/      OK
    testing: asf/.svn/prop-base/pom.xml.svn-base   OK
    testing: asf/.svn/prop-base/site-pom.xml.svn-base   OK
    testing: asf/.svn/text-base/      OK
    testing: asf/.svn/text-base/pom.xml.svn-base   OK
    testing: asf/.svn/text-base/site-pom.xml.svn-base   OK
    testing: asf/pom.xml              OK
    testing: asf/site-pom.xml         OK
No errors detected in compressed data of asf.zip.
```

Et voilà, en à peine quelques minutes, j'ai mon checkout, je jette mon conteneur, et je continue.

Je sais pas vous, mais moi c'est ce genre de petit exemple tout simple qui me place 
du côté de ceux qui disent que Docker n'est pas une simple nouveauté, mais effectivement 
une véritable révolution !
