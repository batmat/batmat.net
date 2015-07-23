---
Title: "Mon avis sur le livre \"Apache Maven\" de Nicolas De Loof et Arnaud Héritier"
Date: 2010-03-09
Author: "Baptiste Mathus"
url: "2010/03/09/Mon-avis-sur-le-livre-Apache-Maven-de-Nicolas-De-Loof-et-Arnaud-Heritier"
---



J'ai lu le livre [Apache Maven, édité chez
Pearson](http://www.pearson.fr/livre/?GCOI=27440100730370). Pour un
premier livre en français sur Maven, on peut dire que l'expérience est
globalement très réussie.

#### Mon expérience de maven

Disons-le tout de suite, je ne suis pas néophyte sur Maven. J'ai été
utilisateur de maven 1 un tout petit peu (preuve
[ici](http://chronos.berlios.de/) :-)), avant de me plonger dans maven 2
depuis maintenant plusieurs années. Bon, ça c'est fait. J'espère que
vous comprendrez que là, je veux pas me la péter hein. Je veux juste
dire que nombre de concepts du livre m'étaient déjà connus. Et que,
donc, mon analyse ne sera forcément pas celle d'un nouvel arrivant sur
Maven.

##### Le style du livre

J'avoue que j'ai trouvé la lecture très agréable. C'est volontaire de la
part des auteurs, et c'est réussi. Ils ont réussi à apporter beaucoup de
concepts dans un style facile à lire. Ils ne sont pas tombés dans le
piège de la documentation de référence, parfois un peu dure à lire,
voire carrément chiante, qu'on n'ouvrirait que pour y faire un grep sur
ce qu'on cherche (et ce n'est à mon sens pas le but pour un livre
papier).

Le livre se lit un peu comme un roman : un petit projet débute, et
rencontre les problèmes classiques du packaging qui devient une usine à
gaz, et que seul celui qui l'a développé (et encore) peut lancer. Au fil
de l'eau, on explique donc comment fonctionne maven (et pourquoi il a
été créé), comment packager simplement, etc. Ensuite, on se rend compte
que l'écriture et le lancement de tests est fastidieuse, alors on
explique comment ajouter des tests, et ainsi de suite en décrivant la
mise en œuvre de choses de plus en plus complexes.

#### La structure et le contenu du livre

##### "Premiers pas avec Maven"

La première partie introduit maven, d'où il arrive, qui l'a créé et
pourquoi. Exemple : un projet, quel qu'il soit (et dans quelque langage
que ce soit), rencontre presque toujours les trois besoins suivants lors
de sa construction : préparer la construction (initialisation),
compilation, puis assemblage.

Tout y est, "convention-over-configuration", la notion de dépendance, la
transitivité, les scopes, les classifiers, etc... Et tout passe comme
une lettre à la poste. Vraiment, je le redis : l'exploit de Nicolas et
Arnaud réside dans la capacité à nous permettre de lire le livre sans
avoir l'impression de lire une documentation technique.

Comme je le disais sur
[twitter](http://twitter.com/bmathus/status/10218149785), je pense que
ce livre est un outil formidable sur lequel s'appuyer pour préparer des
sensibilisations à Maven dans vos boîtes. Mais surtout, [CITEZ VOS
SOURCES](http://twitter.com/ndeloof/status/10222120761) !!! :-)

Dans la première partie, on la jouait petit. En tant qu'utilisateur
expérimenté de maven, ça m'a surtout donné envie de voir comment on
pourrait déployer Selenium et FitNesse en IC chez nous.

##### "Maven en entreprise"

Là, on commence à ouvrir les vannes. Le projet est devenu complexe :
comment gérer les dépendances proprement avec un repo manager,
centraliser les informations dans un pom parent, utiliser Maven dans
l'IDE.., et on arrive enfin à "mais diantre, comment on release un
projet avec Maven ? On pourrait pas gérer automatiquement ces actions
répétitives, rébarbatives qu'on se tape à chaque livraison, et sur
lesquelles on se trompe une fois sur deux ?".

##### "Encore plus loin avec Maven"

On lâche les chevaux : écriture de plugin maison, comment le tester,
intégrer de l'assurance qualité (analyse de code, couverture de code),
la génération des rapports et enfin on parle de
[Sonar](http://sonar.codehaus.org), la rolls de l'analyse qualité d'un
projet.

Une fois la partie "technique" terminée, Arnaud et Nicolas se livrent
même à l'exercice périlleux de prédiction : Maven 3 et consorts (Encore
bon pour le moment : Maven 3 à attendre plutôt pour fin 2010, d'après le
livre imprimé en novembre 2009. On en est à l'alpha-7 à ce jour.).

#### Les reproches

Il en faut, sinon, vous allez penser que je ne suis pas objectif :-).

-   *Tests d'intégration : les mettre dans le projet, ou dans un projet
    externe ?* Le livre dit que les deux approches sont valides, mais
    sans creuser. J'aurais aimé davantage de retours sur le sujet. Au
    moins essayer de donner des pistes ou des exemples sur quelle
    stratégie plutôt adopter qu'une autre dans une situation en
    particulier. Ou même simplement l'avis d'Arnaud et de Nicolas (je
    suis sûr que vous en avez un :)) si aucun consensus n'existe
    effectivement.
-   *Problèmes d'impression en N&B* : je suppose que quelques captures
    ou diagrammes (exemple : p.206, un des écrans de
    [sonar](http://sonar.codehaus.org)) ont dû être envoyés à l'éditeur
    en couleur. Le passage au noir&blanc les rend peu lisibles (essayez
    de différencier du bleu et du vert une fois dans des nuances de
    gris...). Je pense qu'il aurait fallu soit vérifier la conversion au
    noir&blanc, soit voir avec l'éditeur pour imprimer en couleur au
    moins ceux-là (je suppose que ça permet de baisser le prix de
    revient du livre).
-   *Évolution de Maven 3 : pouvoir référencer un pom parent sans
    version*. Le problème de la poule et de l'œuf de Maven. Cette
    évolution me paraît à la fois intéressante, et en même temps pose
    question. En effet, l'une des forces de Maven est qu'il est
    actuellement possible de checkouter un seul module (et non tous) et
    de travailler dessus. Un peu comme SVN, on peut checkouter n'importe
    quel niveau, et Maven s'y retrouve très bien. Je suppose que si la
    version parent n'est plus spécifiée, il devient impossible de
    checkouter de cette façon. Je pense que ce sera comme ça, mais
    j'aurais aimé quelques détails sur le sujet.

#### Mon impression générale

Dans la description de ce petit projet devenu gros, j'ai retrouvé une
très grande partie des choses que nous avons faites chez nous. Je pense
que certains choix n'ont pas toujours été faits immédiatement, et la
lecture d'un tel livre nous aurait économisé pas mal de temps et de
recherches (le release-plugin marche très bien, une fois qu'il marche.
Mais il peut être difficile d'initialiser les premières releases, où il
y a toujours un truc qui plante au milieu).

Petit bonus en prime : le style adopté, et la partie à la fin du livre
vous donnent l'impression de connaître tout le monde, de faire un peu
partie de la famille :). Maintenant on connait l'âge de tous les
développeurs francophones de Maven, même celui de Vincent qui a tenté un
chiffrement en héxa :-).

Globalement, donc, je recommande chaudement ce livre à toute personne
qui utilise maven et qui souhaite maîtriser l'outil. Le livre offre un
accès facile à toutes les facettes du projet, des plus simples au plus
avancées, sans omettre le côté humain qui est si important dans les
projets opensource.

