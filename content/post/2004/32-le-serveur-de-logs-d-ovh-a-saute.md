---
Title: "Le serveur de logs d'OVH a sauté"
Date: 2004-04-24
Author: "Baptiste Mathus"
---

Je ne comprenais pourquoi, d'un seul coup, mes statistiques n'indiquaient plus aucune visite sur Batmat.net :-). Vous nous auriez ainsi si lâchement abandonné ? Avec une peur un peu dissimulée :-), j'ai donc joint le support d'OVH : leur serveur de logs avait rendu l'âme, ce n'est pas donc pas Batmat.net qui a été renié par son (faible) lectorat, bonne nouvelle ! Voici l'échange avec l'équipe d'OVH :
----------------

Avant de vous livrer ici le contenu de cet échange, je tiens à remercier
ici la réactivité et la franchise d'OVH qui a tout de suite reconnu son
tort et expliqué clairement ce qu'ils faisaient sans chercher à
dissimuler le problème. Ils n'ont pas cherché non plus à me faire croire
que je puisse être à l'origine du souci. De plus, ce qui ne gâte rien,
la réponse est arrivé une heure seulement après la question.

Bref, bravo OVH !

Mon message :

> Bonjour,
>
> Il semble y avoir un souci avec les logs. Je possède le nom de domaine
> batmat.net que vous hébergez et depuis quelques jours, il s'affiche
> soit 1 visite soit 0 par jour...
>
> Rien qu'avec mes visites depuis différentes machines, je suis sûr d'en
> faire 2 ou 3 par jour au moins et si on s'en réfère au trafic des
> jours précédents, ce nombre semble imcohérent.
>
> Merci de corriger ça au plus vite ou de m'indiquer comment le faire si
> l'erreur est de mon fait.
>
> Merci

La réponse :

> Bonjour,
>
> Nous avons bien reçu votre message
>
> Le serveur de logs a explosé, rsync (la technologie qu'on utilise pour
> transferer les fichiers de logs) sature aussi. Nous l'avons prevu et
> nous avons contruit un nouveau serveur de logs avec 3.5To de disque
> (16x250Go en 4U). Pour le mettre en place et changer completement la
> manière de decharger les logs, il nous faudra quelques jours de
> travail. Nous allons mettre aussi en place d'autres types de
> statistiques qu'urchin.
>
> On espere que les logs vont revenir courant de la semaine prochaine.
>
> En esperant avoir répondu à votre attente
>
> Cordialement, Frederic

