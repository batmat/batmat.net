---
Title: "Linus a-t-il écrit Linux, traduction de la réponse de Tanenbaum"
Date: 2004-05-24
Author: "Baptiste Mathus"
---



Mise à jour du 3 mai 2005.

J'ai finalement décidé de tout mirrorer à un seul
[endroit](http://batmat.net/brown/).

Mise à jour du 1^er^ juin.

Je viens de recevoir la réponse de Andrew Tanenbaum et il m'autorise à
laisser la traduction :

> I don't mind the translation, but please put in the banner ad at the
> time.\
>  Andy Tanenbaum

Comme il le demande, j'ajoute le bandeau publicitaire du site d'origine

[![www.TellAnAmericanToVote.com](http://www.cs.vu.nl/%7East/brown/vote.jpg)](http://www.TellAnAmericanToVote.com)

Après ce [billet sur
tc](http://totalementcretin.apinc.org/blog/2004/05/20/51-le-retour-de-la-revanche-de-la-petite-souris)
indiquant que le cher Ken Brown de l'[institut Alexis de
Tocqueville](http://www.adti.net/) avait publié un livre remettant en
question l'écriture de Linux par Linus Torvalds, ce dernier avait
initialement [répondu](http://www.linuxworld.com/story/44851.htm) qu'il
n'en était effectivement pas l'auteur, mais qu'il était un homme de
paille pour le père Noël et la petit souris...

Ensuite, c'est carrément la principale source de Ken Brown, le célèbre
Andrew S. Tanenbaum, qui a [démolli](http://www.cs.vu.nl/~ast/brown/)
l'accusation. J'ai trouvé qu'il serait intéressant que la communité
francophone bénéficie d'une version française de ce document pour qu'il
ait un impact plus important et une diffusion plus large, j'ai donc pris
mon temps, mon courage et mon dictionnaire à deux mains (en gardant une
main sur le clavier, oui je sais, ça fait trois mains... Je suis
multihanded...) et je l'ai fait.

La traduction ci-dessous a été effectuée par mes soins et ne se prétend
en aucun cas un travail d'une qualité et d'une justesse irréprochable.
Je ne suis pas traducteur professionnel et je suis encore assez peu
habitué aux longues traductions. J'ai donc certainement fait des choix
qui ne s'avèrent pas des plus judicieux. Si certaines parties vous
paraissent bizarres et que avez le temps de faire une relecture en
fonction de l'[original](http://www.cs.vu.nl/%7East/brown/) pour me
proposer des améliorations, si vous remarquez des fautes de frappes ou
des parties qui vous semblent ne pas sonner très français (ce qui est
fort possible car on peut finir, lorsqu'on traduit, par mélanger
certaines tournures de la langue source et de la langue cible), je vous
encourage à m'en [faire part](mailto:batmat@batmat.net), je vous en
serai très reconnaissant et je vous promets que j'en tiendrai compte.

Comme vous pourrez le voir, j'ai quelquepeu outrepassé la consigne de
AST indiquant que seules des versions identiques peuvent être
diffusées... Comme toujours, une traduction étant aussi un travail
d'interprétation, on ne peut pas considérer cette version comme une
copie stricte de l'original. Au moment où vous lirez cet article, cela
signifiera que je l'aurai rendu public et que j'aurai donc certainement
déjà envoyé une demande de publication à AST.

Toutefois, comme il indique recevoir énormément d'emails et qu'il risque
de rater le mien, je publierai ce document avant la réponse afin
d'éviter que le travail de traduction que j'ai fournie n'ait été
totalement inutile (je ne l'ai en effet évidemment pas traduit pour moi,
mais pour la communauté... S'il ne restait que sur mon disque dur, cela
serait stupide).

Donc, si je recevais finalement une réponse de l'auteur original me
demandant instamment de retirer cette traduction, je le ferais
immédiatement, si elle vous intéresse, lisez la donc vite au cas où :-).
De même, si je recevais une réponse m'autorisant à diffuser librement ce
document, vous verriez immédiatement une note apparaître... En
attendant, je vous demande de ne pas copier cette version partout, merci
d'avance...

> Quelques Notes sur l'article *"Qui a écrit Linux, Release 1.5"*
> ===============================================================
>
> * * * * *
>
> Contexte
> --------
>
> L'histoire d'UNIX et de ses différents enfants et petits-enfants a été
> à l'actualité récemment grâce au livre de l'[institut Alexis de
> Tocqueville.](http://adti.net) Étant donné que j'ai été impliqué dans
> une partie de cette histoire, je ressens l'obligation de la mettre au
> clair et de corriger quelques erreurs extrêmement sérieuses. Mais
> avant cela, quelques informations sur le contexte.
>
> Ken Brown, Président de l'institut Alexis de Tocqueville, m'a contacté
> début mars. Il m'a annoncé qu'il était en train d'écrire un livre sur
> l'histoire d'UNIX et qu'il aimerait m'interviewer. Comme j'ai écrit 15
> livres et que j'ai été impliqué dans l'histoire d'UNIX de plusieurs
> façons, j'ai dit que je voulais bien aider. J'ai été interviewé par
> beaucoup de gens pour beaucoup de raisons à travers les années, je
> suis passé à la radio et à la télé néerlandaise et dans divers
> journaux et magasines, donc je ne m'en inquiétais pas trop.
>
> Brown est arrivé par avion à Amsterdam pour m'interviewer le 23 mars
> 2004. Apparemment je n'étais la seule raison de sa venue en Europe.
> L'interview a commencé de façon plutôt incertaine, grossièrement
> paraphrasée comme suit :
>
> AST : “Qu'est-ce que l'institut Alexis de Tocqueville ?”
>
> KB : “Nous produisons des travaux politiques publics.”
>
> AST : “Un comité d'experts, comme la Rand Corporation ?”
>
> KB : “En quelque sorte.”
>
> AST : “Qu'est-ce qu'il fait ?”
>
> KB : “Il publie des rapports et des livres.”
>
> AST : “Qui le subventionne ?”
>
> KB : “Nous avons de multiples sources de financement.”
>
> AST : “Est-ce que SCO est l'une d'elles ? Est-ce à propos du procès de
> SCO  ?”
>
> KB : “Nous avons de multiples sources de financement.”
>
> AST : “Est-ce que MicroSoft est l'une d'elles ?”
>
> KB: “Nous avons de multiples sources de financement.”
>
> Il était extrêmement évasif au sujet de la raison pour laquelle il
> était là et qui le financait. Il ne cessait de dire qu'il était
> simplement en train d'écrire un livre au sujet de l'histoire d'UNIX.
> Je lui ai demandé ce qu'il pensait du livre de Peter Salus, [Un quart
> de siècle
> d'UNIX](http://www.amazon.com/exec/obidos/tg/detail/-/0201547775/qid=1084872116/sr=1-1/ref=sr_1_1/103-6580823-0003846?v=glance&s=books).
> Il n'en avait jamais entendu parlé ! Je veux dire, si vous êtes en
> train d'écrire un livre sur l'histoire d'UNIX et vous faites 3000
> [miles](http://www.rr0.org/unites.html#mile) (NDT : environ 4800 km)
> pour interview un mec sur le sujet, est ce que ça ne vous viendrait
> pas à l'esprit d'aller sur amazon.com et de taper "history unix" dans
> la boîte de recherche, pour laquelle le livre de Salus est le premier
> résultat  ? Pour 28\$ (et livraison gratuite si vous payez par carte
> bleue) vous pourriez en apprendre un énorme bout sur le sujet et
> éviter ainsi de manquer quoi que ce soit. Comme je l'ai rapidement
> appris, Brown n'est pas le pire de l'équipe, mais j'étais déjà
> suspicieux. En tant qu'auteur depuis longtemps, je sais qu'il est
> sensé d'être au moins au courant de ce qui est en compétition. Lui ne
> s'en inquiétait pas.
>
> UNIX et Moi
> -----------
>
> Je n'ai pas trouvé anormal que Brown veuille m'interviewer à propos de
> l'histoire d'UNIX. Il y a des gens pire à qui demander. À la fin des
> années 70 et au début des années 80, j'ai passé plusieurs étés dans le
> groupe UNIX (Dept. 1127) des Bell Labs. J'ai connu Ken Thompson,
> Dennis Ritchie, et le reste des gens impliqués dans le développement
> d'UNIX. Je suis resté dans la maison de Rob Pike et celle de Al Aho
> pour des périodes de temps assez longues. Dennis Ritchie, Steve
> Johnson, and Peter Weinberger, parmi d'autres ont séjourné dans ma
> maison à Amsterdam. Trois de mes thésards ont travaillé dans le groupe
> UNIX des Bell Labs et l'un d'eux est aujourd'hui un membre permanent
> de l'équipe.
>
> Bizarrement, quand j'étais aux Bell Labs, je ne m'intéressais pas aux
> systèmes d'exploitation, bien que j'en aie écrit un et publié un
> document à ce propos (voir "Software - Practice & Experience," vol. 2,
> pp. 109-119, 1973). Je m'intéressais alors aux compilateurs, comme
> j'étais le designer en chef du "Amsterdam Compiler Kit" (see *Commun.
> of the ACM*, vol. 26, pp. 654-660, Sept. 1983.). J'ai passé quelques
> temps là-bas à discuter de compilateurs avec Steve Johnson, tout en
> travaillant en réseau avec Greg Chesson, écrivant des outils avec
> Lorinda Cherry, et rédigeant des ouvrage avec Brian Kernighan, entre
> autres auteurs. Je suis aussi devenu ami avec l'autre "étranger"
> là-bas, Bjarne Stroustrup, qui allait plus tard concevoir et
> implémenter le C++.
>
> En résumé, bien que je n'aie rien eu à voir avec le développement de
> l'UNIX original, je connaissais tous les gens impliqués et plutôt bien
> une grande partie de l'histoire. De plus, mon contact avec le groupe
> UNIX des Bell Labs n'était pas un secret; Je les ai même remercié pour
> m'avoir accueilli comme visiteur d'été dans la préface de la première
> édition de mon livre *Computer Networks*. Étonnamment, Brown ne savait
> rien de tout ça. Il n'a pas fait ses devoirs avant de s'embarquer dans
> son petit projet.
>
> MINIX et Moi
> ------------
>
> Des années plus tard, je donnais des cours un cours sur les systèmes
> d'exploitation en utilisant le libre de John Lions sur UNIX Version 6.
> Quand AT&T a décidé d'interdire l'enseignement du fonctionnement
> interne d'UNIX, j'ai décidé d'écrire ma propre version d'UNIX, libre
> de toute code d'AT&T et de toutes restrictions, afin de pouvoir
> enseigner sur son sujet. Mon inspiration n'a *pas* été mon temps passé
> aux Bell Labs, bien que de savoir qu'une personne avait pu écrire un
> système d'exploitation UNIX-like (Ken Thompson avait écrit UNICS sur
> un PDP-7) me disait que c'était possible. Ma réelle inspiration fût
> une remarque de Butler Lampson dans un de ses cours sur les systèmes
> d'exploitation que j'ai suivi alors que j'étais en thèse à Berkeley.
> Lampson venait juste de finir de décrire le système d'exploitation
> pionnier CTSS et dit, de sa façon inimitable : “Y a-t-il quelqu'un ici
> qui ne pourrait pas écrire CTSS en un mois ?” Personne ne leva la
> main. J'en conclus qu'il fallait être vraiment stupide pour ne pas
> être capable d'écrire un système d'exploitation en un mois. Le papier
> cité ci-dessus concerne un système d'exploitation que j'ai écrit à
> Berkeley avec l'aide de Bill Benson. Ça a pris beaucoup plus qu'un
> mois, mais je ne suis pas aussi rapide que Butler. Personne ne l'est.
>
> Je me suis donc proposé d'écrire un clone minimal d'UNIX,
> [MINIX](http://www.cs.vu.nl/%7East/minix.html), et je l'ai fait tout
> seul. Le code était 100% libre de la propriété intellectuelle d'AT&T.
> Le code source complet fût publié en 1987 comme annexe d'un livre,
> [Operating Systems : Design and
> Implementation](http://www.amazon.com/exec/obidos/tg/detail/-/0136386776/qid=1084876041/sr=1-1/ref=sr_1_1/103-3332923-5195038?v=glance&s=books),
> dont une seconde édition a été coécrite avec Al Woodhull. MINIX 2.0
> était même conforme à la norme POSIX. Les deux éditions contenaient
> des centaines de pages de texte décrivant le code de façon très
> détaillée. Une boîte de 10 disquettes contenant tous les binaires et
> le code source était disponible séparément chez Prentice Hall pour
> 69\$.
>
> Cela n'était pas un logiciel libre dans le sens "entrée libre",
> c'était bien un logiciel libre dans le sens "liberté d'expression"
> (NDT : cf. la [définition du logiciel
> libre](http://www.gnu.org/philosophy/free-sw.fr.html)) étant donné que
> le code source était disponible pour un tout petit peu plus que le
> coût de production . Mais même la "liberté d'expression" n'est pas
> complètement "gratuite"--[think about slander, yelling "fire" in a
> crowded theater, etc.] Rappelez vous aussi (si vous êtes suffisamment
> vieux) qu'en 1987, une licence universitaire éducative pour UNIX
> coûtait 300\$, une licence commerciale pour une université coûtait 28
> 000\$, et une licence commerciale pour une entreprise beaucoup plus.
> Pour la première fois, MINIX baissait le prix d'un code source
> "UNIX-like" à une somme qu'un étudiant pouvait se permettre. Prentice
> Hall ne s'intéressait pas vraiment à la vente du logiciel. Ils étaient
> intéressés par la vente de livres, il y eu donc une politique plutôt
> libérale en ce qui concerne la copie de MINIX, mais si une compagnie
> voulait le vendre pour ramener beaucoup d'argent, PH voulait des
> royalties. Donc les avocats de PH équipèrent MINIX de beaucoup de
> protections, mais sans jamais avoir l'intention de les utiliser contre
> des universités ou des étudiants. Utiliser Internet pour distribuer
> tout ce code n'était pas envisageable en 1987, même pour les gens avec
> un modem haut-débit (i.e., 1200 bps). Quand la distribution par
> Internet est devenu possible, j'ai convaincu Prentice Hall
> d'abandonner leurs (extrêmement modestes) ambitions commerciales et
> ils m'autorisèrent à mettre le source sur mon site web en libre
> téléchargement, où il l'est encore.
>
> Quelques mois après cette sortie, MINIX devint un genre d'objet de
> culte, avec son propre newsgroup USENET, comp.os.minix, avec 40 000
> abonnés. Beaucoup de gens ajoutèrent de nouveaux utilitaires et
> améliorèrent le noyau de nombreuses façons, mais le noyau original
> était le travail d'une seule personne--moi. Beaucoup de personnes
> commencèrent à me harceler pour que je l'améliore. En plus des
> nombreux messages dans le newgroup USENET, je recevais 200 e-mails par
> jour (à une époque où seuls quelques privilégiés avait même un e-mail)
> disant des trucs du genre : “J'ai besoin de pseudo-terminaux et j'en
> ai besoin pour vendredi.” Ma réponse était généralement rapide et
> précise : “Non.”
>
> La raison pour mes fréquents “non” était que tout le monde essayait de
> transformer MINIX en un système UNIX utilisable en production et que
> je ne voulais pas le rendre si compliqué qu'il deviendrait inutile
> pour mon but désigné, l'enseigner aux étudiants. J'espérais aussi que
> la niche pour un système UNIX libre utilisable en production serait
> comblé par GNU ou Berkeley UNIX rapidement, donc je ne visais pas
> vraiment cela. Finalement, l'OS GNU n'alla pour ainsi dire nulle part
> (même si beaucoup d'utilitaires UNIX furent écrits) et Berkeley UNIX
> se trouva embarqué dans un
> [procès](http://cm.bell-labs.com/cm/cs/who/dmr/bsdi/930303.ruling.txt)
> quand ses concepteurs créèrent une entreprise, BSDI, pour le vendre et
> choisirent 1-800-ITS UNIX comme numéro de téléphone. AT&T jugea que
> c'était une violation de copyright et les poursuivit. Cela prit
> quelques années pour que ce problème soit résolu. Ce délai pour sortir
> free BSD donna à Linux le temps dont il avait besoin pour devenir
> populaire. Si les poursuites n'avaient pas eu lieu, BSD aurait sans
> doute comblé la niche avec un client UNIX puissant et libre étant
> donné qu'il avait déjà un système stable et mature doté d'une base
> importante d'utilisateurs.
>
> Ken Brown et Moi
> ----------------
>
> C'est alors que Ken Brown a rappliqué et a commencé à poser des
> questions. Je me suis rapidement aperçu qu'il ne connaissait rien à
> l'histoire d'UNIX, n'avait jamais entendu parler du livre de Salus et
> ne savait rien au sujet du procès BSD/AT&T. J'ai commencé à lui parler
> de l'histoire d'UNIX, mais il m'a interrompu et m'a dit qu'il était
> plus intéressé par les aspects légaux. J'ai dit : “Oh vous parlez du
> brevet numéro 4135240 de Dennis Ritchie sur le setuid bit?” Alors j'ai
> ajouté : “Ce n'est pas un problème. Les Bell Labs ont dédié le
> brevet.” C'est comme ça que j'ai découvert que (1) il n'avait jamais
> entendu parler du brevet, (2) ne savait pas ce que signifie dédier un
> brevet (i.e., le mettre dans le domaine public), et (3) ne savait
> vraiment rien à propos des lois de propriété intellectuelle. Il ne
> connaissait pas grand chose à propos des brevets, copyrights, et
> marques déposées. Au cours de la discussion, je lui ai demandé s'il
> était avocat, mais c'était évident que non et il l'a reconnu. À ce
> moment, je pensais encore qu'il pourrait être un espion de chez SCO,
> mais que s'il l'était, SCO n'aurait pas un retour qui vaille
> l'investissement.
>
> Il voulait parler des problèmes de propriété, mais il tentait aussi
> d'éviter de me dire quel était son véritable but, il ne formulait donc
> pas très bien ses questions. Finalement, il m'a demandé si je pensais
> que Linus avait écrit Linux. J'ai répondu qu'à ce que je sache, Linus
> avait écrit tout le noyau lui-même, mais qu'après qu'il soit sorti,
> d'autres personnes ont commencé à améliorer ce noyau initialement très
> primitif. Ensuite de nouveaux logiciels furent ajoutés --
> essentiellement avec le même modèle de développement que MINIX.
> Ensuite il a commencé à focaliser là-dessus, avec des questions du
> genre : “A-t-il volé des parties de MINIX sans permission?” Je lui ai
> dit que MINIX avait clairement eu une énorme influence sur Linux en
> différents points, depuis la forme du système de fichier jusqu'aux
> noms dans l'arbre des sources, mais que je ne pensais pas que Linus
> avait utilisé la moindre partie de mon code. Linus utilisait aussi
> MINIX comme plate-forme de développement initialement, mais il n'y
> avait aucun mal à ça. Il m'a demandé si j'avais quelque chose à redire
> à ce sujet et j'ai répondu que non, pas du tout, les gens étaient
> libre de l'utiliser comme ils l'entendaient pour des utilisations non
> commerciales. Plus tard, MINIX fut publié sous la licence Berkeley, ce
> qui le libéra pour toutes les utilisations. De façon surprenante, il
> est encore largement utilisé, à la fois pour l'éducation et dans le
> tiers-monde, ou des millions de personnes sont heureux comme tout
> d'avoir un vieux castoff 1-MB 386, sur lequel MINIX tourne
> parfaitement. La page d'accueil de MINIX citée ci-dessus reçoit encore
> plus de 1000 hits par semaine.
>
> Finalement, Brown commença à focaliser plus durement. Il n'arrêtait
> pas de demander, de différentes façons, comment une personne pouvait
> écrire un système d'exploitation entièrement par lui-même. Il ne
> croyait simplement pas que ce soit possible. J'ai alors dû lui conter
> un peu plus l'histoire [soupir]. Pour démarrer, Ken Thompson écrivit
> UNICS pour le PDP-7 entièrement seul. Quand plus tard ce fut porté sur
> PDP-11 et réécrit en C, Dennis Ritchie rejoignit l'équipe, mais se
> concentra plutôt sur la conception du langage C, écrivant le
> compilateur C, le système d'entrée/sortie et les pilotes de
> périphériques. Ken écrivit presque tout le noyau lui-même.
>
> En 1983, une compagnie qui a maintenant disparu appelée la Mark
> Williams company a été créé et a vendu un très bon clone d'UNIX du nom
> de Coherent. La plus grosse partie de ce travail était faite par trois
> ex-étudiants de l'université de Waterloo : Dave Conroy, Randall Howard
> et Johann George. Cela leur a pris deux ans. Mais ils n'ont pas écrit
> que le noyau, mais aussi le compilateur C, le shell, et TOUS les
> utilitaires UNIX. C'est beaucoup plus de travail que d'écrire juste le
> noyau. On peut considérer que le noyau a pris moins qu'une
> année-homme.
>
> En 1983, Ric Holt publia un livre, qui n'est plus édité aujourd'hui,
> sur le système TUNIS, un système UNIX-like. C'était forcément une
> réécriture puisque TUNIS était écrit dans un langage complètement
> nouveau, concurrent Euclid.
>
> Ensuite Doug Comer écrivit
> [XINU](http://www.amazon.co.uk/exec/obidos/ASIN/0136381804/wwwlink-software-21/202-5358517-8004620).
> Bien que n'étant pas un clone d'UNIX, c'était un système comparable.
>
> Lorsque Linus démarra, cinq personnes ou petites équipes avait
> indépendamment implémenté le noyau UNIX ou quelque chose
> approchant.Nommément, Thompson, Coherent, Holt, Comer, et moi. Tout
> ceci était parfaitement légal et personne n'avait rien volé. Étant
> donné cette histoire, il est plutôt difficile d'affirmer qu'une
> personne ne peut pas implémenter un système de la complexité de Linux,
> dont la taille originale était environ la même que la  V1.0 de MINIX.
>
> Bien sûr, il est toujours vrai en science que les gens créent à partir
> du travail de leurs prédécesseurs. Même Ken Thompson n'était pas le
> premier. Avant d'écrire UNIX, Ken avait travaillé sur le système
> MULTICS (MULTiplexed Information and Computing Service) du MIT. En
> fait, le nom original d'UNIX est UNICS, une blague faite par Brian
> Kernighan pour le UNIplexed Information and Computing Service, parce
> que la version PDP-7 ne supportait qu'un utilisateur--Ken. Après trop
> de mauvais jeux de mots à propos d'EUNUCHS qui était un MULTICS
> castré, le nom fut changé pour UNIX. Mais même MULTICS n'était pas le
> premier. Avant il y avait eu le CTSS déjà mentionné, conçu par la même
> équipe au MIT.
>
> Toutefois, bien sûr, Linus ne s'est pas assis et tourné les pouces
> pour soudain taper le code source de Linux. Il avait mon livre,
> utilisait MINIX, et connaissait sans aucun doute l'histoire
> (puisqu'elle est dans mon livre). Mais le code était le sien. La
> preuve est qu'il a un peu gâché la conception. MINIX est un système
> micro-noyau joli et modulaire, avec les processus de gestion du
> système de fichier et le gestionnaire de mémoire tournant en espace
> utilisateur. Cela rend le système plus propre et plus sûr qu'un gros
> noyau monolithique ainsi que plus facile à débuger et à maintenir,
> pour un faible coût en terme de performances, même sur 4.77 MHz 8088
> ça bootait en peut-être 5 secondes (contre une minute pour Windows sur
> un hardware 500 fois plus rapide). Un exemple de micro-noyau
> commercial qui a réussi est QNX. Au lieu d'écrire un nouveau système
> de fichiers et un nouveau gestionnaire de mémoire, ce qui aurait été
> simple, Linus a réécrit le tout dans un gros noyau monolithique,
> complété avec du code assembleur inline :-( . La première version de
> Linux était comme une machine à remonter le temps. Elle retournait à
> un système pire que celui qu'il avait déjà sur son bureau. Évidemment,
> il n'était qu'un enfant et ne pouvait pas faire beaucoup mieux (à
> moins qu'il n'aie prêté une attention un peu meilleure en classe comme
> il aurait dû), mais il a donc produit un système fondamentalement
> différent de la base dont il était parti, ce qui semblait une bonne
> preuve que c'était une reconception. Je ne pense pas qu'il pourrait
> avoir copié UNIX parce qu'il n'avait pas accès au code source d'UNIX,
> à part peut-être par le livre de John Lions, qui parle d'une des
> premières versions d'UNIX qui ne ressemble pas trop à Linux.
>
> Ma conclusion est que Ken Brown ne connait pas ce dont il parle. Je me
> pose aussi de graves questions à propos de sa méthodologie. Après
> m'avoir parlé, il a rôdé dans les halls de l'université coinçant des
> étudiants au hasard pour leur poser des questions. Pas vraiment des
> sources idéales.
>
> Les six personnes que je connaisse qui ont (ré)écrit UNIX l'ont tous
> fait indépendamment et personne n'a rien volé à personne. La remarque
> de Brown selon laquelle les gens ont essayé et raté pendant 30 ans la
> construction de systèmes UNIX-like est une bêtise manifeste. Six
> personnes différentes l'ont fait indépendamment l'une de l'autre. En
> science, on considère qu'il est important de reconnaître les gens pour
> leurs idées et je pense que Linus a fait cela beaucoup moins qu'il
> n'aurait dû. Ken et Dennis sont les vrais héros ici. Mais le manque
> d'attention de Linus au sujet des attributions n'est pas une raison
> pour affirmer qu'il n'a pas écrit Linux. Il n'as pas écrit CTSS, il
> n'a pas écrit MULTICS, il n'a pas écrit UNIX et il n'a pas écrit
> MINIX, mais il a écrit Linux. Je pense que Brown doit des excuses à un
> certain nombre d'entre nous.
>
> Linus et Moi
> ------------
>
> Quelques-uns d'entre vous pourrait trouver bizarre que je sois ici en
> train de défendre Linus. Après tout, lui et moi avons eu un "débat"
> public mouvementé il y a quelques années. Mon premier objectif est
> d'essayer de faire surgir la vérité et non de critiquer tout sur une
> adolescente des montagnes reculées [back hills of West Virginia]. De
> plus, Linus et moi ne sommes pas "ennemis" ou quoi que ce soit de ce
> genre. Je l'ai rencontré une fois et il avait l'air d'un type sympa et
> intelligent. Mon seul regret est qu'il n'ait pas développé Linux en se
> basant sur la technologie micro-noyau de MINIX. Avec tous les
> problèmes de sécurité que Windows a maintenant, il est de plus en plus
> évident pour tout de monde que les petits micro-noyaux, comme celui de
> MINIX sont une meilleure base pour les systèmes d'exploitation que les
> énormes systèmes monolithiques. Linux a été la victime de moins
> d'attaques que Windows parce qu'il (1) est en effet plus sécurisé,
> mais aussi (2) parce que la plupart des attaquants pensent que frapper
> Windows offre un plus gros impact financier, ce qui fait que Windows
> est simplement plus attaqué. Comme je le croyais il a 20 ans, je crois
> toujours que la seule façon de faire des logiciels sécurisés, sûrs et
> rapide est de les faire petits. [Fight Features].
>
> Si vous êtes arrivés jusqu'ici, merci de votre temps. Permission vous
> est donnée de mirrorer cette page du moment que la version originale
> et non modifiée est utilisée.
>
> Andy Tanenbaum, 20 Mai 2004

