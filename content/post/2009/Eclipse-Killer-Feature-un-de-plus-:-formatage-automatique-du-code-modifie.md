---
Title: "Eclipse Killer Feature (un de plus) : formatage automatique du code modifié"
Date: 2009-02-25
Author: "Baptiste Mathus"
url: "2009/02/25/Eclipse-Killer-Feature-un-de-plus-:-formatage-automatique-du-code-modifie"
---



Voilà pourquoi j'utilise Eclipse, pour ce genre d'apports qui peut
paraître mineur au premier abord, mais qui en fait nous change la vie.

Lorsqu'on développe dans une équipe, on souhaite généralement appliquer
entre autre des normes communes de formatage. Dans Eclipse, le
Ctrl-Shift-F permet d'exécuter le formatage sur le fichier (ou sur toute
une arborescence) selon le modèle qu'on aura défini et chargé au
préalable.

Le Ctrl-Shift-F a cependant un défaut : sans sélection préalable, il va
formater le fichier complet. La fois suivante que vous envoyez vos
modifications aux gestionnaires de version (commit avec svn, par
exemple), les développeurs qui récupèrent votre modification peuvent se
demander pourquoi vous êtes allé modifier tout le fichier pour une
simple faute de frappe...

Autre cas encore plus problématique : vous faites du développement
[MDA](Model%20driven%20architecture). Une partie plus ou moins
importante de votre code est donc générée. Vous ne devez donc a priori
surtout pas toucher au code en dehors de ce qu'on appelle généralement
le code utilisateur (on retrouve ce principe avec acceleo il me semble).
Du genre

    // Ici, le code modifié manuellement sera écrasé par le générateur.
      // [DEBUT:METHODES]
    // Là, le code ne sera pas écrasé à la régénération suivante.
      // [FIN:METHODES]

Depuis la 3.3 d'Eclipse, dans la partie Java/Editor/Save Actions de
Window/Preferences, on peut demander à ce que le code qu'on vient de
modifier soit automatiquement formaté... C'est pas formidable, ça ? À
chaque Ctrl-S, le code modifié et uniquement celui-ci va subir le
formatage adéquat... Via cette fonctionnalité, vous pouvez automatiser
tout plein d'autres choses au moment de la sauvegarde, je vous laisse
jouer avec :-).

![java-editor-saveactions.png](/dotclear/public/images/java-editor-saveactions.png)

