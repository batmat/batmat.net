---
Title: "Utilisation de StringBuffer et autres ruses"
Date: 2004-06-09
Author: "Baptiste Mathus"
url: "2004/06/09/61-utilisation-de-stringbuffer-et-autres-ruses"
---



**Mise à jour 2009 : Aujourd'hui, préférez simplement l'utilisation de
la classe StringBuilder à la place de StringBuffer. Le reste de
l'article reste valable.**

Voici donc le premier billet traitant de programmation, je pense que ce
n'est que le premier d'une longue série. J'espère aussi que ça sera le
petit coup de pouce qui manque à Syl pour savoir sur quoi blogguer plus
souvent :-).

Aujourd'hui on va faire du Java.

### Exemple de code qu'il est *MAL®*

Vous le savez certainement ou vous l'avez au moins entendu dire : la
classe `String` est non mutable. Qu'est-ce que ça signifie ? Ça veut
dire qu'une fois instanciée vous ne pouvez plus la modifier... Vous
pouvez vérifier, il n'existe aucun mutateur (*setter*) pour cette
classe.

Exemple : écrivons une méthode qui ajoute à hello les chiffres 1 à 9.

    public static String sayBadHello(){   String bonjour = "bonjour";   for(int i=1;i<10;++i)   {       bonjour += i;   }   return bonjour;}

Ici, qu'est-ce qui se passe ? On instancie un objet `String` et on y met
"bonjour". Ensuite, on fait quoi ? Ben, à chaque boucle, on prend la
variable bonjour, on lui concatène le chiffre en cours et on affecte le
résultat à bonjour.

En faisant ça : on instancie une nouvelle String à chaque fois et
l'ancienne String est *garbagée* (comme l'utilisateur-développeur ne
possède alors plus aucune référence vers cette variable, la machine
virtuelle sait qu'elle peut supprimer cet ancien objet dès qu'elle le
voudra).

Vous voyez le problème maintenant ? Pour une boucle de n éléments, on va
instancier n objets ! Si vous passez votre temps à appeler cette
méthode, vous déclencherez autant de fois cette aberration.

### StringBuffer

Pour éviter ces nombreuses instanciations inutiles, il existe la classe
`StringBuffer` qui, elle, est mutable. J'ose espérer que vous les
utilisez déjà et que pour les étudiants d'entre vous, vos profs ont
pensé à insister dessus. S'ils ne connaissent pas, ben je m'inquiéterai
pour votre formation. Si vous ne connaissiez pas, à partir de maintenant
vous n'aurez plus d'excuse :-).

#### Utilisation des méthodes append

Ces méthodes permettent d'ajouter un grand nombre de types différents à
la chaîne stockée sous forme de caractères.

Voici un exemple simple d'utilisation pour corriger l'exemple précédent
:

    public static String sayGoodHello(){   StringBuffer bonjour = new StringBuffer(20);   bonjour.append("bonjour");   for(int i=1;i<10;++i)   {       bonjour.append(i);   }   return bonjour.toString();}

### Plus de finesse

Quelques petits compléments pour les plus affamés :-).

-   Les plus attentifs auront remarqué le **++i** là où on rencontre le
    plus souvent un **i++**. Ce n'est pas anodin, c'est juste un léger
    gain en terme de performances mais tellement simple à obtenir que je
    ne vois pas pourquoi je m'en priverais. À l'origine, je tiens ce
    conseil d'[Anubis](http://www.genezys.net) qui m'a fait réaliser que
    dans l'un des cas, on a besoin d'une variable temporaire
    supplémentaire et non dans l'autre.

    Grossièrement, c'est dû à ça (ces deux déclarations sont environ
    celles du C++, d'après les quelques souvenirs qu'il m'en reste. Avec
    ma chance, d'ailleurs, c'est sûrement l'inverse puisque je les
    remets au pif. Pas grave, l'objectif n'est pas de faire du C++ mais
    de faire saisir la différence entre la pré et la
    post-incrémentation) :

    **Post-incrémentation : i++**

        int operator++() {   int sauvegarde = i;   this.i = this.i +1;   return sauvegarde;}

    **Pré-incrémentation : ++i**

        int operator++(int) {   this.i = this.i +1;   return this.i;}

-   Si vous utilisez un `StringBuffer` avec plusieurs append statiques
    qui se suivent (merci Linux Magazine) :

        buffer.append("bonjour");buffer.append("au revoir");

    Utilisez plutôt :

        buffer.append("bonjour")      .append("au revoir");

    Vous éviterez ainsi d'empiler inutilement le retour de la méthode
    append sans vous en servir.

