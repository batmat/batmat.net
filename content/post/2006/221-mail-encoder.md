---
Title: "Mail encoder"
Date: 2006-05-13
Author: "Baptiste Mathus"
url: "2006/05/13/221-mail-encoder"
---



J'ai écrit [une page qui vous permet d'encoder vos adresses
email](http://tests.batmat.net/encodeMail). Je l'ai fait parce que celle
qui était auparavant disponible chez [Olivier](http://www.neokraft.net)
semble ne plus l'être.

Cette technique permet de réduire le nombre de spams reçus. Toutefois,
bien évidemment, il ne s'agit en aucun cas d'une technique infaillible.
Je parle bien d*'encodage* et non de cryptage. Un robot un peu élaboré
n'aura donc pas plus de mal à récupérer *pouet@free.fr* que
*%70%6f%66%40%66%72%65%65%2e%66%72*.

Il s'agit en l'occurrence simplement d'une sorte de petite bidouille qui
met seulement hors-jeu les robots collecteurs les moins élaborés. Et
l'expérience semble montrer que la plupart des robots ne s'embêtent pas
à tenter de récupérer les adresses encodées, il doit y en avoir déjà
largement suffisamment qui ne le sont pas... Il existe un nombre
important de façon de rendre plus difficile aux robots la récupération
des adresses email. La technique en question d'encodage présente surtout
l'intérêt d'être directement utilisable dans un lien *mailto*.

Ça me fait penser à autre chose : personnellement, lorsque j'écris une
adresse au format texte, du style *moi chez free point fr*, je le fais
en essayant d'utilisant des modèles pas trop standards, mélangeant les
langues, at avec point, chez et dot, écrivant POWAIN au lieu de POINT
lorsque le sérieux de l'endroit me le permet (e.g. pas sur un CV). Je
vous conseille de faire de même si vous êtes paranoïaques. En effet, il
semble envisageable d'écrire un programme qui récupère simplement tout
ce qui ressemble à l'expression suivante :
"(.\*POINT)+CHEZ(.\*POINT).\*" ou quelque chose de ce genre afin de
récupérer sur la toile un grand nombre d'adresses écrites dans ce format
à la mode... Il serait peut-être intéressant d'écrire un pareil robot
pour voir la faisabilité de la chose, mais ça me semble hautement
faisable ^[[1](#pnote-221-1)]^...

#### Notes

[[1](#rev-pnote-221-1)] Notez que je parle ici uniquement de prouesse
technique, et en aucun cas je ne pense à cela dans le but de devenir un
spammer professionnel. Je vous encourage grandement à ne pas le faire
non plus dans ce but si vous ne souhaitez pas recevoir ma plus grande
inimitié et celle de la plupart des internautes de la planète (cf. mon
[rêve de désouder un
spammer](http://batmat.net/blog/2006/05/02/219-mise-a-jour-en-cours-ou-a-mort-les-spammeurs))

