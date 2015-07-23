---
Title: "Supprimer le suffixe de votre adresse de weblog"
Date: 2005-07-12
Author: "Baptiste Mathus"
url: "2005/07/12/176-supprimer-le-suffixe-de-votre-adresse-de-weblog"
---



Si vous souhaitez que l'adresse de la racine de votre blog soit bien
http://www.monblog.com et non http://www.monblog.com/blog (ou blog.php
ou même dotclear/), il y a plusieurs techniques. Nous avions eu une
discussion à ce sujet avec [Vincent](http://genezys.net/) il y a
quelques temps de cela. Notre discussion nous a conduit à utiliser tous
les deux la même solution, trouvée de manière collaborative :-).

##### Les méthodes

Il y a donc deux méthodes :

1.  Faire dans un fichier index.php un `include('blog.php');`. Ça marche
    très bien, mais ça a tout de même un inconvénient : cette méthode
    est coûteuse en ressources parce qu'elle demande au moteur php
    d'ouvrir un fichier supplémentaire pour en lire le contenu afin de
    l'envoyer au client. L'avantage de cette solution réside toutefois
    dans le fait que cette solution est extrêmement simple à mettre en
    œuvre et qu'elle devrait fonctionner partout où php fonctionne.
2.  Comme vous vous en doutez : utiliser un .htaccess. Pour ceux qui
    l'ignoreraient encore, ce fichier permet de passer des directives au
    serveur Web [Apache](http://www.apache.org). On peut ainsi changer
    la majorité des comportements configurés dans le httpd.conf. On peut
    notamment modifier la primordiale `DirectoryIndex`, c'est cette
    directive qui indique au serveur Web dans quel ordre il doit
    rechercher les noms de fichiers dans le cas où celui-ci n'est pas
    précisé (typiquement, lorsque vous tapez *http://batmat.net* au lieu
    de *http://batmat.net/blog*).

Souvent `DirectoryIndex` est configurée avec quelque chose comme ça :

    DirectoryIndex index.php index.html index.shtml

##### Le but

Rappelons le au fait, parce qu'on finirait par l'oublier : je voudrais
bien que lorsqu'un utilisateur tape *http://batmat.net* il voit bien mon
blog. Évidemment, il n'est plus question d'utiliser ici une simple
redirection transformant automatiquement l'adresse en
*http://batmat.net/blog/*. Non, je veux que l'adresse tapée ne change
pas et que [http://batmat.net](http://batmat.net) et
[http://batmat.net/blog](http://batmat.net/blog) présentent le même
contenu.

##### Solution

Si vous avez suivi le rôle de `DirectoryIndex` expliqué ci-dessus, vous
avez sûrement déjà trouvé la solution : on va ajouter un .htaccess à la
racine qui va contenir la ligne suivante pour demander à ce que blog.php
soit affiché par défaut lorsque l'adresse racine est demandée :

    DirectoryIndex blog.php

##### Bug et vraie solution

Comme vous le verrez, cette solution fonctionne très bien pour la
racine. Mais si vous commencez à cliquer sur les liens vers des
sous-répertoires, vous risquez d'avoir des surprises : vous ne verrez
parfois plus les fichiers que vous pensez pointer, mais seulement un
listing du répertoire qui le contient.

**Pourquoi ?**

Très simple : via la directive `DirectoryIndex`, vous avez changé le
comportement global du serveur Web. Une chose très importante à savoir
est que les .htaccess s'appliquent de façon **récursive**, c'est à dire
que si vous fixez une règle dans un répertoire, tous les
sous-répertoires verront cette règle leur être appliquée.

Donc, vous venez de changer le fichier de base, du classique index.php
ou index.html au \_blog.php\_ : si un répertoire ne possède pas de
fichier blog.php, la règle habituelle de listing du répertoire sera
appliquée.

**Mais alors nous sommes fichus ?**

Bon sang de chybronhuitre à la muuu^[[1](#pnote-176-1)]^ ! Mais
qu'allons-nous deviendre ?

Ne vous en faites pas, les plus rapides auront déjà trouvé une solution
très simple : on ne doit pas seulement mettre *blog.php*, ce qui
correspond à remplacer tous les noms de fichiers indiqués dans la
directive DirectoryIndex du fichier httpd.conf, mais plutôt préfixer la
liste classique avec blog.php. Ce qui donnera :

    DirectoryIndex blog.php index.php index.html

Voilà, ce sera tout pour aujourd'hui.

Je pars en congés mercredi jusqu'au 15 août. Je vais pouvoir enfin
reprendre ma dose de volley. Vous n'aurez donc peut-être plus de
nouvelles de ma part d'ici là :-). Je reviendrai en pleine forme pour
traiter tous les billets que j'ai à l'esprit et que j'ai mis en attente
par manque de temps, notamment en raison de la rédaction de mon mémoire
d'ingénieur que je devrai rendre peu après mon retour de congés :-\\.

Bref, bonnes vacances à tous :-).

#### Notes

[[1](#rev-pnote-176-1)] private joke

