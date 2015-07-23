---
Title: "Logiciel de suivi de candidatures"
Date: 2005-06-26
Author: "Baptiste Mathus"
url: "2005/06/26/171-logiciel-de-suivi-de-candidatures"
---



Bon, ça a démarré... J'ai eu 7 ou 8 contacts la semaine passée suite à
la publication de [mon CV](http://batmat.net/CV/) sur monster&Co. J'ai
deux entretiens de prévus.

Je suis confronté à un problème : je me rends compte que ça devient
compliqué de gérer tous les contacts de tête. Si la semaine prochaine se
passe comme celle passée, cela deviendra complètement impossible. Parce
qu'encore si ce n'était que les contacts, ça pourrait aller, mais il
faut que je gère :

-   ceux qui m'ont juste laissé un message sur mon portable, parce que
    j'étais indisponible, et qu'il faut que je rappelle ;
-   ceux qui m'ont écrit un mail en me demandant des précisions, à qui
    il faut que je réponde ;
-   ceux avec qui j'ai un entretien prévu (2 actuellement) ;
-   les boites dans lesquelles je voudrais faire une candidature
    spontanée (valtech par exemple, Sami si tu m'entends, on peut
    toujours rêver :-p) ;
-   etc...

Bref, je suis à la recherche d'un logiciel capable de gérer tout cela et
même plus, [anpsedic](http://www.anpsedic.org/) semble intéressant mais
il n'est pas libre et ne fonctionne que sous windows ce qui ne me
convient donc pas du tout.

J'ai donc commencé à écrire un petit peu de code Java, mais je me rends
compte que je risque de faire n'importe quoi si je ne réfléchis pas un
peu plus à tout ce que je voudrais gérer. Pour l'instant, j'ai écrit
principalement 3 objets centraux :

1.  Company (contient une liste de recruteurs)
2.  Recruiter (contient une liste de messages)
3.  Message

Mon objectif initial était en effet de simplement gérer les contacts
initiés par des recruteurs d'une entreprise. J'ai donc imaginé une liste
de recruteurs pour une entreprise parce qu'on est au final toujours
contacté par une boite, mais pas forcément toujours le même recruteur de
cette boite, non ?

Et justement, c'est là que vous intervenez ! Quelles fonctionnalités
souhaiteriez-vous dans un tel logiciel ? Utilisez les commentaires pour
le dire, je reprendrai les idées pour les lister au fur et à mesure dans
le corps du billet. En vrac, donc :

-   Les recruteurs/entreprises qui vous ont contactés ;
-   Les relances à effectuer pour telle ou telle entreprise ;
-   Les entretiens prévus (i.e. mini gestion de planning et alarme) ;
-   ...

