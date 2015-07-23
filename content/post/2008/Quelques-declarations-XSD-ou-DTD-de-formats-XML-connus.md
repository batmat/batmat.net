---
Title: "Quelques déclarations XSD ou DTD de formats XML connus"
Date: 2008-06-24
Author: "Baptiste Mathus"
url: "2008/06/24/Quelques-declarations-XSD-ou-DTD-de-formats-XML-connus"
---



C'est le genre de chose qu'il est sympathique d'avoir écrit en tête de
ce type de fichier pour disposer de l'auto-complétion XML dans son IDE
favori. Lorsque j'utilise un nouveau format XML, la première chose que
je cherche est en effet à ajouter cet entête pour me faciliter la vie
(et aux autres une fois *commité* :)).

Note : dans la liste ci-dessous, je ne mets pas le prologue XML pour
gagner en concision. Toutefois, ça ne fait jamais de mal de le mettre.
Personnellement j'essaie de le mettre systématiquement.

### Hibernate : mappings hbm.xml

Même s'il vaut mieux à mon avis passer aux annotations lorsqu'on en a la
possibilité, voici une déclaration de DTD qui fonctionne chez moi pour
ceux qui ont encore des mappings hibernate à la sauce XML :

     
    <!DOCTYPE hibernate-mapping PUBLIC "-//Hibernate/Hibernate Mapping DTD 3.0//EN" 
    "http://hibernate.sourceforge.net/hibernate-mapping-3.0.dtd">
    <hibernate-mapping package="net.batmat.domaine">
    ...
    </hibernate-mapping>

### Java Persistence : persistence.xml

Pour ceux qui utilisent [Java
Persistence](http://java.sun.com/javaee/technologies/persistence.jsp),
cette "sous-spécification" des EJB3 devenue une spécification autonome
dans sa version 2 :

     
    <persistence xmlns="http://java.sun.com/xml/ns/persistence"
        xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
        xsi:schemaLocation="
            http://java.sun.com/xml/ns/persistence
            http://java.sun.com/xml/ns/persistence/persistence_1_0.xsd"
        version="1.0">
    ...
    </persistence>

### Spring : fichier de contexte XML

Depuis la version 2, ils ont subdivisé leur format XML en différents
namespaces. Voici un exemple fonctionnel qui met en œuvre un certain
nombre de ces espaces de nommages XML. Je laisse en exercice le passage
à Spring 2.5 (que nous utilisons, d'ailleurs, mais on n'a pas mis à jour
le XML) ou l'ajout d'un autre namespace dont vous auriez besoin :-).

     
    <beans xmlns="http://www.springframework.org/schema/beans"
        xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
        xmlns:util="http://www.springframework.org/schema/util"
        xmlns:aop="http://www.springframework.org/schema/aop"
        xmlns:tx="http://www.springframework.org/schema/tx"
        xsi:schemaLocation="
            http://www.springframework.org/schema/beans
            http://www.springframework.org/schema/beans/spring-beans-2.0.xsd
            http://www.springframework.org/schema/util
            http://www.springframework.org/schema/util/spring-util-2.0.xsd
            http://www.springframework.org/schema/tx
            http://www.springframework.org/schema/tx/spring-tx-2.0.xsd
            http://www.springframework.org/schema/aop
            http://www.springframework.org/schema/aop/spring-aop-2.0.xsd">
    ...
    </beans>

### Maven : pom.xml

Celui-là, il est sacrément pratique vu la taille du truc :

     
    <project xmlns="http://maven.apache.org/POM/4.0.0"
        xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
        xsi:schemaLocation="http://maven.apache.org/POM/4.0.0
                          http://maven.apache.org/maven-v4_0_0.xsd">
    ...
    </project>

Voilà déjà pour cette fois. Une fois cet entête ajouté, dans Eclipse par
exemple, tapez juste "\<" quelque part et vous verrez la liste des
balises apparaître et leur documentation si les auteurs l'ont indiquée
(après qu'Eclipse ait pu récupérer le XSD sur Internet, bien sûr) :
![Auto-complétion du XML avec
Eclipse](/dotclear/public/images/auto-completion-xml-eclipse.png)

Si vous en avez d'autres, n'hésitez pas à les poster (ou à les demander,
si je suis dans un bon jour) dans les commentaires.

**Update 01/10/2008**, ajout du application.xml des
[EAR](http://fr.wikipedia.org/wiki/EAR_(format_de_fichier)) :

     
    <!DOCTYPE application PUBLIC "-//Sun Microsystems, Inc.//DTD J2EE Application 1.3//EN" 
         "http://java.sun.com/dtd/application_1_3.dtd">
    <application id="mon appli">
    ...
    </application>

