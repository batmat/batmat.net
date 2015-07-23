---
Title: "Best Practices in Java"
Date: 2004-12-09
Author: "Baptiste Mathus"
url: "2004/12/09/105-best-practices-in-java"
---



This post is a translation of [this
one](http://www.batmat.net/blog/2004/06/28/66-BestPracticesEnJava). Many
people commented it at the moment it was published although it was only
available to those who speak french.

I found it very interesting to try and compare my opinion with the
others. I thought it would be great to extend the possible field of this
post to the world into re-publishing (and adapting) it in english. The
other interest I see is that I could be corrected for my english
mistakes :).

It is the first time I do that, I bet that won't be the last one :).

* * * * *

Today, we're going to speak about best practices in the Java programming
language. We'll speak about the API classes that are fonctionnally
deprecated, we'll speak about evolutivity and abusive inheritance, all
of this framed by design patterns.

#### The forbidden classes

I still find projects on the web that are using the following classes
(surely this list isn't exhaustive, but these two are the most common) :

-   Hashtable
-   Vector

You must not use theses classes. They are still present only to assure
upward compatibility. The jvm 1.4 must be able to run a program written
for the 1.0, this version can in fact contain objects of this type
because their alternative only appear in the 1.2 version.

Since the 1.2 so, it mustn't be used anymore. Then why, you say, didn't
they deprecated those classes since this version ? That's very simple :
Hashtable is a *hash table* (a key-value list) and Vector is designed to
manage an objects list... That's to say extremely common and used
objects. So, Sun decided not to deprecate it to prevent old programs
developed with the 1.2 from getting hundreds, even thousands of warnings
during the compilation.

##### Why not use them ?

Those classes are "synchronized", they are what we call *thread-safe*.
It means that when you're in an environment containing more than one
thread of process, if you use them, you're sure your data will keep
coherent. That wouldn't be the case without synchronization.

The point is that this fonctionnality is far from being used in all
projects. In fact, we're not allways using our objects in a concurrent
context (and that's a good thing). Speaking about performances, this
synchronization is not free (as in free beer \^\^) (we're used to hear
about five times slower with synchro). So you see that using a Vector to
store your lists is commonly a pure waste of performances.

##### The alternatives

But which classes should I use as a replacement ? Those one, their non
thread-safe equivalents :

-   `ArrayList` for Vector
-   `HashMap` for Hashtable

##### So what if I want a thread-safe container ?

If you we're thinking about this question, congratulations. In a
concurrential environment, you must always synchronize objects in one
way or another... There's two solutions to do it :

Synchronization where it's necessary using a non synchronized container

-   Pros : Possible performance gain because you perfectly control the
    synchronization of your code ;
-   Cons : More difficult because you've got to take care not to forget
    this synchro if you don't want to get strange results, or worst :
    totally upset.

Use of synchronized container :

-   Pros : Just concentrate one good time on the development of the
    container. Then you'll be able to use it without fearing
    inconsistencies during execution ;
-   Cons : Possible loss of performance because you might use
    synchronization where it's not necessary.

Fortunately, you say, the class `Vector` which you can use when you need
a \_thread-safe\_ container. But no, you can drop this class. Instead,
use the static method
[Collections.synchronizedList()](http://java.sun.com/j2se/1.4.2/docs/api/java/util/Collections.html#synchronizedList(java.util.List) "Javadoc of the ''Collections'' class on the Sun website").
you'll get a synchronized list from one that is not. At the same, you'll
be using the important pattern which consists in hiding implementations.
Great ! That's what I'm going to speak now ! :-)

#### Increase code evolutivity

##### Hide implementation

A lot of applications are still using `Vector` today, why ? Because this
class has been used everywhere without being hidden by a class or an
interface.

Since the 1.2, Vector implements the `List` interface, so do `ArrayList`
and `LinkedList`. When using a list, the implementation must be hidden.
To do it, just say you're using a class that implements `List`. If you
get used to do it everywhere, you'll see that it becomes really simple
to change implementation afterwards. For example, if you decide that
`ArrayList` doesn't fit you anymore, you could easily replace it by a
personal implementation of `List`, nobody will know it and all the code
that isn't yours will keep unchanged (ant that's the BIG point).

##### The factories

Use factories to create your objects. This way you'll be easily able to
hide an implementation.

Example : Pouet must be able to say hello

    public interface Pouet
    {
      /**
       * Displays hello to the screen
       */
      public void sayHello();
    }

Very well, so the first thing to do is writing an implementation of
Pouet :

    public class PouetImpl implements Pouet
    {
      public void sayHello()
      {
         System.out.println("Hello");
      }
    }

If you only do this, the users of your class won't have any other choice
than writing

    PouetImpl pouet = new PouetImpl();

And they are a bit more experienced

    Pouet pouet = new PouetImpl();

Then they'll use Pouet and not PouetImpl everywhere in their code. The
problem is that you're letting others make choices in the way of using
your code. As much as possible, you've got to reduce the number of ways
you provide to do things. If you don't do this, you'll meet akward
maintenance problems...

If they're a bit experienced, they'll try to centralize this code. For
example, they will write the factory you should have written :

    public final class PouetFactory
    {
      public Pouet createPouet()
      {
         return new PouetImpl();
      }
      /**
       * Singleton for this factory.
       */
      public static PouetFactory getFactory()
      {
         if(pouetFactory==null)
         {
            pouetFactory = new PouetFactory();
         }
         return pouetFactory;
      }
      private static final pouetFactory;

      private PouetFactory()
      {
      }
    }

Here, we took care of doing 3 things :

-   provide a static method `getFactory()` ou `getInstance()` ;
-   put a private constructor to forbid the factory instantiation by
    external code ;
-   set the class final to prevent inheritance.

You see that if I want to use anything else than PouetImpl, nobody will
know it if I correctly designed my code into forcing to use it in the
way I want (putting for example the PouetImpl class protected if
possible. This way, it won't be instantiable by another object than one
of the package). I'll be able to easily change the implementation
impacting the fewest code.

#### Abusive inheritance

In the serie of the anti-evolutive code, let's put at the top the
excessive inheritances. Have'nt you already inherit from a JFrame only
to display a poor window that provides nothing more than the original
JFrame ? If yes, stop it. You've got to use delegation in most cases.
That's to say wrap the used object and provide a `getComponent()` method
that returns a `Component` for example.

Inheritance isn't a non-important or non-impacting choice, this design
choice must be motivated. When you do, that's because you want to change
a particular part of the behaviour of the object. If not, don't inherit,
use delegation.

#### That will do for today

Right, that's all for today. I've got still other things I want to speak
about. I will have to find time to do it, which is not done yet :-). I'd
like to speak about DAO, de commons-logging, de JNI with you... Well,
quite a lot of things.

If you disagree with some points ou if you want some more explanations,
use the comments... It's designed for that :-).

*Note for english readers : if you see sentences you don't understand.
Let me know. I may have used somes expressions coming from french that
aren't understandable in english...*

