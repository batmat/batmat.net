---
Title: "Comment connaître la provenance d'une classe programmatiquement en Java"
Date: 2010-01-13
Author: "Baptiste Mathus"
url: "2010/01/13/Comment-connaitre-la-provenance-dune-classe-programmatiquement-en-java"
---



Il est possible par programmation de savoir d'où vient une classe : un
jar ? un répertoire ? autre ?

Use case classique : vous pensez (et devez) ne plus avoir les
commons-logging nulle part dans votre classpath, parce que vous êtes
(intelligemment :-)) passés à [SLF4J](http://www.slf4j.org). Malgré
cela, il semble que cette fichue classe soit toujours trouvée, mais vous
n'arrivez pas à savoir dans quel jar (ou quel répertoire si vous
travaillez directement avec les .class). Résultat, ça vous fout un bazar
monstre dans la configuration de vos logs. Certains continuent à
apparaitre alors que vous avez demandé à ce qu'ils ne soient pas
affichés...

Le code est un peu sioux, alors je le mets ici au cas où ça vous
servirait :

     
    System.out.println(MaClasse.class.getProtectionDomain().getCodeSource().getLocation());

**MAJ du 15/03/2010**

Suite à l'incompréhension ci-dessous, voici quelques exemples pour
illustrer ce que fait ce code :

Le code :

     
    System.out.println(org.springframework.mail.MailSender.class.getProtectionDomain().getCodeSource().getLocation());
    System.out.println(MyJunitTest.class.getProtectionDomain().getCodeSource().getLocation());

Affiche sous Windows :

    file:/C:/m2repository/org/springframework/spring-context-support/2.5.6/spring-context-support-2.5.6.jar
    file:/C:/tests/myproject-core/target/test-classes/

J'espère que l'utilité est un peu plus claire à présent.

