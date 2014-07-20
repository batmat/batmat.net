---
Title: "Do Interfaces have semantics ?"
Date: 2007-12-16
Author: "Baptiste Mathus"
---



When I saw the title of [this
entry](http://in.relation.to/Bloggers/DoInterfacesHaveSemantics) in my
feed reader, my first thought was “who the f\*\*\* could be wondering if
interfaces have semantics ?”. Happily, that's not Gavin who thinks this.

The assertion is the following :

> Interfaces in Java don't have any semantics attached. Only a concrete
> class can define the semantics of a method.

In my opinion, that's even what interfaces are designed for, defining
semantics...

I totally agree with Gavin when he says semantics is defined in the
Javadoc and the "name of the things". I always find myself taking a long
time to carefully choose the naming of my objects, since I want those
names to be the most meaningful possible (same for method parameters,
method names, and so on. Naming meaninfully local variable is also
important, but it goes beyond the scope of the current subject).

Using polymorphism let you see different implementations as the same
thing, thanks to the defined contract. Maybe I'm only viewing interfaces
throught the [Liskov
principle](http://en.wikipedia.org/wiki/Liskov_substitution_principle).
But for me *contract* is a synonymous for *semantics* when it comes to
programming, although I'd be glad to hear explanations of where it
differs in your opinion.

Even more, I think that today, as everybody gets more and more used to
using the [dependency
injection](http://en.wikipedia.org/wiki/Dependency_injection) pattern,
some concrete classes are not even known to the code they're used by.
It's becoming common to use classes only through their interfaces only
(services, for example). In those case, semantics resides in the
interface only, and implementations obviously have to respect it very
carefully.

