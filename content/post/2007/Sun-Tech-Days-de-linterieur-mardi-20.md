---
Title: "Sun Tech Days de l'intérieur, mardi 20"
Date: 2007-03-21
Author: "Baptiste Mathus"
---



J'étais donc aux [Tech
Days](http://fr.sun.com/sunnews/events/2007/mar/techdays/index.jsp)
aujourd'hui. Encouragé par des "moins scrupuleux" que moi, je me suis
aussi levé pour dire bonjour à [Alexis
Moussine-Pouchkine](http://blogs.sun.com/alexismp/), que je n'osais pas
déranger parce qu'il avait l'air à bloc pour préparer/peaufiner sûrement
sa session de cet après-midi :-) (ce qu'il m'a confirmé ensuite, la
session avec [Stéphane
Goudeau](http://www.microsoft.com/france/msdn/annuaire/xml/stephgou.xml)
sur WSIT, plus précisément :p).

De façon très inégale, j'ai pris quelques notes au cours de chacune des
sessions. Je vais essayer de vous faire un rapide topo de ce à quoi j'ai
assisté et ce que ça m'évoque. Après, je vais dormir pour réussir à me
réveiller tout à l'heure :-).

### Keynote session : James Gosling

Ça faisait longtemps que je ne n'avais pas entendu quelqu'un parler
anglais, j'ai donc mis quelques minutes à m'habituer à son accent, que
je qualifierais d'américain malgré le fait qu'il soit Canadien il me
semble :-). Une fois lancé, j'ai ensuite pu comprendre facilement
[Rags](http://weblogs.java.net/blog/rags/) ou [Rima
Patel](http://weblogs.java.net/blog/rpatel/) (soit dit en passant, j'ai
été amusé de remarquer qu'ils avaient tous les deux un portable Ferrari,
vous savez celui [tout en
rouge](http://www.comparestoreprices.co.uk/images/fe/ferrari-3000-amd-notebook-laptop-pc.jpg)).

Pour rester dans l'anecdotique, ça ne va pas intéresser grand monde,
mais comme j'avais déjà joué avec, j'ai pu remarquer que [James
Gosling](http://blogs.sun.com/jag/) utilisait toujours
[Huckster](https://huckster.dev.java.net/) pour faire sa présentation.
J'ai trouvé ça propre et joli. J'avoue que ça m'a donné envie de
l'utiliser à nouveau :-).

Sinon, au niveau du contenu, James a survolé un peu tout ce qui fait
Java aujourd'hui. Du client léger au mobile, en passant par les tests de
l'A380 et le temps réel. Une phrase qui m'a amusé, mais finalement pas
tant surpris que ça. Il a dit : “For me, the java language is almost
uninteresting.”. Sorti du contexte, ça pourrait faire une bonne news à
troll sur TSS. En fait, ce qu'il a évidemment précisé, c'est que c'est
surtout la JVM et sa portabilité sur des plates-formes potentiellement
très hétérogènes qui l'intéresse :-).

### Sun Technical Demo(s)

En l'espace de quelques dizaines de minutes, nous avons eu droits à 6
démos. Je le dis, les deux les plus impressionnantes ont été pour moi
celle de Romain Guy montrant [Aerith](http://aerith.dev.java.net) en
fonctionnement et celle d'un certain Peter (pas entendu/noté le nom,
désolé) qui m'a bluffé sur du dév sur téléphone portable. De mémoire :

Développement client léger
--------------------------

Pas trop bien compris. Ça ressemblait plus à du flash qu'à du Java sur
une page Web (ou alors, c'était sûrement une Applet). L'objectif était
de montrer qu'on pouvait faire une jolie page web avec Java EE. Pourquoi
pas.

Aerith : Romain Guy
-------------------

[Aerith]() montre qu'on peut faire en Swing des applis avec un design de
fou furieux. Si vous voulez tester, vous pouvez lancer assez facilement
aerith directement depuis le lien Java Web Start (jnlp).

Aerith est un Mashup. Il utilise les WS de Flickr, de Google Maps et la
localisation Yahoo si j'ai bien compris... Époustouflant.

Développement JSF avec Netbeans : Doris Chen
--------------------------------------------

NetBeans semble effectivement bluffant de simplicité pour du dév Web.
Quand je vois comment on rame pour nos JSP avec Eclipse, je
m'interroge...

Par contre, JSF, JSF, JSF, JSF, ou alors JSF si j'ai bien compris

Java DB
-------

Dans un client Web (Firefox :)), Francois Orsini nous montre qu'il peut
saisir des données et tuer Firefox. Lorsqu'il rouvre l'application, il
retrouve ses données telle qu'il les avaient saisies sans avoir pourtant
cliqué sur un bouton de soumission. En fait, par Ajax, à chaque
modification de champs, le client envoie les données au serveur qui les
stocke.

Certes, la fonctionnalité est intéressante pour éviter le syndrôme de la
perte des données dans un formulaire en cours de saisie. Mais, je ne
vois pas bien le rapport direct avec Derby : la partie la plus grosse du
code me semble résider dans l'Ajax qui stocke les données au fur et à
mesure, non ? N'importe quelle base côté serveur ferait ensuite
l'affaire il me semble.

jMaki : Ludovic Champenois
--------------------------

Sorte de wrapper à framework Javascript, jMaki a été mis à contribution
pour développer rapidement quelques pages Web et montrer l'intégration
simple et rapide de code Java directement dans le code Javascript. Ceci
a notamment permis par exemple d'utiliser java.util.Date en plein milieu
d'un code js. À creuser, à mon avis, mais très intéressant.

Développement Mobile
--------------------

Si j'ai bien suivi, Peter a ensuite fait en live du remote debugging,
posant en effet un point d'arrêt sur le code en cours d'exécution sur la
JVM du téléphone ! Après avoir pris Doris Chen en photo avec l'appareil,
il a imprimé sa photo sur l'imprimante, mais je n'ai pas bien compris ce
qu'il voulait montrer. En tout cas, c'était sympa.

### Glassfish : Alexis Moussine-Pouchkine et Ludovic Champenois

L'une des principales choses que j'ai retenue, ça tombe bien parce que
j'ai le sentiment que c'est l'une des choses sur lesquelles Alexis a
voulu insister : Glassfish n'est pas seulement une implémentation de
référence dans le sens où on pouvait l'entendre
habituellement^[[1](#pnote-251-1)]^.
[Glassfish](http://glassfish.java.net) est parfaitement utilisable en
production.

L'interface d'administration est agréable et l'outil asadmin permet de
gérer des choses comme l'ajout de Datasources, etc.. (euu, là, chui pas
sûr du tout). Glassfish intégre **JAX-WS**, beaucoup plus rapide qu'Axis
2, qu'y disaient.

Quelques notes en vrac :

-   Intégration de Comet : permet de créer des connexions persistantes
    HTTP, et donc de permettre au serveur de faire du callback.
-   Shoal : implémentation de clustering dynamique avec JXTA.
-   L'admin se fait avec JMX
-   Des extensions à JMX, des Application Servers Management eXtensions
    donc ? :-), des **AMX** sont aussi présentes.

### Extreme Gui Makeover : Romain Guy

Là, j'ai un peu merdé. Comme je n'avais pas re-regardé le planning. Je
me suis retrouvé à assister aux quelques premières minutes de la session
VMWare. J'ai donc changé de salle pour aller suivre une "Track" a priori
plus développement, plus code. J'ai pu voir quelques trucs bien
agréables pour améliorer la tronche des composants Swing ou en
simplifier le développement :

-   un peu de code maison, pas forcément difficile mais qu'il faut tout
    de même trouver :-),
-   [SwingX](https://swingx.dev.java.net/)
-   [Timing Framework](https://timingframework.dev.java.net/)

### WSIT : Tangoing with .Net

Cette session a permis de rappeler les normes existantes ou en cours de
développement liées à WS. C'est Rags qui s'est occupé de la partie
"magistrale" :-). Alexis et Stéphane Goudeau (de MS), nous ont quant à
eux fait une jolie démo de l'interopérabilité Java/.Net, projet sur
lequel ils ont travaillé pour la DGME. Il a notamment été question
d'optimisation du transport des pièces jointes avec les WS en utilisant
deux protocoles/principes (?) :

-   W3C SOAP Message Transfert Optimization Mechanism : **MTOM**
-   W3C XML-binary Optimized Packaging : **XOP**

La session s'est ainsi terminée par l'envoi depuis le code .Net d'une
image affichée ensuite sur le portable d'Alexis.

### SOA, WS, BPEL : Rima Patel

Après la session WSIT, j'ai quitté la grande salle pour rejoindre Rima
Patel afin de découvrir un peu ce qu'était BPEL, dont j'entends tant
parler mais dont je ne savais toujours pas ce qu'elle permettait de
faire concrètement.

Cette session a été intéressante pour rappeler une fois de plus ce que
doit être une Architecture Orientée Services. Un peu en vrac :

-   Un WS est une boite noire avec une interface bien définie (elle n'a
    pas utilisé le mot *contrat*, je trouve pourtant qu'il convient
    parfaitement bien).
-   SOA apporte de la valeur ajoutée sur le métier, pas sur la
    technique. Elle a même dit : c'est pour ça que ce sera votre CEO qui
    vous parlera peut-être de SOA, en raison de la valeur ajoutée métier
    qu'elle apporte (*Nota de moi : et qui donc est remontée dans les
    articles de 01 Informatique :-)*).

On a eu droit en fin de session à une démo de BPEL dans NetBeans. Comme
je voulais en savoir plus sur BPEL, je suis ensuite allé au TP pour
faire les exercices moi-même. J'avoue que le plugin BPEL, notamment le
debugger, de netbeans est impressionnant de simplicité. Le problème,
c'est que je n'ai pas eu le temps de faire le troisième exercice où on
rentrait un peu plus dans le code. Les deux premiers n'étant presque que
du clic-clic-bouton sur l'interface de netbeans sans forcément prendre
le temps de comprendre un peu plus BPEL. Comme j'ai le support,
j'essaierai de finir l'exercice pour voir s'il y a des choses
intéressantes à dire.

J'aurais aimé terminer la journée en allant au "FOSSDAY" sur "Langages
Libres, machines virtuelles et Web 2.0", mais j'ai préféré ne pas
arriver chez moi à 21h. J'ai pu voir un peu plus la famille pour une
fois que je passe dans la région parisienne (en coup de vent, en plus
:p).

Voilà pour aujourd'hui, bonne nuit :-).

#### Notes

[[1](#rev-pnote-251-1)] Lorsqu'une spécification est publiée, Sun
développe toujours une implémentation de référence pour montrer la
faisabilité du principe. Ces implémentations sont donc souvent basiques
et impropres à un usage en production. Ce n'est donc pas le cas de
Glassfish.

