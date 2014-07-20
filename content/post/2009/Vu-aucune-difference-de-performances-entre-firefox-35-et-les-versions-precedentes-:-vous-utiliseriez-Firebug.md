---
Title: "Vu aucune différence de performances entre firefox 3.5 et les versions précédentes : vous utiliseriez pas Firebug ?"
Date: 2009-12-23
Author: "Baptiste Mathus"
---



Par le plus grand hasard, pendant la lecture d'un billet de [Pascal sur
les performances de firefox au fil des
âges](http://www.chevrel.org/fr/carnet/index.php?post/2009/12/18/Les-performances-Javascript-de-Firefox-%C3%A0-travers-le-temps),
je viens de m'apercevoir que je ne profitais en fait pas de
[TraceMonkey, le compilateur JIT intégré à Firefox depuis la
3.5](https://wiki.mozilla.org/JavaScript:TraceMonkey) !

C'est vrai que je n'avais pas fait très attention, mais que je n'avais
pas non plus remarqué d'amélioration notable sur mon navigateur favori.
En fait, c'était à cause du fait que j'avais, comme tout bon développeur
qui se respecte :-), installé firebug depuis déjà un bon moment.

Sur le blog de Pascal, la phrase suivante m'a donc fait tilter :

> Un petit rappel si vous utilisez Firebug, votre moteur de compilation
> JIT de javascript est désactivé et vous aurez donc des perfs
> équivalentes à celles de Firefox 3.0, même si vous êtes en 3.5. La
> version 1.5beta7 de Firebug sortie hier devrait résoudre ce bug.

Aussitôt dit, aussitôt fait. J'ai installé la version [1.5X.0b8 de
firebug](http://getfirebug.com/releases/firebug/1.5X/) et j'ai tout de
suite vu effectivement une différence. Gmail, Google Reader, Hudson,
tout s'affiche plus vite.

Comme j'avais fait le test
[SunSpider](http://www2.webkit.org/perf/sunspider-0.9/sunspider-driver.html)
avant la mise à jour, en gros, je peux vous dire que je suis passé de
3500 à 1500 !

Bref, installez-vite cette mise à jour !

