# Collaboration and Git Workflows

The “openLilyLib Book” is maintained in a Git repository.  If you have followed
the steps in the [introduction](index.html) you now have a user account with
the privilege to push to the server.  If you decided to work locally and 
followed the steps in the [build system](build-system.html) page you also have
a bunch of installed tools and a local clone of the repository.

We are more or less enforcing a workflow of constant peer review - as is the
default with software development.  All work is to be done in the context of
*working branches* and may only be merged to the main line after being reviewed
by someone else.

Whenever you want to add or edit material please create a new branch and add
your commits to that. You may or may not prefix the branch name with your
initials. *One* level of name nesting is supported, so `ul/new-branch` is a valid
branch name while `ul/my/branch` is not.

**TODO:** Explain (with screenshot) how to create branches from the web interface.

When you think your work should be merged into the main book you can create a
*Merge Request* (which you may know under the name of “Pull Request”, but we use
the Gitlab terminology). If you are working locally you'll first have to push your
working branch to the remote repository, if you're in the web interface
everything is there already.  Please make sure your version of the book builds
cleanly on your local copy *before* pushing as it could otherwise cause our
automatic build process to fail (see below).

For opening a Merge Request go to
https://git.openlilylib.org/oll/book/merge_requests.  Please Pick your
working branch as “Source Branch” and `staging` as “Target Branch”.  `staging`
is not protected so any contributor will be able to merge your contribution, and
either an admin or a script will then take care of updating `master`.

We have a quite sophisticated “Git hook” in place that will build the book
whenever something is pushed to the server. Pushing to `master` will build and
update the official version of the book at http://book.openlilylib.org.
Therefore only material is suitable to be committed/merged to `master` that can
be considered ready for public release.
Pushing to a working branch will build the respective version of the book and
upload it to a dedicated path below http://bookbranches.openlilylib.org.  You
can use that checkout to ask others (even non-contributors) to review your work.
Whenever a remote branch is deleted the respective website on that test
subdomain is removed too.  Visiting http://bookbranches.openlilylib.org will
present you a not-too-stylish list with links to all versions that are currently
available online.  
**Note:** It seemss currently impossible to properly *remove* a branch from the
web interface. The branch may be deleted but the repsective build on the test
subdomain won't get removed.  So please do not remove branches online upon 
merging a Merge Request.

{% credits %}{% endcredits %}
