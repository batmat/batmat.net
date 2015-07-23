---
Title: "[Hudson] How to set a private maven repository by job and easily be able to delete them"
Date: 2009-10-09
Author: "Baptiste Mathus"
url: "2009/10/09/[Hudson]-How-to-set-a-private-maven-repository-by-job-and-easily-be-able-to-delete-them"
---



When building maven projects with hudson, there's some [common best
practices about maven repositories
handling](http://www.sonatype.com/people/2009/01/maven-continuous-integration-best-practices/)
:

1.  isolate maven repositories between jobs
2.  regularly purge repositories

### The problem

The basic way to do it is to activate the hudson per-job option : "Use
private Maven repository". But the thing is you have to do it for EVERY
new job you add. There is no way inside hudson to activate it globally.

### Documented solution

If you look at hudson help for this option, you'll see a link to a
simple solution that [specify the repository directly in the maven
settings.xml
file](http://www.nabble.com/Hudson-on-2%2C-4%2C-8%2C-16-core-boxes--tt17767865.html#a17782153).
The tip is to redefine the localRepository tag inside settings with this
special value :

     
    <localRepository>${env.WORKSPACE}/m2_repo</localRepository>

This way, you're done with the first best practice : *isolate maven
repositories*. But not yet with the *regularly purge repositories* one.
Actually, using this option will put the m2\_repo inside each hudson job
workspace. So, finding and deleting them could become a bit cumbersome.
You'd have to cron something like
`find . -name m2_repo -exec rm -rf "{}" \;`.

### Even better

As you might have understood, I was not thoroughly satisfied with this
solution. I wanted to be able to *really easily* delete the
repositories. So I just changed the option above to have them all inside
the same root directory under \~/.m2/repositories, one per job.

Quite simple in fact, instead, just use :

     
    <localRepository>/some/path/.m2/repositories/${env.JOB_NAME}/repository</localRepository>

This way, the only thing you have to put in the cron job is
`rm -rf /some/path/.m2/repositories/`. A bit more straightforward, isn't
it? :-)

Hope this helps.

