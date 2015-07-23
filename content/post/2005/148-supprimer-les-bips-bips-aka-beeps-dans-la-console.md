---
Title: "Supprimer les bips bips de la console"
Date: 2005-05-19
Author: "Baptiste Mathus"
url: "2005/05/19/148-supprimer-les-bips-bips-aka-beeps-dans-la-console"
---



Ou comment éviter d'entendre les réflexions de votre entourage : “'tain,
mais c'est chiant ce bip ! Tu peux pas l'enlever ?”. Et là, ou vous
baissez les yeux en disant que vous savez pas faire, ou vous savez le
faire. Ne vous inquiétez plus, maintenant vous saurez. :-)

Il y a deux cas : soit vous êtes sous X, soit vous êtes en mode console.

Sous X

    $ xset -b 0

En mode console

    $ setterm -blength 0

Merci à pouet de ccm qui m'a appris ce truc il y a deux ou trois ans.

