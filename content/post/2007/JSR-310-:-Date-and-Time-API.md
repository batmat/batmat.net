---
Title: "JSR 310 : Date and Time API"
Date: 2007-02-18
Author: "Baptiste Mathus"
---



[Génial](http://jcp.org/en/jsr/detail?id=310).

L'API standard de Java manque encore aujourd'hui cruellement d'une API
de traitement des dates, de calcul des durées entre deux dates et tout
ce qui peut avoir un rapport avec le traitement du temps dans un
programme. L'une des bibliothèques les plus connues qui comble cette
lacune est [Joda-Time](http://joda-time.sourceforge.net/).

Une [JSR](http://fr.wikipedia.org/wiki/Java_Community_Process) est donc
en marche pour répondre à ce besoin de façon standard. Ceux qui ont déjà
utilisé les classes Calendar et Date savent à quel point elles sont
incomplètes et parfois même bugguées. Vivement que ce groupe de travail
produise la base de ce *javax.time.\**, base sur laquelle nous pourrons
jeter un oeil afin de commenter. Ça va sûrement être très intéressant.
Nous découvrirons alors notamment s'il est entrevu un chemin de
migration entre la classe Date actuelle et celle qui sera conçue. A
priori, les deux classes devraient en effet être rendues obsolètes :

> It is intended that this JSR will produce classes that effectively
> replace the need for the existing Date and Calendar APIs. Over time we
> look forward to other specifications being updated to us the new date
> and time API.

Mais le groupe de travail tentera évidemment si possible de réintégrer
ces classes dans le nouveau modèle :

> In terms of design, it is intended that immutable classes will form
> the core. It is also intended to use interfaces, if possible, to bring
> the old Date and Calendar classes into the new model. The expert group
> will also examine if Calendar can be reimplemented internally using
> the new date and time classes.

Vu la base de code dans la nature qui dépend de Date/Calendar, j'espère
qu'on trouvera un moyen de fusionner l'ancien et le nouveau modèle...

