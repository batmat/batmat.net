---
Title: "Continuum : envoyer le mail après le build dans tous les cas"
Date: 2007-11-30
Author: "Baptiste Mathus"
---



Nous avons récemment installé et configuré
[Continuum](http://maven.apache.org/continuum/). Comme nous démarrons
avec, nous avons configuré nos projets pour recevoir systématiquement un
mail lorsque le build est terminé, qu'il ait réussi ou non. Nous voulons
en effet nous assurer que le build est bien effectué par ce biais. Une
fois que nous aurons rôdé le processus, dans quelques mois par exemple,
je pense que nous modifierons effectivement la configuration pour rendre
le serveur d'intégration moins bavard...

Voici le bloc qui permet de dire au serveur d'intégration d'envoyer les
mails dans tous les cas. À mettre dans le pom.xml de votre projet :

    <ciManagement>
        <system>continuum</system>
        <url>http://mvnrepo.mipih.fr:8080/continuum</url>
        <notifiers>
            <notifier>
                <type>mail</type>
                <sendOnError>true</sendOnError>
                <sendOnFailure>true</sendOnFailure>
                <sendOnSuccess>true</sendOnSuccess>
                <sendOnWarning>true</sendOnWarning>
                <configuration>
                    <address>notre-adresse@mipih.fr</address>
                </configuration>
            </notifier>
        </notifiers>
    </ciManagement>

### Dans tous les cas, j'ai dit !

Mais en fait, même comme ça, continuum ne vous enverra pas toujours la
notification. En fait, il ne l'enverra que si l'état de la construction
de votre projet a changé depuis la dernière fois. De base, donc,
continuum n'enverra pas de mail si dexu builds successifs ont réussi.

J'ai donc cherché à savoir comment configurer continuum pour envoyer le
mail inconditionnellement à la fin de chaque build. Comme je n'ai pas
trouvé cette information dans la documentation de continuum, [j'ai posé
la question sur la liste de
diffusion](http://mail-archives.apache.org/mod_mbox/maven-continuum-users/200711.mbox/%3c474FE8CC.7000801@venisse.net%3e).
J'ai eu la réponse d'Emmanuel Venisse, le *projet lead* de continuum :

> You can configure "alwaysSend to true in
> WEB-INF/classes/META-INF/plexus/application.xml in the mail notifier
> component descriptor.
>
> By default, we don't send notifications if the state doesn't change to
> not spam users.
>
> Emmanuel
>
Dans continuum 1.0.3, c'est là :
*\$CONTINUUM\_HOME/apps/continuum/conf/application.xml*. Et
effectivement, après modification du bloc \<alwaysSend/\> à *true* du
composant mail notifier comme suit, ça marche !

    <!--
        The mail notifier
    -->
    <component>
        <role>org.codehaus.plexus.notification.notifier.Notifier</role>
        <role-hint>mail</role-hint>
        <implementation>
            org.apache.maven.continuum.notification.mail.MailContinuumNotifier
        </implementation>
        <requirements>
            <requirement>
                <role>org.codehaus.plexus.velocity.VelocityComponent</role>
            </requirement>
            <requirement>
                <role>org.apache.maven.continuum.store.ContinuumStore</role>
            </requirement>
            <requirement>
                <role>org.codehaus.plexus.mailsender.MailSender</role>
            </requirement>
            <requirement>
                <role>org.apache.maven.continuum.configuration.ConfigurationService</role>
            </requirement>
        </requirements>
        <configuration>
            <from-mailbox></from-mailbox>
            <from-name></from-name>
            <timestamp-format>EEE, d MMM yyyy HH:mm:ss Z</timestamp-format>
            <includeBuildResult>true</includeBuildResult>
            <alwaysSend>true</alwaysSend>
        </configuration>
    </component>

En espérant que ça en aide certains...

