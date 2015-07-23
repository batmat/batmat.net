---
Title: "Comment savoir quel processus utilise telle socket ou tel périphérique"
Date: 2005-10-05
Author: "Baptiste Mathus"
url: "2005/10/05/196-comment-savoir-quel-processus-utilise-telle-socket-ou-tel-peripherique"
---



Plusieurs commandes permettent de répondre à cette question.

#### Netstat

J'utilise en général la commande `netstat -ntap` pour voir quels sont
les ports ouverts. La dernière colonne indique quels sont les noms des
programmes qui utilisent les ports. Vous devez lancer cette commande en
tant qu'utilisateur root, sinon vous n'aurez pas les droits pour savoir
quels sont **tous** les processus en jeu.

Exemple :

    $ netstat -ntap
    (No info could be read for "-p": geteuid()=1000 but you should be root.)
    Active Internet connections (servers and established)
    Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name
    tcp        0      0 0.0.0.0:1476            0.0.0.0:*               LISTEN     -
    tcp        0      0 0.0.0.0:8009            0.0.0.0:*               LISTEN     -
    tcp        0      0 10.31.99.3:3306         0.0.0.0:*               LISTEN     -
    tcp        0      0 0.0.0.0:1099            0.0.0.0:*               LISTEN     -
    tcp        0      0 0.0.0.0:8080            0.0.0.0:*               LISTEN     -
    tcp        0      0 0.0.0.0:81              0.0.0.0:*               LISTEN     -
    tcp        0      0 0.0.0.0:8083            0.0.0.0:*               LISTEN     -
    tcp        0      0 0.0.0.0:21              0.0.0.0:*               LISTEN     -
    tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN     -
    tcp        0      0 127.0.0.1:25            0.0.0.0:*               LISTEN     -
    tcp        0      0 0.0.0.0:8090            0.0.0.0:*               LISTEN     -
    tcp        0      0 0.0.0.0:33370           0.0.0.0:*               LISTEN     -
    tcp        0      0 0.0.0.0:8091            0.0.0.0:*               LISTEN     -
    tcp        0      0 0.0.0.0:33371           0.0.0.0:*               LISTEN     -
    tcp        0      0 0.0.0.0:33372           0.0.0.0:*               LISTEN     -
    tcp        0      0 0.0.0.0:4444            0.0.0.0:*               LISTEN     -
    tcp        0    248 10.31.99.3:22           10.31.0.162:2301        ESTABLISHED-
    tcp        0      0 10.31.99.3:22           10.31.0.162:4268        ESTABLISHED-

En lancant la commande en étant *root* :

    $ sudo netstat -ntap
    Active Internet connections (servers and established)
    Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name
    tcp        0      0 0.0.0.0:1476            0.0.0.0:*               LISTEN     11485/java
    tcp        0      0 0.0.0.0:8009            0.0.0.0:*               LISTEN     11485/java
    tcp        0      0 10.31.99.3:3306         0.0.0.0:*               LISTEN     11969/mysqld
    tcp        0      0 0.0.0.0:1099            0.0.0.0:*               LISTEN     11485/java
    tcp        0      0 0.0.0.0:8080            0.0.0.0:*               LISTEN     11485/java
    tcp        0      0 0.0.0.0:81              0.0.0.0:*               LISTEN     5614/apache2
    tcp        0      0 0.0.0.0:8083            0.0.0.0:*               LISTEN     11485/java
    tcp        0      0 0.0.0.0:21              0.0.0.0:*               LISTEN     2034/xinetd
    tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN     968/sshd
    tcp        0      0 127.0.0.1:25            0.0.0.0:*               LISTEN     838/exim4
    tcp        0      0 0.0.0.0:8090            0.0.0.0:*               LISTEN     11485/java
    tcp        0      0 0.0.0.0:33370           0.0.0.0:*               LISTEN     11485/java
    tcp        0      0 0.0.0.0:8091            0.0.0.0:*               LISTEN     11485/java
    tcp        0      0 0.0.0.0:33371           0.0.0.0:*               LISTEN     11485/java
    tcp        0      0 0.0.0.0:33372           0.0.0.0:*               LISTEN     11485/java
    tcp        0      0 0.0.0.0:4444            0.0.0.0:*               LISTEN     11485/java
    tcp        0    148 10.31.99.3:22           10.31.0.162:2301        ESTABLISHED6839/1
    tcp        0      0 10.31.99.3:22           10.31.0.162:4268        ESTABLISHED11874/0

#### lsof

L'avantage de cette commande est qu'elle n'est pas limitée aux sockets.
Elle s'occupe de tout descripteur de fichier. De la même façon que pour
netstat, vous devrez lancer cette commande en *root* pour pouvoir
connaître les utilisateurs de tout descripteur.

Je fais tourner un apache2 sur le port 81 de la machine sur laquelle je
travaille. Pour utiliser *lsof* avec les sockets, voici la commande à
utiliser :

    $ sudo lsof -i :81
    COMMAND  PID     USER   FD   TYPE DEVICE SIZE NODE NAME
    apache2 5614     root    3u  IPv4  13850       TCP *:81 (LISTEN)
    apache2 5628 www-data    3u  IPv4  13850       TCP *:81 (LISTEN)
    apache2 5631 www-data    3u  IPv4  13850       TCP *:81 (LISTEN)
    apache2 5632 www-data    3u  IPv4  13850       TCP *:81 (LISTEN)
    apache2 5633 www-data    3u  IPv4  13850       TCP *:81 (LISTEN)
    apache2 5639 www-data    3u  IPv4  13850       TCP *:81 (LISTEN)
    apache2 7572 www-data    3u  IPv4  13850       TCP *:81 (LISTEN)
    apache2 7586 www-data    3u  IPv4  13850       TCP *:81 (LISTEN)

Je pense que ce sont tous les processus/threads qui peuvent accéder à la
socket qui sont montrés. Cette commande reste donc toutefois très utile
pour avoir une réponse exhaustive à la question “qui utilise ce port ?”
lorsque vous voulez le savoir.

Là, j'ai choisi un port pour lequel peu de lignes sont affichées. Pour
information, je fais aussi tourner un serveur J2EE JBOSS sur le port
8080, et lorsque je lance la commande `sudo lsof -i :8080`, le résultat
fait 59 lignes...

Je préfère donc netstat qui offre une réponse plus synthétique, ce dont
j'ai le plus souvent besoin.

##### Liens externes

-   [Administration
    debian](http://www.debian-administration.org/articles/184)

