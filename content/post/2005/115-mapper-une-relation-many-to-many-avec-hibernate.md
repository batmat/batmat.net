---
Title: "Mapper une relation many-to-many avec Hibernate"
Date: 2005-01-12
Author: "Baptiste Mathus"
url: "2005/01/20/115-mapper-une-relation-many-to-many-avec-hibernate"
---



Un peu de technique, soyons fou. Après cette nuit de coding party pour
le projet de génie logiciel de mon [école](http://www.avenir.asso.fr/),
je me dis que c'est sûrement un bon moment pour vous parler d'hibernate.

J'avais déjà un peu parlé d'hibernate
[ici](http://batmat.net/blog/2004/10/14/90-Hibernate) pour ceux qui se
demandent ce que c'est. En gros, c'est un outil qui permet de ne pas
s'occuper de la sauvegarde de ses objets dans une base de données. On
spécifie pour ce faire un mapping en XML indiquant les correspondances
entre le modèle relationnel (les tables de la BD) et le modèle objet
(les classes).

Je vais ici décrire comment effectuer un mapping many-to-many. Cet
exemple est ciblé pour ce besoin, si vous ne connaissez pas ce dont je
parle et que vous voulez en savoir plus, allez plutôt lire la
[documentation de
référence](http://www.hibernate.org/hib_docs/reference/fr/html/). Je me
suis initialement basé sur [cet
article](http://ditwww.epfl.ch/publications-spip/article.php3?id_article=517)
pour me documenter et réaliser mes tests.

Mon objectif est de donner un exemple simplifié au maximum, *mais
complet*. Par complet, j'entends donner le diagramme de classes et leurs
relations, le mapping de toutes les classes et tester quelques trucs qui
m'ont fait me poser des questions lorsque je cherchais.

J'ai prévu de faire ça sur différents sujets, je dirais que le prochain
que je ferai sera conditionné à la fois par les demandes en ce sens et
un peu par mon temps :-).

##### Les relations ?

On a une classe RCourse et une classe RStudent :

-   un cours peut contenir plusieurs étudiants ;
-   un étudiant peut assister à plusieurs cours.

![](/images/many-to-many-hibernate.png)

Rappelons ici, qu'une relation de type n/n génère sur un schéma
relationnel une *table intermédiaire* qui contient justement les
associations RCourse/RStudent existantes. Nous décidons d'appeler cette
table rstudent\_rcourse.

##### Le code

Voilà les deux classes Java correspondantes :

    public class RCourse
    {
       int id;
       String name;
       Set<RStudent> students;
       //Écrivez ici tous les setters et getters 
        [...]
    }
    public class RStudent
    {
        private int id;
        private String firstName;
        private String lastName;
       //Écrivez ici tous les setters et getters 
        [...]
    }

*Un conseil pour les getters et setters. Si vous utilisez un IDE comme
eclipse, demandez lui de générer toutes les méthodes en `protected`. En
effet, cette visibilité suffit à Hibernate pour accéder à l'objet
persistant et vous permet de ne pas exposer forcément tous les setters
publics sur votre objet. Un peu à la manière de la configuration d'un
firewall : fermez tout, ne passez ensuite en public que les méthodes au
fur et à mesure des besoins.*

##### Le mapping

La partie un peu moins facile que le reste est la description du set ,
mais le fichier reste quand même assez simple :

**Pour RCourse :**

    <?xml version="1.0"?>
    <!DOCTYPE hibernate-mapping PUBLIC "-//Hibernate/Hibernate Mapping DTD//EN" 
                    "http://hibernate.sourceforge.net/hibernate-mapping-2.0.dtd">
    <hibernate-mapping>
      <class name="de.berlios.chronos.technique.hibernate.relations.RCourse" 
        table="rcourse">
        <id name="id">
          <generator class="native"/>
        </id>
        <property name="name" type="java.lang.String" />
        
        <set name="students" table="rstudent_rcourse" lazy="false">
          <key column="course_id"/>
          <many-to-many class="de.berlios.chronos.technique.hibernate.relations.RStudent" 
            column="student_id" outer-join="true"/>
        </set>
      </class>
    </hibernate-mapping>

**Pour RStudent :**

    <?xml version="1.0"?>
    <!DOCTYPE hibernate-mapping PUBLIC "-//Hibernate/Hibernate Mapping DTD//EN" 
                   "http://hibernate.sourceforge.net/hibernate-mapping-2.0.dtd">
    <hibernate-mapping>
      <class name="de.berlios.chronos.technique.hibernate.relations.RStudent" 
        table="rstudent">
        <id name="id">
          <generator class="native"/>
        </id>
        <property name="firstName"/>
         <property name="lastName"/>
        
        <set name="courses" table="rstudent_rcourse" lazy="false">
          <key column="student_id"/>
          <many-to-many class="de.berlios.chronos.technique.hibernate.relations.RCourse" 
            column="course_id"/>
        </set>
      </class>
    </hibernate-mapping>

Faisons remarquer l'attribut lazy (i.e. paresseux, oui, oui) de la
balise set. Il conditionne le fait qu'Hibernate cherchera ou non à
peupler directement les collections dépendantes à la récupération de
l'objet (exemple : si on récupère un cours, si il doit aller chercher
tous les étudiants de ce cours tout de suite), ou si il doit attendre
l'utilisation de la collection en question pour le remplir.

##### Génération du SQL

Grâce à SchemaExport, il est possible de générer directement tout le SQL
correctement au mapping ci-dessus. Vous pouvez vous inspirer de
l'exemple de script donné
[ici](http://stessy.developpez.com/j2ee/hibernate/?page=page_3#L3.3.4.7)
si vous avez des soucis avec ça. Si vous insistez, je pourrais
éventuellement envisager d'écrire quelques explications sur le sujet.

    alter table rstudent_rcourse drop constraint FKDB6FCE57C276819F;
    alter table rstudent_rcourse drop constraint FKDB6FCE57575ED7BF;
    drop table rstudent_rcourse;
    drop table rstudent;
    drop table rcourse;
    drop sequence hibernate_sequence;
    create table rstudent_rcourse (
       course_id int4 not null,
       student_id int4 not null,
       primary key (student_id, course_id)
    );
    create table rstudent (
       id int4 not null,
       firstName varchar(255),
        lastName varchar(255),
       primary key (id)
    );
    create table rcourse (
       id int4 not null,
       name varchar(255),
       primary key (id)
    );
    alter table rstudent_rcourse add constraint FKDB6FCE57C276819F foreign key (student_id) references rstudent;
    alter table rstudent_rcourse add constraint FKDB6FCE57575ED7BF foreign key (course_id) references rcourse;
    create sequence hibernate_sequence;

##### Tester

Après avoir écrit le code, le mapping, généré le sql et créé les tables,
on peut tester. Il est notamment intéressant de tester l'influence du
paramètre lazy.

Conseil : sauvegardez des étudiants et un cours auquel ils assistent.
Essayez ensuite de récupérer l'objet RCourse en mettant tour à tour le
paramètre lazy à false ou true.

Positionnez l'affichage du code SQL (*hibernate.show\_sql=true*) et
faites quelques affichages entre la récupération de l'objet et le
premier accès que vous faites à la collection de students. Selon le mode
(fainéant ou non), vous remarquerez que le moment où la requête de
jointure est effectuée diffère : au moment du `Session.find()` pour
lazy="false", au premier accès à la collection pour lazy="true".

##### Conclusion

Bon, j'ai été un plus court que je n'aurais voulu, mais je suis très
fatigué et je pense que des docs plus complètes existent déjà sur
Internet. De toute façon, mon objectif résidait plus dans le fait de
founir tout le code nécessaire aux tests au néophyte afin qu'il puisse
constater simplement et rapidement le fonctionnement d'Hibernate.

