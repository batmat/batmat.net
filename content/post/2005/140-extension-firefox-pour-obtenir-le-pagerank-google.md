---
Title: "Extension Firefox pour obtenir le PageRank google"
Date: 2005-05-02
Author: "Baptiste Mathus"
url: "2005/05/01/140-extension-firefox-pour-obtenir-le-pagerank-google"
---



Un des paramètres principaux de [google](www.google.fr) pour son
algorithme de tri, c'est le
[pagerank](http://www.webrankinfo.com/google/pagerank/index.php).

En gros, si une recherche ramène deux sites pour une requête donnée,
l'ordre de tri se fera selon le pagerank. En d'autres termes, si un site
et le vôtre parlez de la même chose mais que le PR du site en question
est supérieur au vôtre, il y a de bonnes chances pour que ses pages
arrivent avant dans la liste des résultats.

Vous allez me dire, “mais est-il possible d'obtenir ce nombre (de 0 à 10
avec 10 le meilleur score) ?”. Et bien oui, Simone ! Pour IE, google
avait développé la googlebar qui permettait, entre autre, de l'obtenir
en direct.

Il était évidemment impensable que cette fonctionnalité ne soit pas
présente dans l'une des nombreuses extensions existantes pour firefox et
je ne suis pas viendu ici pour vous dire que vous devriez utiliser IE
pour ça, vous vous en doutez. En fait, j'ai trouvé et testé deux
extensions différentes pour obtenir le précieux PR.

-   [PRGoogleBar](www.prgooglebar.org) : Une extension qui contient en
    fait simplement l'ajout de l'affichage du PR par rapport à
    l'[extension originale](http://googlebar.mozdev.org/) Celui-ci n'est
    en effet pas présent dans la GoogleBar firefox pour des raisons
    expliquées en [note](http://googlebar.mozdev.org/pagerank.html).
    Pour information, la googlebar fait toute la largeur de la fenêtre
    du navigateur et apporte pour fonctionnalités un champs de texte de
    recherche (comme celui déjà présent en haut à droite). Je trouvais
    que c'était donc un peu du gâchis pour n'utiliser finalement que les
    2 cm² affichés au milieu de la barre contenant le PR du site en
    cours de visite.
-   [Google PageRank
    status](http://www.tapouillo.com/firefox_extension/) : ![Capture du
    rendu de l'extension](/images/pr-statusbar.png) c'est cette
    extension que je vous conseille. Au lieu de vous imposer la grosse
    barre google, le pagerank s'affiche simplement en bas à droite de la
    barre d'état. Discret, utile, parfait quoi.

C'est ainsi qu'un coup d'oeil rapide aux valeurs fournies par cette
extension me permet de donner les PR actuels de ces quelques sites pour
exemple :

[Debian](http://www.debian.org)
:   **9**
[FSF](http://www.fsf.org)
:   **8**
[Standblog](http://www.standblog.org)
:   **7** (et oui, pas étonnant \^\^)
[Vincent](http://genezys.net)
:   **6** (récemment passé de 5 à 6)
[Batmat.net](http://www.batmat.net)
:   **5** (récemment passé de 4 à 5)
[Mon directeur de filière](http://www-igm.univ-mlv.fr/~dr/)
:   **4**, petit clin d'œil \^-

