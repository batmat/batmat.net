---
Title: "Configure Hudson CI Server to automatically disable itself when main SVN repositories become unreachable"
Date: 2010-04-01
Author: "Baptiste Mathus"
url: "2010/04/01/Configure-Jenkins-CI-Server-to-automatically-disable-itself-when-main-SVN-repositories-become-unreachable"
---



*Note: I wrote this post some months ago, and just made it public since
the problem making it impossible to use was fixed some weeks ago. In the
meantime, you should also be aware that Hudson has recently been renamed
to Jenkins, and its new house is now
[http://jenkins-ci.org/](http://jenkins-ci.org/ "http://jenkins-ci.org/")*

Sometimes, we encounter erratic issues accessing our subversion
repositories. Even apart from the server upgrade information that just
dont reach the interested people, but only managers who didn't forward
(since there're obviously not the ones that use the dev server...), we
also have random problems like everyone.

### The problem

When SVN becomes unreachable, every one starts receiving mails about it
from Hudson... For example, last week-end I received 6000+ emails about
that. So, I wrote this small [script to update all our jobs to not run
during both the night and the
week-end](http://wiki.hudson-ci.org/display/HUDSON/Change+SCMTrigger+for+each+project+to+disable+during+the+night+and+the+week-end).

But sure, this won't solve everything. For example, if the server goes
down during a working-day, and you're not in front of your computer for
some reason. When coming back to your box, you might discover the big
amount of mails from Hudson, or even from the devs if you're in charge
of operating the CI server.

So I've been looking for a way to just automatically disable Hudson
builds when a problem is detected.

### The solution

For some days now, I've been playing with the Hudson script console
since I discovered how greatly powerful it can be.

My starting point was the hudson command used to prepare a shutdown. How
to do it through the groovy console? I gave it here in [one tweet:
hudson.model.Hudson.instance.doQuietDown()](http://twitter.com/bmathus/status/11371789263).
Once I found this, I just had to find a way to interact with the SVN
inside the groovy/hudson console system and build around it a small
groovy script.

After some struggle about how to [programmatically use SVNKit
(Subversion pure Java
API)](https://wiki.svnkit.com/Printing_Out_A_Subversion_Repository_Tree),
and then [how to use an anonymous class with
Groovy](http://shrubbery.mynetgear.net/c/pages/viewpage.action?pageId=1802252#GroovyforJavaProgrammers-Anonymousinnerclassescanresultin%7B%7BUnknowntype%3AMETHODDEF%7D%7D),
I was done.

Here's the resulting script:

    import hudson.model.*
    import org.tmatesoft.svn.core.*
    import org.tmatesoft.svn.core.wc.*

    String[] repoToCheck = ['svn://svn/scle', 'svn://svn:3691/pgih']

    class MyHandler implements ISVNDirEntryHandler
    {
      def void handleDirEntry(SVNDirEntry dirEntry)
      {
        // nothing
      } 
    }
            
    org.tmatesoft.svn.core.internal.io.svn.SVNRepositoryFactoryImpl.setup();
    Map<String, Throwable> problematicRepos = new LinkedHashMap<String, Throwable>();
    for(String repo:repoToCheck)
    {
      SVNURL url = SVNURL.parseURIDecoded(repo);

      SVNClientManager clientManager = SVNClientManager.newInstance();

      SVNLogClient c = clientManager.getLogClient();
      try
      {
        // Special groovy anonymous class construct
        def handler = new MyHandler()
        c.doList(url, SVNRevision.UNDEFINED, SVNRevision.HEAD, false, false, handler);
      }
      catch (Exception e)
      {
        problematicRepos.put(repo, e);
      }
    }

    if(!problematicRepos.isEmpty())
    {
      for(Map.Entry<String, Throwable> entry:problematicRepos.entrySet())
      {
        println("Problem accessing \""+entry.getKey()+"\"");
        String s = entry.getValue();
        println(s)
      }
      println("Disabling hudson build")
      hudson.model.Hudson.instance.doQuietDown()
      return 1
    }
    else
    {
      println("No problems with repos");
    }

### How to install and configure it

Install the [Groovy Plugin for
Hudson](http://wiki.hudson-ci.org/display/HUDSON/Groovy+plugin). This
way, you'll be able to add job directly written in Groovy. Then create a
job that will run every minute! ("\* \* \* \* \*") and put the script
above inside an "Execute system Groovy script".

Then, configure the notification you like. It's probably a good idea to
target admin email when this jobs fails. That's what I did.

Important note: there used to be a difference of behaviour with
classloading between "groovy script console" and "groovy system script"
in a job. This made the script above unable to work. The good news if
that it was fixed with [Hudson 1.352 and
HUDSON-6068](http://issues.hudson-ci.org/browse/HUDSON-6068). So the bad
news is that you can't use this technique if you're using an older
version (time to upgrade? ;-)).

### Possible improvements

Sure the script isn't perfect, here's a few thought of what's currently
missing:

-   At the moment, watched repositories are explicitly declared in the
    script. Maybe it would be more interesting to iterate through the
    whole list of jobs to find the actual used repositories. But I feel
    this approach might be a problem: if only one job is failing, maybe
    the team HAS to be notified. You're not going to disable the whole
    hudson instance (or even cluster) for only one job failing, right?
-   About svn :
    -   this is the only supported scm in the script above
    -   Only the "svn" protocol is supposed to be supported. If you want
        to access http exposed repos, then you might have to also
        initialize the webdav subsystem by calling
        `DAVRepository.setup()` first.
-   *Groovify* the script a bit. I first wrote it in Java, and then
    adapted it a bit to be more groovy-like, but my experience in Groovy
    is only about two weeks, so please be indulgent.

Hope this helps!

