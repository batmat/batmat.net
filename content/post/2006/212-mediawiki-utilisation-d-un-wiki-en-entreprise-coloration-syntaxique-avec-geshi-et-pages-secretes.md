---
Title: "Mediawiki, utilisation d'un wiki en entreprise, coloration syntaxique avec GeSHI et pages secrètes"
Date: 2006-01-21
Author: "Baptiste Mathus"
---



Depuis maintenant un peu moins d'un an,
[Mediawiki](http://www.mediawiki.org/wiki/) a été installé dans mon
entreprise.

C'est un peu amusant, parce que je pense en être le principal
instigateur, mais je ne peux pas le dire avec certitude. En effet, à
l'époque, j'en parlais en effet souvent à celui qui allait devenir mon
responsable aujourd'hui. Je discutais avec lui de toutes ces
technologies, de tous ces outils modernes, connus ou moins connus, à la
mode pour des raisons justifiées ou non.

Je lui parlai donc de ce qu'était un wiki, lui expliquai le principe.
“Une bonne démo valant mieux que de longs discours”, ainsi pourrait-on
détourner la formule consacrée, je lui montrai successivement
[ChuWiki](http://chuwiki.berlios.de), puis Mediawiki. Je me souviens que
c'est à ce moment que, sentant que de l'intérêt était présent face à
moi, j'ai beaucoup cherché des arguments me permettant de mieux défendre
l'idée d'utiliser un wiki dans l'entreprise. Je cherchais surtout ces
arguments pour convaincre si besoin les responsables de l'entreprise.

Pour moi, l'intérêt majeur d'un wiki d'entreprise réside dans la
centralisation de la documentation. Toutefois, il ne fallait pas que le
wiki impacte le processus de certification qualité en cours de mise en
place, utilisant déjà largement word et ses modèles... Je défendai donc
la pertinence du wiki pour ce que j'estime être sa plus grande utilité :
la rédaction de toutes ces petites documentations, ces FAQ, qui
devraient être utilisables et modifiables par tous, tout le temps. Mais
aussi **SURTOUT** qu'on puisse être certain de disposer toujours de la
dernière version d'une doc, ce qui est loin d'être trivial lorsque vous
travaillez avec des gens qui ont pris l'habitude depuis longtemps de
passer leur temps à s'échanger des fichiers word par mail.
Personnellement, ma plus grande hantise lorsque je dois écrire une
documentation avec un traitement de texte est de savoir où je vais bien
pouvoir la mettre... Avec un wiki, je ne m'occupe que de choisir un nom
de page qui exprime le plus clairement possible son contenu (sémantique,
mon enfant, sémantique, ya qu'ça de vrai !), le stockage n'est plus mon
problème.

Un jour, Lionel est revenu me voir en me disant : “Bon, la direction
veut qu'on installe un wiki, rapidement.”. Je pense que ceci est arrivé
parce qu'à l'époque, 01 Informatique commencait à en parler. Alors,
comme ça faisait un peu plus "DSI-hype" qu'avant, on a eu carte blanche
pour le monter. Dès la semaine suivante, la moitié du centre de
développement était invitée à une présentation/formation sur le sujet,
faite par Lionel, à laquelle j'ai assisté pour l'assister :-).

### Formation Wiki

La formation devait partir de très loin. Une partie non négligeable des
développeurs de l'entreprise utilisent encore leur navigateur de façon
très épisodique, et ne connaissent que les outils qu'ils utilisent
depuis longtemps. Il fallait donc parfois non seulement expliquer ce
qu'est le code wiki, mais aussi montrer qu'on pouvait changer le nom par
la barre d'adresse du navigateur, etc.

Cette formation avait évidemment pour objectif de présenter la
philosophie générale d'un wiki, en plus de son utilisation. Ceci nous
paraissait indispensable de présenter notre wiki de la sorte afin
d'éviter que l'auditoire ne prenne par exemple le wiki pour un simple
marque-page vers les documents word actuels ou futurs qui continueraient
à être disséminés sur les serveurs de l'entreprise...

### Coloration syntaxique avec GeSHI

Le wiki a continué à grossir et à prendre sa place. Il a été modifié
très majoritairement par Lionel ou moi jusqu'à récemment. Les projets
actuels ont fait que nous l'avons beaucoup utilisé pour documenter notre
processus de développement J2EE. Nous mettons ainsi beaucoup de code
Java et (X)HTML.

Plus cela allait, plus il nous apparaissait indispensable de chercher à
ajouter la coloration syntaxique au wiki, afin d'améliorer la lisibilité
des différents morceaux de code présents. J'ai donc cherché une solution
et trouvé l'[extension GeSHI pour
mediawiki](http://meta.wikimedia.org/wiki/GeSHiColor_Extension). En
suivant précisément la documentation fournie, l'installation de
l'extension prend 5 minutes maximum. Appliquez bien les bugfix spécifiés
sur le lien ci-dessus.

La première question qui vient à l'esprit pour tout utilisateur de CSS
est de se demander quelle est la forme du code généré par GeSHI. Et
bien, c'est très propre. Par défaut, le code généré utilise les styles
inline pour colorer le texte. Il est toutefois simplissime de modifier
ce comportement. En lisant la [documentation de
GeSHI](http://qbnz.com/highlighter/geshi-doc.html#using-css-classes), on
trouve l'appel à la méthode `enable_classes(true)`.

Ajoutez simplement `$geshi->enable_classes(true);` avant le return de la
fonction formatCode de l'extension et ça marche ! Après, il vous reste
bien sûr à écrire le code CSS pour mettre la forme et les couleurs qui
vous conviennent.

*Note : J'ai essayé l'extension sur la dernière version actuelle
(Mediawiki 1.5.5). Pour faire ça, j'ai dû migrer de la version 1.4.3
vers la dernière. Suivez la [documentation de mise à
jour](http://meta.wikimedia.org/wiki/Upgrade_Mediawiki) à la lettre
(notamment la mise à jour de latin1 vers utf8 si besoin, primordiale) si
vous êtes dans le même cas que moi*.

#### Ajouter un bouton pour encadrer votre code Java

J'ai voulu ajouter un bouton pour ajouter rapidement les balises \<code
type="java"\>\</code\> autour du code sélectionné, à la manière de ce
que permettent les autres boutons pour mettre en valeur, faire un lien,
etc.

C'est très simple à faire :

-   Ouvrez le fichier EditPage.php et cherchez la fonction
    `getEditToolbar()`.
-   Copiez-collez un bloc qui définit un outil, à la fin par exemple :

<!-- -->

    array( 'image' =>'button_hr.png',
                        'open'  =>   "\
    \
    ",
                        'close' =>   '',
                        'sample'=>   '',
                        'tip'   =>   wfMsg('hr_tip'),
                        'key'   =>   'R'
                    )

Et remplacez ce qui doit l'être pour faire ce que vous voulez :

    array( 'image' =>'button_java.png',
                        'open'  =>   "<code type="java">\
    ",
                        'close' =>   '</code>',
                        'sample'=>   '',
                        'tip'   =>   wfMsg('codeJava_tip'),
                        'key'   =>   'J'
                    )

Ceci fait, il vous reste deux choses à faire :

-   Ajoutez l'image que vous voulez pour faire votre bouton pour le code
    Java
-   Ouvrez le fichier de localisation correspondant à la configuration
    de votre wiki et ajoutez, derrière celle du hr\_tip par exemple, la
    ligne :

<!-- -->

    'codeJava_tip'        => 'Code Java',

Ça y est, ça marche. Vous avez la coloration syntaxique et un joli
bouton pour gagner du temps :-). Je vous laisse en exercice la
manipulation précédente pour insérer un bouton pour du code XML :-).

### Cacher des pages

Revenons à mon entreprise. Il a été question récemment de savoir où nous
allions bien pouvoir stocker les mots de passe utilisables par notre
équipe... Ça commence à faire du monde... Les utilisateurs/mots de
passes de :

-   connexion ssh au serveur web du wiki ;
-   connexion phpmyadmin à la base mysql du wiki ;
-   connexion ssh au serveur cvs (oui, je sais, bientôt passer à
    [svn](http://batmat.net/blog/2004/10/13/88-subversion), c'est dans
    le tube :p)
-   etc.

Étant donné que le wiki est devenu l'emplacement le plus logique pour
nos documentations communes, j'ai naturellement pensé à utiliser des
[pages invisibles](http://meta.wikimedia.org/wiki/Hidden_pages) à
d'autres que nous. Étant donné que nos comptes sont tous sysop, cela
doit bien être possible sans trop d'efforts.

Après quelques investigations, il s'est avéré que c'était un peu moins
simple que prévu, étant donné que ce n'est pas un comportement standard
et intégré à mediawiki. En effet, il existe la possibilité de définir
des pages en lecture seule, mais pas d'empêcher carrément la lecture. La
raison énoncée est que ce n'est pas la volonté d'un wiki de permettre le
masquage d'une partie de l'information. Toutefois, [cette fonction est
maintenue sous forme de
patch](http://bugzilla.wikimedia.org/show_bug.cgi?id=1924) pour certains
contextes, tels qu'une entreprise, où ce type de page peut s'avérer très
utile.

J'ai donc testé le patch en question sur mediawiki 1.5.5. J'ai utilisé
le principe de namespace secret. Celui-ci fonctionne parfaitement. Si
vous souhaitez mettre en place cette fonctionnalité sur votre mediawiki,
voici une version raccourcie et simplifiée de la configuration à ajouter
en fin de votre LocalSettings.php :

    $wgExtraNamespaces = array(100 => "Secret", 101 => "Discussion_secrète");
    $wgRestrictedNamespaces = array(100 => "namespacePriv", 101 => "namespacePriv");
    $wgGroupPermissions['sysop']['namespacePriv']      = true;

Ces trois lignes définissent un namespace Secret (exemple : la page
bonjour du namespace Secret s'appelle *Secret:Bonjour*) et sa page de
discussion associée "Discussion secrète" (attention à enregistrer votre
fichier en utf8 si vous voulez voir l'accent de secrète s'afficher
correctement). Tous les utilisateurs appartenant au groupe standard
sysop pourront voir et éditer ces pages.

Notons que le patch est bien fait : si vous n'êtes pas de ce groupe,
vous ne verrez pas apparaître les modifications sur ces pages dans vos
"Modifications récentes". Ça peut paraître évident, mais heureusement
toutefois que c'est fait afin d'éviter que des utilisateurs puissent
avoir envie de hacker la lecture de ces pages en les voyant sans cesse
dans les pages modifiées. Bien sûr, si un utilisateur qui n'est pas du
bon groupe tape directement le nom d'une page cachée, il ne pourra tout
de même pas la voir, donc tout va bien :).

* * * * *

Voilà, ce sera tout pour aujourd'hui. Je vous laisse passer une agréable
fin de week-end et à bientôt.

