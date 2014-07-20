---
Title: "Le C++ c'est facile, mais..."
Date: 2004-07-02
Author: "Baptiste Mathus"
---



Quand on a des gros plantages en C++ on cherche toujours du coté des
pointeurs mal initialisés ou des dépassements d'espaces mémoire. Or
voila une petite liste d'erreur qui saute moins au yeux (donc plus
difficiles à debugger) mais dont l'effet est tout aussi destructeur:

-   Utiliser le constructeur par copie pour copier un objet de classe
    Polymorphe:

<!-- -->

    Object* y=new ObjectDeriv;
    ...
    Object* x=new Object(*y);

=\> l'appel au constructeur par copie n'est pas le bon Pour éviter de
tomber dans ce piège ou que d'autres y tombent en utilisant votre code,
mettez le constructeur par copie privé.

-   Faire un tableau d'objets d'une classe dérivée et l'utiliser comme
    tableau d'objet de la classe de base:

<!-- -->

    void f(Object *tab,int size){
     int i;
     for(i=0;i<size;++i)
     // manipulation de tab[i];
    }
    ...
    ObjectDeriv tab[10];
    f(tab,10);

Dans ce cas, le décalage effectué lors de l'accès à tab[i] est eronné.

Plus classique : oublier de surcharger le constructeurs par copie,
l'opérateur operateur= et du destructeur dans une classe contenant des
pointeurs.

-   Oublier de mettre virtuel le destructeur dans une classe qui peut
    être dérivée.
-   Dans les classes contenant des pointeurs : oublier de vérifier les
    auto-affectations dans l'operateur=.

<!-- -->

    const Object& operator= ( const Object& o){
        delete pt;
        pt=new PtType;
        pt=o.Pt;
    }

Dans le cas d'une auto-affectation (o==\*this), le pt=o.pt va échouer
car o.pt est déjà libéré. Dans ce cas 2 solutions :

-   Vérifier l'auto affectation :

<!-- -->

    if( this==&o )
      return o;

-   Sauvegarder le pointeur:

<!-- -->

      PtType* tmp=pt;
      pt=new PtType;
      pt=o.Pt;
      delete tmp;

Si vous avez d'autres erreurs du style, que vous avez planché dessus
pendant des heures et que vous voulez faire par de votre expérience
n'hésitez pas...

