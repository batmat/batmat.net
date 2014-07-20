---
Title: "Comment gérer la rétro-compatibilité avec l'API d'Eclipse"
Date: 2008-07-13
Author: "Baptiste Mathus"
---



Dans cet article, Eugene présente un cas où une API évolue. Une méthode
est ajoutée qu'il serait bien de pouvoir utiliser. Problème : le faire
rendrait le code non rétrocompatible. Donc, pour le faire tout de même
sans casser la compatibilité, il utilise la *reflection*. Et pour le
faire proprement, il met en œuvre un Proxy afin que ce code soit bien
externalisé.

Une [solution très
classe](http://www.jroller.com/eu/entry/dealing_with_api_compatibility)
de la part d'Eugene Kuleshov.

