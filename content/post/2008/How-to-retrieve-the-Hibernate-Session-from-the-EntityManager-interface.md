---
Title: "How to retrieve the Hibernate Session from the EntityManager interface"
Date: 2008-07-13
Author: "Baptiste Mathus"
url: "2008/07/13/How-to-retrieve-the-Hibernate-Session-from-the-EntityManager-interface"
---



Well, as I myself fell into this stupid gap, I guess I'll try to help. I
was quite pushed in this trap by a fallacious part of the [jboss
documentation](http://docs.jboss.org/ejb3/app-server/reference/build/reference/en/html/hibernate.html#d0e241) :

    @PersistenceContext EntityManager entityManager;
    public void someMethod();
    {
      org.jboss.ejb3.entity.HibernateSession hs = (HibernateSession)entityManager;
      org.hibernate.Session session = hs.getHibernateSession();
    }

**Let's be clear : this is totally WRONG!** Yes, it will work under
JBoss, but as there's a standard way to do this, this is not the right
way to do this.

In fact, there's a dedicated method that lets you retrieve the
underlying persistence manager : *EntityManager.getDelegate()*. If you
read this method's javadoc, you'll see the following :

    /**
     * Return the underlying provider object for the EntityManager,
     * if available. The result of this method is implementation
     * specific.
     * @throws IllegalStateException if this EntityManager has been closed.
     */
    public Object getDelegate();

And the "underlying provider", for Hibernate, is obviously the Hibernate
*Session* instance...

So, the right way to retrieve the Session is something like the
following instead :

    @PersistenceContext EntityManager entityManager;
    public void someMethod();
    {
      org.hibernate.Session session = (Session)entityManager.getDelegate();
    }

Under JBoss, using this code won't make a big difference. But using the
standard way will let you run your code under several appservers
(namely, it works like a charm^[[1](#pnote-293-1)]^ under JBoss 4.2.2.ga
and Glassfishv2ur1 for example). If you use the bad way above, this will
just crash under Glassfish, for example...

I reported the [corresponding documentation bug in the JBOSS
tracker](http://jira.jboss.com/jira/browse/JBDOCS-282).

Hope this helps...

#### Notes

[[1](#rev-pnote-293-1)] ça, c'est pour Seb

