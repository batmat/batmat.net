---
Title: "Hibernate"
Date: 2004-10-14
Author: "Baptiste Mathus"
---



Via
[a19s](http://www.application-servers.com/comments.do?reqCode=readComments&sid=2004-10-14-22:26:56),
j'apprends il y a quelques minutes que la traduction en français de la
documentation de ce formidable outil de mapping O/R vient de
[paraître](http://www.hibernate.org/hib_docs/reference/fr/html/). C'est
un outil très puissant de persistance automatisée surtout destiné à une
architecture plus légère utilisant des POJOs à la place des EJBs.

Si vous avez compris ce que je viens de dire, ce n'est pas la peine de
lire la suite :-). Je vais essayer de définir rapidement les quelques
termes utilisés ci-dessus. C'est le genre de choses que j'ai longtemps
cherché lorsque j'ai commencé à suivre les fils rss de
[TSS](http://www.theserverside.com/),
d'[a19s](http://www.application-servers.com) ou de
[DotNetGuru](http://www.dotnetguru.com)...

### Un peu d'aide

Je ne prétends pas faire de définition exhaustive et pouvant vous servir
à comprendre totalement. Je vais simplement expliquer les choses telles
que je les ai comprises. Je suis convaincu que c'est le fait de lire des
dizaines d'explications de la même chose à des endroits et avec des
façons différentes qui permet de comprendre correctement un concept ou
une technique.

### La persistance

En fait, ce terme est utilisé pour indiquer le fait qu'un objet peut
être sauvegardé de façon plus ou moins automatisée. Vos objets
pourraient par exemple être sauvegardés automatiquement dans une base de
données ou dans un fichier au moment de l'arrêt du conteneur et être
restaurés tout aussi automatiquement lors du redémarrage de celui-ci.

Ce qui est impressionnant pour le néophyte avec un outil comme
hibernate, c'est qu'on peut sauvegarder ses objets dans une base de
données sans écrire une ligne de JDBC ni de SQL !

### Pourquoi "mapping O/R"

Et bien, parce qu'on indique à l'outil la correspondance entre le modèle
objet de la partie programmatique et le modèle relationnel couramment
rencontré dans les bases de données. Les bases de données relationnelles
sont effet beaucoup plus répandues que les bases de données objet. Elles
sont aussi plus anciennes, donc mieux maîtrisées, elles font moins peur
aux entreprises.

Concrètement, on utilise par exemple dans hibernate un fichier xml dans
lequel on indique la correspondance table/objet et champs/attribut.

### POJO, Késako ?

Je ne sais plus où j'ai lu cette histoire, mais ce nom aurait été
inventé pour contrer l'effet mode qui allait avec le terme **EJB**. On a
donc cherché un mot *fashion* pour les objets Java classiques : de bons
vieux objets *classiques* en opposition avec la complexité de
déploiement qui va avec les EJB.

Pourquoi ? Tout simplement parce que les entreprises sont revenues de la
mode tout J2EE. C'est complexe à développer, déployer et à maintenir un
conteneur d'EJB ! Le plus souvent, utiliser une architecture mettant en
oeuvre des EJB est surdimensionné, inadapté. Je me souviens qu'un
formateur disait que 80% des projets qui en utilisaient auraient été
mieux inspirés d'utiliser plutôt une architecture simple servlets/jsp,
avec éventuellement du Struts/Spring/Hibernate et les autres outils
courants du domaine...

### Hibernate

Si vous avez suivi, vous avez compris qu'Hibernate est donc un outil de
mapping O/R. Il permet de sauver ses objets très simplement en base.
Après quelques lignes de code, une instruction du genre
`session.save(monObjet)` sauvera l'objet monObjet si sa classe a été
mappée correctement. Ça donne envie d'essayer, non ? :-)

Bon, je crois que ça suffira pour ce soir. J'ai fait largement assez
long pour ne finalement vouloir parler que de la première phrase o\_O.

