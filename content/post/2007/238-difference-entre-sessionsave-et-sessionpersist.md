---
Title: "Différence entre Session.save() et Session.persist()"
Date: 2007-01-02
Author: "Baptiste Mathus"
url: "2007/01/02/238-difference-entre-sessionsave-et-sessionpersist"
---



Dans la version 3 d'Hibernate, d'un point de vue strictement utilitaire,
il y a deux méthodes qui ont le même objectif : sauvegarder un objet en
base (ou le rendre persistant, comme on dit).

Le problème est donc de savoir laquelle il faudrait plutôt utiliser. Et
bien la réponse est simple, euuuu...

Traduction de ce qu'on peut lire dans la
[FAQ](http://www.hibernate.org/116.html#A22) :

> **Je ne sais pas si je dois utiliser save() ou persist().**
>
> Ces deux méthodes rendent persistante une instance éphémère (NdT :
> transient). Toutefois, la méthode persist() ne garantit pas que la
> valeur de l'identifiant sera assignée immédiatement, l'assignement
> pourrait arriver au moment du flush.
>
> La méthode persist() garantit aussi qu'aucun INSERT ne sera exécuté si
> elle est appelée en dehors d'un contexte transactionnel. Ceci est
> utile pour les conversations longues avec un contexte de
> persistance/session étendu.
>
> La méthode save() ne garantit pas la même chose. Elle retourne un
> identifiant, et si un INSERT doit être exécuté pour obtenir
> l'identifiant it returns an identifier (e.g. générateur "identity",
> pas "sequence"), cet INSERT arrive immédiatement, peu importe que vous
> soyez à l'intérieur ou à l'extérieur d'une transaction. Ce n'est pas
> bon pour les conversations longues avec un contexte de
> persistance/session étendu

En résumé, si vous faites des conversations longues, utilisez plutôt
persist(). Sinon il y a peu de différence, mis à part toutefois le
cascading. Celui-ci n'est propagé dans le cas de save() que si la
relation est mappée *cascade="save-update"*, alors que c'est
*cascade="persist"* pour persist().

Notez que si vous mappez *cascade="all"*, cela inclue à la fois
save-update et persist. Donc pour les relations mappées "all", la
sémantique de *persist()* et de *save()* sont à mon avis **extrêmement
proches**.

