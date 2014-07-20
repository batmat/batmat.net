---
Title: "Un logiciel anti-standards"
Date: 2004-04-30
Author: "Baptiste Mathus"
---



### Les Web Standards

[Absolute HTML Compressor](http://www.serpik.com/ahc/), moi j'aurais
plutôt appelé ça deletor ou corruptor...

Depuis que je m'intéresse au monde des standards du web, je remarque
beaucoup plus les immondices en terme de html qui peuvent traîner sur le
net. Je pense que c'est dû comme toujours à l'effet de loupe, je
n'aurais en effet pas eu l'idée il y en encore un an de regarder
systématiquement le source html d'un site qui me plaisait graphiquement.

Donc, en surfant tel un webfool (mouai...), j'ai encore été
[brusqué](http://www.serpik.com/ahc/). Je ne sais pas ce qu'en pensent
les autres ni si ce logiciel a déjà été décrié, mais en lisant les
[*features*](http://www.serpik.com/ahc/#info), j'ai eu à la fois envie
de rire et de taper.

### Les "fonctionnalités"

En vrac, en voici donc les "meilleures" fonctionnalités de ce formidable
outil :

-   merge lines;
-   remove unnecessary whitespace characters

Ça commence déjà très fort... Après le passage de ce rouleau
compresseur, vous pouvez oublier l'édition de fichier avec un simple
éditeur, le source devient tout simplement illisible ! (cf. le [source
du site de l'éditeur](http://www.serpik.com/ahc/))

-   remove unnecessary quotation marks. For example, \<table BORDER="0"
    CELLSPACING="0" CELLPADDING="0" align="center"\> will be converted
    to \<table BORDER=0 CELLSPACING=0 CELLPADDING=0 align=center\>;
-   replace some tags with the short ones - replace STRIKE tags with S,
    STRONG with B and EM with I

Pas mal ça, non ? Comment aller dans le sens contraire de la norme ?

-   remove HTML comments. The comments within the scripts and styles
    aren't removed;

Mouai, à la limite.

-   remove \<!DOCTYPE ...\> tags;

Ça c'est la ligne qui me donne envie de taper...

-   remove meta tags. You can specify names of the meta tags to be
    removed.

Et tu crois ptête que j'ai mis mes meta pour rigoler ? Si je les ai
mises, c'est pas pour les enlever ensuite...

### Best Practices

Bon sang, mais il y a quand même plus simple pour alléger son code que
d'utiliser ce genre de merde ! Il suffit de coder proprement en html,
que ce soit au marteau et au burin ou avec un [éditeur
WYSIWYG](http://www.nvu.com/) compatible avec les [spécifications
(X)HTML](http://www.w3.org) du W3C.

Il est amusant de constater que les sites qui utilisent ce logiciel sont
ceux qui utilisent encore une mise en page avec tableaux... Sans
tableaux, une page peut pourtant parfois [peser **deux fois** moins
lourd](http://openweb.eu.org/articles/problemes_tableaux/) ! Alors,
pourquoi pourrir une page html avec un tel logiciel alors que ça devient
totalement inutile avec un minimum de rigueur ?

Les résultats qu'on peut obtenir sont si jolis en plus ! :-) :
[Debian-fr](http://www.debian-fr.org).

### Conclusion

Si toi, lecteur, tu ne connais pas encore le *XhtmlCss*, n'hésite pas à
poser des questions autour de toi (ou même ici, mais je ne me prétends
absolument pas une référence en la matière), tout le monde sera content
de t'aider à migrer vers cette formidable technologie.

En tout cas, en ce qui concerne, l'utilisation de cette technologie est
un délice de tous les jours à la maintenance du code.

