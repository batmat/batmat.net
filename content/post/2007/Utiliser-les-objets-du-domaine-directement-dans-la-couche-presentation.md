---
Title: "Utiliser les objets du domaine directement dans la couche présentation"
Date: 2007-06-02
Author: "Baptiste Mathus"
url: "2007/06/02/Utiliser-les-objets-du-domaine-directement-dans-la-couche-presentation"
---



Nous utilisons encore Struts 1 actuellement. Ce n'est normalement qu'une
question de temps avant de passer à autre chose. Nous sommes sûrs de ne
plus l'utiliser à terme. Nous connaissons donc notre source, mais pas
encore la cible. Voici les nombreuses solutions qui s'offrent à nous :

-   Struts 2
-   GWT
-   .Net
-   Flex
-   ...

Toutefois, je ne suis pas très chaud pour .Net ou Flex ou toute
technologie qui nous contraigne forcément à passer par les WS pour
accéder à nos services (développés en Java). Je suis réticent à devoir
obligatoirement passer par une couche WS alors que nous pourrions garder
du java de bout en bout, et ainsi économiser le
marshalling/unmarshalling incessant qui va avec les WS, sans parler du
problème de l'identification du graphe d'objets à sérialiser pour le
renvoyer. Quoi qu'on en dise, utiliser systématiquement des WS n'est pas
neutre et amène de nombreuses questions qu'on ne se pose jamais sinon
(hein Séb...).

Donc, pour revenir au sujet, nous ne sommes pas encore fixés sur notre
future couche présentation (ou plutôt nos futures couches de
présentation). Pour le moment, nous avons donc décidé de continuer à
fonctionner tant bien que mal Struts 1.x avec la version 2 du socle
technique que nous sortons.

Or, la différence fondamentale entre notre version 1 et notre version 2
est que nous avons supprimé une "transformation" systématique entre deux
couches. Auparavant, en effet, nos entités persistantes de couche DAO
étaient systématiquement transformés en objet de couche service. Entre
les deux couches, nous avions systématisé un bidouillage destiné à
régler le problème que nous avons dans la couche Web dans la gestion des
multiplicités 0..1.

### La gestion du null de Struts 1.x

Avec Struts 1, si vous demandez par exemple le prénom d'un client null,
vous n'aurez pas quelque chose de null, mais une exception. La question
a été discutée il y a déjà un moment sur la liste de Struts et [posée
sur le tracker de Struts en février
2001](https://issues.apache.org/struts/browse/STR-19) (quand je vous
disais que ça faisait un moment), et Craig Mc Clanahan d'expliquer que
le principe était que si vous vouliez afficher le prénom d'un client, eh
bien il fallait protéger le code pour n'afficher le prénom que si le
client est non null :

    [XML]
    <logic:present name="beanname" property="client">
      <bean:write property="client.prenom"/>
    </logic:present>

Si dans l'exemple ci-dessus, on met un champ de saisie à la place du
\<bean:write /\>, on est dans une impasse : certes, il n'y aura pas de
plantage, mais il devient alors impossible de saisir le prénom du client
puisque le *textfield* n'apparaîtra même pas...

Si votre objectif est de créer le client seulement si l'utilisateur a
saisi des données (exemple : le formbean en cours gère un objet Facture
qui a une [multiplicité](http://fr.wikipedia.org/wiki/Multiplicit%C3%A9)
0..1 vers un objet client), vous êtes obligé de créer dans votre
FormBean un objet destiné à recevoir ces données. Le problème qui
survient alors, c'est que si vous voulez conserver des objets
"propres"^[[1](#pnote-263-1)]^, vous devez ensuite vérifier l'instance
de Client pour la remettre à null ou l'associer manuellement (si pas
encore fait) à la Facture avant de transmettre la Facture à la couche
service pour mettre à jour. Ouf...

La longueur de l'explication ci-dessus par rapport à la complexité de ce
qu'il faut gérer me paraît parler d'elle-même. Et le code qu'il faut
écrire pour gérer ce cas est toujours le même... :

1.  avant affichage de la JSP : instancier les propriétés null pour
    pouvoir les afficher. Eh oui, rappel comme je l'ai dit plus haut :
    la demande de la propriété "a.b" déclenche une exception si a est
    null, il faut donc s'assurer que a est non null et l'instancier le
    cas échéant.
2.  après soumission du formulaire de la JSP et avant de passer les
    données à la couche application : supprimer les objets 0..1 non
    modifiés dans la JSP.

Struts 2
--------

Dans Struts 2, le premier point est géré différemment : la demande de
"a.b" si a est null renvoie simplement null. Par contre, le deuxième
point est toujours à gérer manuellement et plantera si on cherche à
valoriser *a.b*.

Une étape a déjà été franchie, pourquoi ne pas aller plus loin ?

### Une solution

Pourquoi ne pas instancier automatiquement a s'il est null lorsqu'on
cherche à valoriser *a.b* ? La question se pose d'autant que nous ne
sommes pas les seuls à nous être posés la question : ce
[patch](https://issues.apache.org/jira/browse/BEANUTILS-226) apportait
déjà les modifications nécessaires aux commons-beanutils (utilisé par
Struts, c'est cette bibliothèque qui impose le comportement de lever une
exception si une propriété imbriquée est demandée à l'intérieur d'un
objet null)...

Une autre
[solution](https://issues.apache.org/jira/browse/BEANUTILS-175) (sans
patch, cette fois) intermédiaire a été proposée pour la partie "get" :
mettre en place un handler externe pour gérer le cas des propriétés
imbriquées (nested properties) dans un conteneur null. Cette solution
est un intermédiaire intéressant parce qu'elle est très courte à
implémenter et permet de faciler renvoyer null ou de lancer une autre
exception dans le cas en question.

Cette deuxième solution ne gère toutefois que le cas get. Peut-être le
même principe serait-il utilisable pour le "set". Cela permettrait de
même de positionner une sorte de NestedSetterHandler qui pourrait
s'occuper d'instancier les propriétés intermédiaires si besoin. Avec un
fonctionnement de ce type, on pourrait même envisager de définir un
handler qui serait
[observable](http://fr.wikipedia.org/wiki/Observateur_%28motif_de_conception%29)
afin de gérer à la fois l'instanciation "dynamique" et de pouvoir suivre
les instanciations effectuées. C'est à creuser.

Ce mode de fonctionnement aurait toutefois quelques inconvénients :
lorsqu'on instancie manuellement a, on sait qu'on risque de devoir
l'enlever s'il n'est pas *vraiment* saisi avant de l'envoyer à la couche
service. Et que faire si on décide de faire gérer ça en standard par le
service ? Imaginons par exemple qu'une adresse ait été automatiquement
instanciée pour un Client. À quel composant, à quelle couche, incombe le
rôle de supprimer l'adresse créée dynamiquement si le fonctionnel
indique qu'elle n'est pas correcte ?

### Conclusion

Dommage que l'équipe de commons-beanutils soit peu réactive sur cette
question à mon avis primordiale de gestion des propriétés. C'est aussi
très dommage que l'idée d'avoir derrière la classe statique BeanUtils
une instance de BeanUtilsBean ne soit pas poussée à son terme : en
l'état, il est en effet impossible d'utiliser de façon transparente une
sous-classe BeanUtilsBean qu'on aurait adaptée à ses besoins.

Je nous vois bien maintenir en interne une version patchée de
commons-beanutils afin de résoudre le problème tant que nous utiliserons
Struts 1, en espérant bien sûr que le [patch en
question](https://issues.apache.org/jira/browse/BEANUTILS-226) soit
finalement appliqué.

En même temps, il reste la question de la gestion de la suppression des
propriétés instanciées dynamiquement. Mais je ne suis pas sûr que ce
soit un véritable problème, c'est un code qu'il faut de toute façon
écrire. Au final, il y a actuellement les deux points suivants à gérer :

1.  instanciation manuelle pour gérer l'affichage ;
2.  vérification des données et suppression des créations incorrectes si
    les données n'ont par exemple pas été saisies.

C'est à mon sens un point qu'il serait intéressant de creuser. Avec
Struts 2 par exemple, écrire un Interceptor chargé de l'instanciation
dynamique ferait l'affaire pour enlever le point 1 ci-dessus.

Le tout serait ensuite de définir un emplacement de choix pour faire la
validation, puis la suppression des propriétés fonctionnellement
"inacceptables". À part ce point, je ne vois aucun frein à cette
évolution. Cette question se posant pour n'importe quel formulaire de
saisie, le monde de l'informatique aurait à mon sens beaucoup à gagner à
trouver un véritable pattern pour gérer ce cas...

#### Notes

[[1](#rev-pnote-263-1)] c'est à dire que *facture.getClient()* renvoie
bien null si la facture en question n'a pas de client, et non une
instance bâtarde de *Client* qu'il vous faut ensuite analyser pour
savoir si c'est un vrai client ou bien simplement une instance
positionnée pour gérer des contraintes de présentation.

