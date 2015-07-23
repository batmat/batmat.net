---
Title: "How to load a XML Spring context lazily by default"
Date: 2008-01-13
Author: "Baptiste Mathus"
url: "2008/01/13/How-to-load-a-XML-Spring-context-lazily-by-default"
---



Say you want to change the default-lazy-init attribute programmatically.
The most common use case for this seems to appear with unit-testing. In
fact, you probably want to load everything when starting a production
server, even if it costs you more time. But when testing, and
particularly on your machine, you might want to inverse this behaviour.
In fact, you might be interested in not loading every 1000 beans of your
context when you just need less than 10 for example...

### A (beginning of) solution

If you crawl Google, you might find this
[entry](http://www.memestorm.com/blog/lazy-bean-instantiation-in-spring-20/)
that links to this other one [that explains how to programatically
modify the lazy-init attribute of each bean of your
context](http://janhoeve.blogspot.com/2007/08/speedup-development-by-making-spring.html).
In fact, before the loading occurs, you can iterate through the bean
list and call setLazyInit using the method
`AbstractBeanDefinition.setLazyInit(true)`. This will be roughly
equivalent to manually put *lazy-init="true"* on every single bean of
your context files.

### The problem

The problem with this is that you override everything that was declared
in the XML context file. You might want a particular bean be
instantiated lazily or eagerly for some reason. But iterating through
the whole list like this won't let you keep what was explicitly defined
and **only redefine the default value**. Another problem is that you may
have to exclude some bean from this loop, ending up with a condition
that really looks like an ugly hack :

    for (String beanDefinitionName : context.getBeanDefinitionNames()) {
        AbstractBeanDefinition beanDefinition = (AbstractBeanDefinition)context
                .getBeanDefinition(beanDefinitionName);
        System.err.println(beanDefinitionName);
        // FIXME : ugly hack
        if (!"org.springframework.aop.config.internalAutoProxyCreator".equals(beanDefinitionName)) {
            beanDefinition.setLazyInit(true);
        }
    }

Having to exclude the one bean that's (according to its name)
responsible for proxying beans that have to be lazy-loaded seems quite
reasonable. But the thing is you obviously don't have to do it when you
put the `default-lazy-init` manually...

So I looked for a way to simply replace the default value of this
attribute instead. After some time digging into Spring code, I finally
found it.

When parsing context definition written in XML (since [writing it in XML
is no
requirement](http://blog.interface21.com/main/2006/11/28/a-java-configuration-option-for-spring/)),
Spring will use an instance of
[BeanDefinitionReader](http://static.springframework.org/spring/docs/2.5.x/api/org/springframework/beans/factory/support/BeanDefinitionReader.html)
that will then call
[DefaultBeanDefinitionDocumentReader](http://static.springframework.org/spring/docs/2.5.x/api/org/springframework/beans/factory/xml/DefaultBeanDefinitionDocumentReader.html)
to parse the
[Document](http://www.docjar.com/docs/api/org/w3c/dom/Document.html)
instance. Searching a bit more lets us find where the default values are
initialized :
[BeanDefinitionParserDelegate.initDefaults()](http://static.springframework.org/spring/docs/2.5.x/api/org/springframework/beans/factory/xml/BeanDefinitionParserDelegate.html).

LazyInitByDefaultBeanDefinitionDocumentReader
---------------------------------------------

    public class LazyInitByDefaultBeanDefinitionDocumentReader extends DefaultBeanDefinitionDocumentReader
    {
        @Override
        protected BeanDefinitionParserDelegate createHelper(XmlReaderContext readerContext, Element root)
        {
            root.setAttribute(BeanDefinitionParserDelegate.DEFAULT_LAZY_INIT_ATTRIBUTE, "true");
            return super.createHelper(readerContext, root);
        }
    }

I would have preferred to use the seemingly more dedicated method
`preprocessXml(Node root)]`, but this method is called after
createHelper(), so the default values are already initialized when
calling preprocessXml()... So overriding preprocessXml() is "too late".

I think I'm going to submit a patch into the [Spring bug
tracker](http://jira.springframework.org/browse/SPR) about this problem.

Unit-testing
------------

When you do unit-testing with Spring, you generally inherit the
`AbstractDependencyInjectionSpringContextTests` class. Add this method
redefinition to enable the "lazy by default" behaviour :

    @Override
    protected BeanDefinitionReader createBeanDefinitionReader(GenericApplicationContext context)
    {
        XmlBeanDefinitionReader r = new XmlBeanDefinitionReader(context);
        r.setDocumentReaderClass(LazyInitByDefaultBeanDefinitionDocumentReader.class);
        return r;
    }

Plain old Java (Spring) code
----------------------------

When you want to create an XML context, you generally use a
ClassPathXmlApplicationContext instance. If you want to modify the
default behaviour like here, you have to use a
GenericApplicationContext. Note that this is what is adviced in the
javadoc of
[ClassPathXmlApplicationContext](http://static.springframework.org/spring/docs/2.5.x/api/org/springframework/context/support/ClassPathXmlApplicationContext.html)
:

> [This is a simple, one-stop shop convenience ApplicationContext.
> Consider using the GenericApplicationContext class in combination with
> an org.springframework.beans.factory.xml.XmlBeanDefinitionReader for
> more flexible context
> setup.](http://static.springframework.org/spring/docs/2.5.x/api/org/springframework/context/support/ClassPathXmlApplicationContext.html)

Here is the code using this GenericApplicationContext that enables the
lazy-loading :

    GenericApplicationContext context = new GenericApplicationContext();
    XmlBeanDefinitionReader reader = new XmlBeanDefinitionReader(context);
    reader.setDocumentReaderClass(LazyInitByDefaultBeanDefinitionDocumentReader.class);
    reader.loadBeanDefinitions("/yourApplicationContext.xml");
    context.refresh();

### When is it needed ?

At the moment, I see two reasons for enabling the lazy-loading by
default :

1.  When unit-testing, this lets you test a part of the code a bit more
    quickly, since not every single beans needs to be instantiated.
2.  When using code-coverage tools to evaluate a part of the code, this
    prevents totally unrelated code to appear with non-null percentage.

Hope this small article will help some other people :-).

