---
Title: "Encoding par défaut avec XML : UTF-8"
Date: 2009-11-19
Author: "Baptiste Mathus"
url: "2009/11/19/Encoding-par-defaut-avec-XML-:-UTF-8"
---



Nous gérons en ce moment un petit problème d'intégration avec des
WebServices d'une entreprise qui ne s'attend qu'à du iso-8859-1. XML a
pourtant été conçu pour gérer plus simplement les problèmes de jeux de
caractères et d'encodage utilisé, mais ce qui a été fait ne respecte
tout simplement pas la spécification.

En effet, notre code envoie une requête SOAP dans un tube HTTP annonçant
de l'UTF-8. Comme ça ne marchait pas, nous avons carrément ajouté
l'attribut encoding au prologue XML et retesté avec
[Soapui](http://www.soapui.org/), mais ça n'a rien donné.

Alors, comme il faut que quelqu'un corrige son code, j'ai vérifié la
[spécification](http://www.w3.org/TR/REC-xml/#sec-guessing)^[[1](#pnote-311-1)]^,
voici ce qui est indiqué :

-   Dans le cas où un encoding est précisé en externe, et que le
    prologue ne spécifie rien, c'est cet encoding qui est utilisé
-   Si rien n'est spécifié dans les premiers octets du XML, alors on
    parse de l'UTF-8 par défaut.
-   On trouve aussi cette phrase : *[All XML processors MUST accept the
    UTF-8 and UTF-16 encodings of
    Unicode](http://www.w3.org/TR/xml/#charsets)*.

Bref, attendre de l'iso-8859-1 lorsque rien n'est indiqué est au minimum
une bizarrerie, et au pire une erreur par rapport à ce que dit la
spécification.

#### Notes

[[1](#rev-pnote-311-1)] *Non-Normative*

