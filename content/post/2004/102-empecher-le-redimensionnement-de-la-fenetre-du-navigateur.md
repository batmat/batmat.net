---
Title: "Empêcher le redimensionnement de la fenêtre du navigateur"
Date: 2004-11-19
Author: "Baptiste Mathus"
url: "2004/11/19/102-empecher-le-redimensionnement-de-la-fenetre-du-navigateur"
---



Un peu comme le
[target=\_blank](http://www.genezys.net/blog/2004/11/12/71-bloquer-le-target_blank-dans-firefox-10),
le redimensionnement de ma fenêtre de navigation m'exaspère. Et comme ça
m'énerve, j'ai cherché à corriger ça.

J'ai donc ouvert cette chère adresse bien connue
[about:config](http://about:config "Ce lien ne fonctionne pas, c'est normal")
et me suis mis en recherche d'une propriété de *resize*. Avec la version
1.0 de Firefox, la page about:config possède un filtre. Je tape r e s i
et là, il ne reste plus que quelques propriétés.

C'est du javascript qui permet de redimensionner la fenêtre, donc
j'essaie un nom qui me paraît cohérent :
`dom.disable_window_move_resize` que je passe à true.

Ça marche ! Plus de redimensionnement sauvage :-). Décidément, j'aime
beaucoup Firefox.

Par contre, je ne sais pas si cette propriété était présente dans les
versions précédentes de FF. Ça marche chez vous ? En quelle version ?

