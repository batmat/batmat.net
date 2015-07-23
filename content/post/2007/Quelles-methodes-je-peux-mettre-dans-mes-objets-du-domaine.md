---
Title: "Quelles méthodes je peux mettre dans mes « objets du domaine » ?"
Date: 2007-11-29
Author: "Baptiste Mathus"
url: "2007/11/29/Quelles-methodes-je-peux-mettre-dans-mes-objets-du-domaine"
---



Gavin King, le créateur du projet [Hibernate](http://hibernate.org),
dont le hobby est maintenant devenu
[Seam](http://labs.jboss.com/jbossseam/), a récemment publié un [billet
intéressant sur ce
sujet](http://in.relation.to/Bloggers/WhatMethodsBelongOnAnEntity).

Souvent, la question se pose : quelles méthodes doit-on modéliser dans
un objet métier ? Concrètement, où dois-je mettre mon code métier ? Par
exemple, est-ce que la méthode de sauvegarde d'une facture doit se
trouver dans l'objet Facture lui-même ? Si je veux récupérer le nombre
de clients d'une facture, dois-je mettre la méthode dans la Facture,
etc. ?

Gavin a formulé d'une façon très concise une règle à laquelle je
souscris totalement :

> **the domain model (entity classes) are the most reusable classes in
> my codebase**
>
> [...]
>
> In particular, I would never write code that calls out to external
> services, or accesses the database, or calls an EJB/Seam/Spring
> component in my entity class. I want my domain model to be completely
> self-contained!
>
> So anytime you find yourself wishing that entities supported
> injection, or find yourself writing a JNDI lookup in a method of an
> entity, please consider that your domain model is no longer
> self-contained, and will be less reusable in different execution
> environments.

Rien de plus à ajouter.

