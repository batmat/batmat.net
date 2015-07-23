---
Title: "Sun Tech Days, mercredi 21"
Date: 2007-03-25
Author: "Baptiste Mathus"
url: "2007/03/25/Sun-Tech-Days-mercredi-21"
---



Avec un peu de retard, je prends enfin le temps de faire un billet sur
mon deuxième jour aux Tech Days. Cette journée a été très chargée, mais
j'ai appris pleins de nouvelles choses. Évidemment, ce sont des choses à
approfondir, mais je vais essayer de vous donner aussi envie de le
faire. En cherchant un logiciel pour faire des vidéos de démo comme on
en voit partout fleurir sur le net, je suis tombé sur Wink. C'est
simplissime d'utilisation : avec ça, plus aucune excuse pour ne pas
faire de vidéo explicative de l'installation ou d'une démo d'un logiciel
(et on peut générer du flash ou un .exe pur windows).

### Sun Technical Keynote

Cette introduction a été l'occasion de nous montrer le langage [F3 :
Form follows
function](http://blogs.sun.com/chrisoliver/resource/f3.html), censé
simplifier le développement d'interfaces graphiques. C'est vrai que la
partie de la démo montrant comment mettre un fond en dégradé de rouge
vers bleu vers jaune (ou d'autres couleurs) a montré que c'était
effectivement très simple.

### Speach VMWare

En tant que sponsor Platinium, VMWare a eu droit à un speach devant tout
le monde. On nous a présenté ce qu'était VMWare, pour ceux qui
l'ignoraient encore. Ça a été l'occasion de parler de Lab Manager, une
sorte de dépôt central dans lequel on peut stocker des machines
virtuelles et les lancer depuis des postes clients. Ça a l'air
intéressant dans le cas des recettes par des équipes de tests. En effet,
le syndrôme du “Chez moi ça marche” est effectivement connu de tout
informaticien. Avec ce système qui simplifie le partage d'une
configuration complète (du logiciel jusqu'à l'OS et sa configuration
précise), il devient possible de débugguer un problème dans les
conditions qui garantissent la reproductibilité, ce qui est la première
difficulté pour un développeur : trouver les conditions permettant de
reproduire le problème (essayez de corriger un problème que vous n'avez
pas, pour voir !).

### Java Jacket Give away

20 minutes pour un mini-show de 4 d'entre nous. Je n'ai pas osé y aller.
J'ai eu une idée un peu tard, mais j'aurais dû la préparer la veille.
Peut-être pour l'année prochaine :-).

Le gagnant a chanté une petite chanson sur Java et a donc gagné la veste
en cuir avec le logo Java :-).

### Java scripting: One VM, Many Languages

Cette session a été très intéressante. La démo de Guillaume Laforge m'a
notamment donné envie de me mettre au
[Groovy](http://groovy.codehaus.org/), pour les apports en rapidité
d'écriture par rapport au Java, l'ajout des
[fermetures](http://fr.wikipedia.org/wiki/Fermeture_%28informatique%29 "closures en anglais"),
mais aussi pour sa proximité syntaxique et son intégration avec le Java.
Ça peut en effet fonctionner directement avec la JVM, être mis dans un
jar..., puisqu'on peut générer du pur bytecode Java. L'idée n'est pas de
remplacer le Java, mais d'apporter une alternative plus puissante aux
scripts shell et une syntaxe plus habituelle pour le développeur Java
qui veut déployer un script de batch sur le serveur, par exemple.

Cette présentation a été l'occasion de découvrir la
[JSR223](http://scripting.dev.java.net/), la spécification qui permet
d'intégrer n'importe quel langage de script à la plate-forme Java.
Javascript l'est déjà (cf. la présentation flash plus bas), JRuby,
Groovy, etc. En gros, l'architecture mise en place permet à n'importe
qui d'intégrer n'importe quel langage de script en implémentant
simplement les interfaces de la spéc (pensez à JDBC si vous ne voyez pas
ce que je veux dire).

### Code Quality issues: Prevention and Detection

C'est certainement l'une des sessions dans lesquelles je me suis senti
le plus à l'aise, parce que j'avais déjà mis en place un grand nombre
des outils cités. Ça a toutefois été l'occasion de découvrir de nouveaux
outils (Selenium, notamment).

La présentation a commencé en citant Dijkstra : “Testing can only show
you bug presence, not their absence”. Et c'est vrai que c'est bien de
rappelant l'intérêt essentiel des outils de qualité de code... Ce n'est
pas magique.

Pour résumer :

-   Test unitaire : Junit, TestNg
-   Couverture de code : Emma (+ pleins d'autres), ce type d'outil
    permet de savoir quelles parties de votre code ont été testées par
    les tests unitaires. En gros, vous lancez tous les tests de votre
    projet et l'outil monitore par où ça passe. Ensuite, vous pouvez
    généralement savoir quelles parties ont été testées, voire même
    lesquelles l'ont été plusieurs fois et d'autres une seule. La
    plupart de ces outils possèdent des plugins pour les principaux IDE
    qui permettent de voir graphiquement la couverture. Bien sûr, il
    existe aussi des plugins pour des outils comme Maven, permettant de
    sortir des statistiques.
-   Montée en charge : JMeter, LoadRunner (j'ajouterais OpenSTA)
-   Mock objects : EasyMock, JMock
-   Qualité du code : PMD, Checstyle
-   Test fonctionnel d'une webapp : Selenium
-   P6Spy pour voir la valeur des "?" dans les requêtes SQL paramétrées.

### TP : Les nouveautés de Java 6

Comme j'en ai parlé plus haut, il est possible d'interfacer la JVM avec
d'autres langages. Avec Java 6, vous disposez de jrunscript, un
interpréteur Ecmascript (javascript normalisé).

En voici une petite démo :(cliquez sur l'image pour voir la démo
flash) :
[![jrunscript-presentation.jpg](/dotclear/public/jrunscript-presentation.jpg)](/dotclear/public/jrunscript.swf)

### JMX, Performance et concurrence

JMX
---

J'ai appris au cours de cette session que l'équipe de développement de
[JMX](http://java.sun.com/javase/technologies/core/mntr-mgmt/javamanagement/)
était située à Grenoble.

L'objet de cette session a été principalement de développer un MBean et
de l'exposer via le MBeanServer. Ceux qui, comme moi, ont déjà développé
un MBean et joué avec
[JConsole](http://java.sun.com/developer/technicalArticles/J2SE/jconsole.html)
juste pour voir n'auront pas été surpris.

Par contre, j'en ai appris sur les différentes espaces mémoires de la
JVM :

-   Eden : c'est l'espace mémoire où les objets à courte durée durée de
    vie sont stockés (la plupart en général) ;
-   Survivor : pour les objets qui ont une durée de vie un peu plus
    grande ;
-   Tenured : ben euu, encore plus :-).

Autre chose que les conférenciers ont dit, je n'ai pas vérifié, mais à
propos des options -client et -server :

-   -client est toujours utilisé sous Windows, quelle que soit la
    machine
-   -server est utilisé automatiquement sous Linux ou sous Solaris si la
    machine possède plus de 2Go de mémoire vive.

Truc génial : la possibilité de repérer des deadlocks avec un simple
bouton ! (je crois que c'est un ajout dans le JConsole embarqué dans
Mustang, parce que je ne me souviens pas de l'avoir dans Tiger).

##### JSR 262

La façon dont on accède à JMX, JMX Remote, n'est pas liée fortement à
JMX. En effet, l'implémentation par défaut dans Java 5 est effectivement
en RMI, mais il reste très faisable de permettre l'accès aux
fonctionnalités d'un serveur JMX par n'importe quelle autre
implémentation.

C'est justement l'objet de la JSR 262 : implémenter une couche
WebServices d'accès à JMX. Comme il existe une norme appelée
[WS-Man](http://www.dmtf.org/standards/wsman/) qui n'est pas liée au
Java. Cette implémentation permettra donc l'accès au management de la
JVM d'une façon normalisée. [WiseMan](https://wiseman.dev.java.net/) est
ainsi l'implémentation Java de WS-Man.

Lors de la séance de Q/R, j'ai posé la seule question de ces deux jours
à Paris : “pourquoi n'y a-t-il pas pour les MBeans, de la même façon
qu'il y a l'annotation @WebService pour les Webservices, une annotation
@MBean qui indiquerait automatiquement aux MBeanServer quels sont les
MBeans à exposer ?” Éamonn McMannus a répondu que c'était une question
qu'on leur posait souvent, et que c'était justement prévu.

Performance
-----------

Bon, ils ont parlé du [classique StringBuffer à la place de concaténer
des
String](http://batmat.net/blog/post/2004/06/09/61-utilisation-de-stringbuffer-et-autres-ruses).
Attention : depuis la version 5 de Java, la classe StringBuilder est à
privilégier : de la même manière qu'il est recommandé d'[utiliser
HashMap à la place de
Hashtable](http://batmat.net/blog/post/2004/06/28/66-best-practices-en-java),
il faut utiliser StringBuilder dans un contexte qui ne nécessite pas de
synchronisation. En effet, la synchro n'est pas gratuite, donc
l'utiliser de façon systématique est une grave erreur.

Concurrence
-----------

Ils ont présenté la [nouvelle API de gestion de la
concurrence](http://java.sun.com/j2se/1.5.0/docs/api/java/util/concurrent/package-summary.html)
ajoutée au JDK5, encore peu connue.

Java Puzzle
-----------

Pour finir, on a eu droit à un *Java Puzzle* (en anglais, *puzzled*
correspond à surpris, étonné), c'est un bout de code qui surprend ou
pour lequel on n'a généralement pas une réponse évidente pour tout le
monde :

     
    public class PingPong {
        public static synchronized void main(String[] a) {
            Thread t = new Thread() {
                public void run() { pong(); }
            };
            t.run();
            System.out.print("Ping");
        }

        static synchronized void pong() {
            System.out.print("Pong");
        }
    }

Qu'affiche ce bout de code ?

1.  PingPong
2.  PongPing
3.  Ça varie

J'avoue sans honte que j'ai répondu correctement à cette question :-).
Je mettrai la réponse dans les commentaires un peu plus tard (si
personne d'autre ne le fait avant, d'ailleurs).

