---
Title: "De l'importance du nommage, état atteignable ou état invariant ?"
Date: 2006-03-01
Author: "Baptiste Mathus"
url: "2006/03/11/215-de-l-importance-du-nommage-etat-atteignable-ou-etat-invariant"
---



Il y a quelques temps, j'ai eu l'occasion de rencontrer un cas qui m'a
donné à réfléchir sur la signification des suffixes anglais *able* et
*ed*. En l'occurrence, le cas portait sur une classe qui dérivait en
Java de `ArrayList` qui s'appelait `SortedArrayList`.

Cette classe ajoutait la possibilité de tri à sa super-classe ArrayList.
Elle possédait pour ce faire la méthode `sort()`, et c'est justement ça
que je le lui reprochais.

Le suffixe *able* signifie qu'un objet peut atteindre un état, sans y
être nécessairement constamment, par l'appel par exemple d'une méthode
qui lui fera atteindre cet état à un instant t. Pour une propriété X, le
sufixe *ed* signifie quant à lui qu'un objet est constamment X*ed*.

C'est peut-être un peu abstrait comme ça, je vais donc illustrer avec la
classe SortedArrayList dont j'ai parlé ci-dessus.

##### Sort*able*ArrayList et non Sort*ed*ArrayList

Une classe en *ed*, comme sorted, est triée. Cela signifie qu'elle l'est
constamment, en considérant un point de vue extérieur à l'objet : en
interne, l'objet peut ne plus respecter l'état, mais au retour de la
méthode, il doit y être revenu. Exemple : dans le corps d'une méthode
add d'un conteneur trié, il peut se faire que l'objet soit non trié à un
instant t, mais jamais au retour de la méthode add en question.

Toute action occasionnant une modification de son contenu doit laisser
l'objet **...Sorted** trié à l'issue de l'opération. Par exemple, un add
sur un *SortedSet* en Java n'a pas besoin d'être suivi par un tri pour
qu'une itération ultérieure sur l'instance se fasse toujours dans
l'ordre de tri.

À l'inverse, un objet suffixé par *able* est par exemple Tri**able** et
non Tri**é**, ce qui n'est pas du tout la même chose. Ainsi, une classe
nommée SortableArrayList possédera une méthode `sort()` et l'ajout d'un
objet à cette liste pourra ne pas forcément garantir que l'objet soit
constamment dans un état trié. Il sera alors possible d'appeler la
méthode sort() pour rétablir l'état trié au moment voulu.

##### Quand utiliser **able** ou **ed** ?

C'est assez simple. Je dirais que ça peut d'ailleurs souvent être lié à
des questions de performances. Il sera en effet certainement plus
coûteux de chercher à maintenir un état particulier constamment si ce
n'est pas absolument nécessaire. Auquel cas, il semblera alors plus
approprié d'utiliser le suffixe *able* et la méthode permettant de
revenir à cet état.

Si par contre, vous avez souvent, voire toujours besoin d'accéder à
l'objet alors que celui-ci est dans l'état voulu, utilisez le suffixe
*ed* pour que toute opération touchant à la structure de l'objet
conserve l'état à son retour.

