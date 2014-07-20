---
Title: "Vive les formats ouverts"
Date: 2004-11-04
Author: "Baptiste Mathus"
---



Ce soir, je devais faire un diagramme de package UML. J'utilise
[dia](http://www.gnome.org/projects/dia/) pour ce faire, je le trouve
simple d'utilisation, il est générique et très puissant.

J'avais 26 use cases à saisir. Or, ils se ressemblaient beaucoup :

-   Ajouter Bidule
-   Modifier Bidule
-   Supprimer Bidule

-   Ajouter Machin
-   Modifier Machin
-   Supprimer Machin

-   Ajouter Truc
-   Modifier Truc
-   Supprimer Truc
-   ...

Comme je ne voulais pas saisir ces nombreux use cases identiques, je me
suis dit que je pourrais sûrement trouver un moyen de diminuer la
lourdeur de la tâche.

L'importance des [formats
ouverts](http://formats-ouverts.org/blog/2004/07/01/12-UnArticleDeLoiDefinitCeQueSontLesFormatsOuverts)...
Un peu comme OpenOffice.org qui zippe en fait dans une seule archive les
différents fichiers qui composent un document, dia compresse en
[gzip](http://en.wikipedia.org/wiki/Gzip) un fichier XML dans lequel il
stocke les différents composants utilisés.

**Comment j'ai su que le format de dia était du gzip ?**

Non, je ne suis pas allé chercher sur le site de DIA. La commande `file`
est très utile. Elle se fout totalement de l'extension d'un fichier :
elle regarde le contenu et tente d'en déterminer le type. C'est très
utile :

    baptiste@presario:~$ file GRessources.dia
    GRessources.dia: gzip compressed data, from Unix
    baptiste@presario:~$ file GRessources.dia
    GRessources.dia: gzip compressed data, from Unix
    baptiste@presario:"~$ mv tomcat.pdf tomcat
    baptiste@presario:~$ file tomcat
    tomcat: PDF document, version 1.3

J'ai donc décompressé ledit fichier GRessources.dia et j'ai cherché la
chaîne de caractère d'un premier use case que je venais d'ajouter :
*Ajouter Bidule*. Je l'avais volontairement fait pour retrouver dans le
XML la balise qui m'intéressait. Ce fut chose faite, et après une courte
recherche, on parvient à isoler l'élément désiré. Voici à quoi ressemble
un cas d'utilisation stocké en XML dans le format de fichier de DIA :

    <dia:object type="UML - Usecase" version="0" id="O51">
        <dia:attribute name="obj_pos">
          <dia:point val="9.98956,28.3"/>
        </dia:attribute>
        <dia:attribute name="obj_bb">
          <dia:rectangle val="9.98956,28.3;16.6896,30.5333"/>
        </dia:attribute>
        <dia:attribute name="elem_corner">
          <dia:point val="9.98956,28.3"/>
        </dia:attribute>
        <dia:attribute name="elem_width">
          <dia:real val="6.7000000000000002"/>
        </dia:attribute>
        <dia:attribute name="elem_height">
          <dia:real val="2.2333333333333334"/>
        </dia:attribute>
        <dia:attribute name="line_colour">
          <dia:color val="#000000"/>
        </dia:attribute>
        <dia:attribute name="fill_colour">
          <dia:color val="#ffffff"/>
        </dia:attribute>
        <dia:attribute name="text_outside">
          <dia:boolean val="false"/>
        </dia:attribute>
        <dia:attribute name="collaboration">
          <dia:boolean val="false"/>
        </dia:attribute>
        <dia:attribute name="text">
          <dia:composite type="text">
            <dia:attribute name="string">
              <dia:string>#Modifier un Bidule#</dia:string>
            </dia:attribute>
            <dia:attribute name="font">
              <dia:font family="sans" style="0" name="Helvetica"/>
            </dia:attribute>
            <dia:attribute name="height">
              <dia:real val="0.59999999999999998"/>
            </dia:attribute>
            <dia:attribute name="pos">
              <dia:point val="13.3396,29.6167"/>
            </dia:attribute>
            <dia:attribute name="color">
              <dia:color val="#000000"/>
            </dia:attribute>
            <dia:attribute name="alignment">
              <dia:enum val="1"/>
            </dia:attribute>
          </dia:composite>
        </dia:attribute>
        <dia:childnode parent="O1"/>
      </dia:object>

Oui, bon j'avoue qu'au premier abord, ça peut sembler compliqué. Mais en
fait, on s'en fiche. Bien entendu, on travaille sur une copie du fichier
dia original pour éviter les risques :-). On croise les doigts en
recopiant tout ça et en changeant la chaîne qui nous intéresse (ici,
*Modifier un Bidule*) en celle qu'on veut pour le nouveau use case.

Si on connait un tout petit peu le XML, on remarque le id="051". En XML,
un id doit être unique dans le fichier, on change donc ça en un autre
qui n'existe pas encore (052 par exemple) et on sauvegarde le tout.

Recompressez le fichier modifié, `$gzip votrefichier` va vous générer un
votrefichier.gz. Renommez le en votrefichier.dia pour faire propre et
ouvrez le avec DIA...

Vous voyez votre nouveau *use case*, la copie que vous venez de faire,
au dessus de l'original. C'est normal puisque vous avez gardé les mêmes
paramètres de positionnement \^\^.

Voilà, j'espère que ça pourra vous être autant utile qu'à moi, bonne
nuit.

