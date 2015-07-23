---
Title: "Comment réinitialiser manuellement les pages chargées par firefox au démarrage"
Date: 2008-06-30
Author: "Baptiste Mathus"
url: "2008/06/30/Comment-reinitialiser-manuellement-les-pages-chargees-par-firefox-au-demarrage"
---



Si, comme moi depuis 10 minutes, vous êtes dans l'impossibilité de
relancer Firefox parce que la page sur laquelle vous étiez provoquait un
plantage de FF, ce qui suit est pour vous.

Dans les options de Firefox, vous pouvez demander à ce que celui-ci
réouvre les onglets ouverts avant la dernière fermeture (Onglet Général,
le premier combobox). Une fois cette option sélectionnée, mon firefox
qui gelait avait pour bonne idée de redémarrer sur la page en question
et de regeler...

Et là, bizarrement, la proposition de "restaurer les onglets" ou de
"démarrer une nouvelle session" n'était même pas offerte. Donc, bien
bien bloqué.

La solution que j'ai trouvée est la suivante :

-   Tuez firefox
-   dans votre répertoire *profile* (dans quelque chose comme
    \$HOME/.firefox/1d5s1.default sous Linux ou C:\\Documents and
    Settings\\votreuser\\Application
    Data\\Mozilla\\Firefox\\Profiles\\1d5s1.default sous windows),
    supprimez simplement le fichier **sessionstore.js**.
-   Relancez firefox...

Voilà, en espérant que ça serve...

