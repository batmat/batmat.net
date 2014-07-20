---
Title: "AJouter un fil RSS à phpbb"
Date: 2005-04-14
Author: "Baptiste Mathus"
---



J'ai un mal de plus en plus grand à suivre les sites qui ne fournissent
pas de fil
[RSS](http://fr.wikipedia.org/wiki/Really_simple_syndication "Really Simple Syndication").
J'aurais même tendance à dire qu'à moins que celui-ci ne m'intéresse
infiniment et que j'y pense régulièrement, un site ne fournissant aucun
canal RSS n'a qu'une toute petite chance que je revienne (régulièrement,
du moins).

**EDIT : La crainte qui peut venir à l'esprit est que les gens suivent
le fil rss mais ne viennent plus sur le site. Il semble bien que ce ne
soit pas le cas, via
[pointblog](http://www.pointblog.com/past/2005/04/22/rss_au_new_york_times.htm),
on apprend que les statistiques globales d'un site proposant un canal
RSS ont plutôt tendance à augmenter...**

De la même façon, les forums actuels se devraient de fournir un fil RSS
de leurs posts afin de faciliter leurs suivis. Le forum de
[DotClear](http://dotclear.net), utilisant
[punbb](http://punbb.org/index.php), permet par exemple de suivre tous
les posts de chaque thème.

Récemment, j'en ai eu assez de devoir me connecter tout le temps sur le
forum installé pour l'association de promotion de ma filière
(Informatique Réseaux : [AvenIR](http://www.avenir.asso.fr), bientôt
refondu en XhtmlCss j'espère) au sein de mon école ([ingénieurs
2000](http://www.ingenieurs2000.com)). J'ai donc décidé de jeter un œil
rapide aux tables du forum phpbb pour être en mesure d'écrire une petite
requête destinée à me simplifier la vie pour suivre le forum de l'asso :
écrire le fil RSS de ce fichu forum.

Voici le code qui en a résulté :

    <?
    header('Content-type: text/xml;charset=iso-8859-15');

    echo "<?xml version='1.0' encoding='iso-8859-15'?>
    "; ?>

    <?php
    $hostname = "adresse du serveur de BD"; 
    $user = "le user de la bd"; 
    $password = "le password qui va avec"; 
    $bdd = "nom de la bd"; 

    $link = mysql_connect($hostname, $user, $password)
    or die("Connexion au SGBD impossible. <BR /> Vérifiez votre login et votre mot de passe.");
    mysql_select_db("$bdd") or die("La base de données $bdd n'existe pas ou n'a pas été trouvée");
    ?>

    <rss version="2.0" xmlns:dc="http://purl.org/dc/elements/1.1/">
    <channel>
    <link>http://adresseduforum/</link>

    <title>Forum AvenIR</title>
    <description>Posts du forum PhpBB de l'association AvenIR. 
      Ce fil permet de suivre le forum sans s'y connecter pour rien. 
      Bref, le but d'un fil RSS :-)</description>
    <dc:language>fr</dc:language>
    <dc:creator>Batmat</dc:creator>

    <?php
    function transformHtml($myText)
    {
        $myText2 = preg_replace('/\&/','&amp;', $myText);
        return preg_replace('/\x9c/','oe',$myText2);
    }

    // Définition d'une requete SQL
    $query="select post_subject,post_time,username,post_text,p.post_id from phpbb_posts as p,phpbb_posts_text as t,phpbb_users as u where p.post_id=t.post_id and p.poster_id=u.user_id ORDER BY post_time DESC  LIMIT 0 , 30";

    // Exécution par Php de la requete SQL
    $result=mysql_query($query);

    while($row = mysql_fetch_array($result))
    {
        echo "<item>
    ";
        //La date doit avoir le format suivant : 2005-04-01T00:00:00+01:00
        echo "  <dc:date>".date("Y-m-d\TH:i:s+01:00",$row[1])."</dc:date>
    ";
        echo "  <dc:creator>".$row[2]."</dc:creator>
    ";
        echo "  <title>".transformHtml($row[0])."</title>
    ";
        echo "  <description>".transformHtml($row[3])."</description>
    ";
        echo "  <link>http://adresseduforum/viewtopic.php?p=".$row[4]."#".$row[4]."</link>
    ";
        echo "</item>

    ";
    }
    ?>
    </channel>
    </rss>

    <?php
    mysql_close($link);
    ?>

*Mes compétences en php étant limitées et ayant voulu faire vite et
fonctionnel, j'ai conscience que le code php n'est certainement pas des
plus propres. Je suis toutefois tout à fait preneur de techniques
d'améliorations simples et substancielles du code présenté ci-dessus.*

Deux choses pour finir :

-   Au cas où vous vous poseriez la question, ce fil passe bien la
    [validation](http://feedvalidator.org).
-   Je crois avoir vaguement lu en diagonale que cette fonctionnalité
    est à présent disponible pour phpbb, mais elle n'est toujours pas
    disponible sur le [forum](http://www.phpbb.com/phpBB/) en tout
    cas :-(

