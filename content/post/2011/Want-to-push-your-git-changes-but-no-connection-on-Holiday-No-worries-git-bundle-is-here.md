---
Title: "Want to push your git changes, but no connection on Holiday? No worries, git bundle is here !"
Date: 2011-08-02
Author: "Baptiste Mathus"
url: "2011/08/02/Want-to-push-your-git-changes-but-no-connection-on-Holiday-No-worries-git-bundle-is-here"
---



I’m currently writing this article offline, since I’m in a place where
even phones don’t work fine. Imagine the following situation:

-   Granted, it’s the summer, but outside the weather is more suited to
    the frogs than to the human beings…;
-   Your laptop is sitting next to you, waiting for you to tackle this
    long overdue task on a dev project ;
-   You use git, but your Internet connection is between lacky and
    inexistent. Your only way to receive updates is to regularly take
    your computer to some place where the network is a bit better (so
    you can sync your emails, for example).

So, what you would like to do is quite simple: work offline with git
(it’s one of its best forces, right?), then push a mail somewhere with
your commits. To do that, you have many possibilities:

-   Zip -9 your repository and send it as attachment!
    -   Ahem, mine is 400MB. Forget about it.
-   Git *request-pull/am/format-patch* to send mails and integrate them
    automatically on the other side
    -   Requires too many configurations for what I want.

So what’s left? *git bundle*. Let’s have a look at the documentation:

> git-bundle - Move objects and refs by archive

Ahem, well, not very explicit if you ask me. Let’s look at the
description:

> Some workflows require that one or more branches of development on one
> machine be replicated on another machine, but the two machines cannot
> be directly connected[…](… "…"). This command provides support for git
> fetch and git pull to operate by packaging objects and references in
> an archive at the originating machine, then importing those into
> another repository using git fetch and git pull after moving the
> archive by some means (e.g., by sneakernet). […](… "…")

More interesting.

I’ll rephrase it: we’re going to create a special archive, containing
only the commits I want, and finally send it as an attachment. People
receiving this mail will be able to just pull from this archive, as from
a normal repository! Sounds great, doesn’t it?

So, how to use it? Here’s my use case: I have to do some kind of code
review. So I’m gonna create a new branch from the main one “develop”,
I’ll call that new one reviewFeatX. Then, that‘s at least the content of
this branch I’d like to be able to send.

### The principle

For bundling to be efficient and interesting, it’s assumed that both
repositories have a common basis. That’s quite obvious anyway: if the
repository you’re working on is totally new, then you are likely to have
to send it in its entirety. Sending “some commits” only makes sense when
there’s in fact commits already present in both places. ![A Git
Tree](/dotclear/public/ScreenShot055.png)

Thanks to git’s “everything-is-a-sha” policy + every commit has a
parent, it’s quite easy for it to find the link between your work tree
and another one.

### Creating the archive

Looking at the picture above, what we would like to do is quite obvious:
send the blue part as an archive, and not a lot more if possible. Now,
how do we do that?

`$ git bundle create ../reviewFeatX.gitbundle develop..reviewFeatX`

Notice the “develop..reviewFeatX”: this part will be passed through the
*git rev-list* command, which will in fact return all the hashes (sha)
corresponding to the blue part above in the diagram. Now you have a
reviewFeatX.gitbundle file that you can send by email, dropbox or
whatever you want.

### Using the archive

On the other end of the pipe, someone is hopefully going to want to
retrieve commits from the file. Here’s how to do that:

-   First, you can just check if the bundle contains enough information
    to apply to your repository (that is: your local repository contains
    at least the commit basis onto which the bundle was created)

<!-- -->

    $ git bundle verify ../reviewFeatX.gitbundle
    The bundle contains 1 ref
    8c7feeb8d13233a466459cffc487ca08334af838 refs/heads/reviewFeatX
    The bundle requires these 1 ref
    6807f3ac794d72a410ac23fa8e2dc5c0bbd6c422 some log
    ../reviewFeatX.gitbundle is okay

-   So now, we can just apply it! To do that, just use the bundle as a
    remote repository.

<!-- -->

    $ git ls-remote ../reviewFeatX.gitbundle
    1fd7         refs/heads/reviewFeatX

    $ git fetch ../reviewFeatX.gitbundle reviewFeatX:reviewFeatX
    From ../reviewFeatX.gitbundle
     * [new branch]      reviewFeatX -> reviewFeatX

    $ git branch
    * develop
      master
      reviewFeatX

    $ git checkout reviewFeatX
    Switched to branch 'reviewFeatX'

    $ git log --oneline develop..reviewFeatX
    1fd7 log3
    df56 log2
    abc1 log1

That’s it! You’ve now imported the commits from the bundle you received
by mail.

As said in the introduction, you see there’s many ways to exchange
commits. I hope you’ll have found this one interesting and that it will
be useful to you.

