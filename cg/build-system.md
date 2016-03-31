# Build System for the "openLilyLib Book"

The "openLilyLib Book" is produced using
[GitBook](https://github.com/GitbookIO/gitbook), a Node.js based book authoring
and publishing system.  Pages are authored in *Markdown*, with a number of
extensions (see [Coding / Styling](coding.html).  There are two independent ways
to edit pages: online and locally.  In both ways you should respect the Git
branching model described on [Collaboration / Version
Control](collaboration.html).

## Working Online

Editing pages online has the major advantage that you don't have to take care of
installing the GitBook tools and build system. On the other hand editing online
has a number of limitations you should know about:

* The online file editor does not support a preview of the rendered Markdown
  document for *new* pages.
* The book will be built (on your branch) upon each “save” operation, including
  the risk of build fails when the file is faulty.
* Commits can only contain edits to one file. So it is not possible to, say,
  put the addition of a new page and the change in the Navigation file in a
  single commit.
* Files can be added through the web interface but not folders (it seems)
* It is not possible to add resources such as images through the web interface
  (it seems)

However, the web interface is a valuable tool for multiple use cases and
contribution types.  But if you intend to become a regular contributor it is
nevertheless recommended to go through the process and set up your local GitBook
build system.

## Building locally

To work locally on the book you will have to have the following tools installed:

* Git
* SSH
* Node.js and `npm` (Node package manager)
* GitBook
* Python
* python-ly (Frescobaldi's core library)


### Installing the Tools

This is what could be reproduced by the initial contributors.  If you can
provide additional experience or information please contact us.

#### Git

If you're running a **Linux** distribution chances are good that Git is already
installed, which you can check by running `git --version` in your terminal.  If
Git should not be there you can install it through your distribution's package
manager, for example using `sudo apt-get install git`.

On **Mac OS X** you can get Git from the official [Download
page](http://git-scm.com/download/mac).  Please do not install a bundled GUI
tool like SourceTree or GitHub for Mac.  Such tools may seem convenient and have
slick surfaces but they will obscure away how version control actually works,
preventing you from understanding the fundamentals. (If you already work with
such a tool you're of course free to continues to do so.)

For **Windows** there is also an official [Download
page](http://git-scm.com/download/win).  This contains `Git Bash`, a Git powered
emulation of the Unix command line shell.  So you'll be good to go with this
tool.  As a recommendation you can choose "Use Git from Bash only" and
"Checkout Windows-style, commit Unix-style line endings" to ensure compatibility
with the cross-platform project (and future projects).  When the installation
has completed you will find two entries in the Start menu: "Git Bash" and
"Git GUI".  From now on, when we'll talk about using the command line or the
terminal you can do what is necessary in Git Bash.

On each system you will have to *configure* Git with at least a few basic
things:

```
git config --global user.name "YOUR NAME"
git config --global user.email "YOUR EMAIL ADDRESS"
```

should get you going.  These informations are necessary to correctly attribute
your commits to your account.  The email address should be the same that you use
for your account on git.openlilylib.org.  If you have concerns regarding the privacy
it is suggested you use a throwaway address that you don't mind discarding one
day.  The address will be stored in the repository “forever”, and the name given
here will be displayed on the book's pages.

There is a page on GitHub's
[bootcamp](https://help.github.com/articles/good-resources-for-learning-git-and-github/)
that lists a number of resources for learning more about Git.

#### SSH

SSH
([Secure
SHell](https://duckduckgo.com/l/?kh=-1&uddg=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FSecure_Shell))
is a protocol for establishing secure encrypted connections, in our case between
your local Git installation and the remote repository's server.  On **Linux**
systems this is nearly always preinstalled, but it's not clear how the situation
is on **Mac OS X**.  You can check by entering `ssh` in a terminal, which should
give you a usage message if installed.  Usage and installation for **Windows**
is lacking documentation so far, but it seems [PuTTY](http://www.putty.org/) is
the tool you should be looking for.

Next step is to make sure you have a pair of SSH keys, following [this
tutorial](https://help.github.com/articles/generating-ssh-keys/) from GitHub up
to step 3.  Make sure to use the email address of your account, as this will be
used for
authentication against the key.  However, instead of submitting your public key
to GitHub you should log in to https://git.openlilylib.org and do the same thing
there:

Go to your *Profile setting* page, following the link at the top right corner of
the page,

![Screenshot](/assets/cg/gitlab-profile-link.png),  

proceed to the `SSH Keys` tab  

![Screenshot](/assets/cg/gitlab-ssh-keys-link.png)

and add your key there.

#### Node.js and npm

As we need a current version of Node.js (at least 0.12) you have to install it
from the website even if it should be present in your distribution's
repositories.
Choose from the [Download page](https://nodejs.org/download/) and proceed as
appropriate.  
For what it's worth, downloading the source package and doing

```bash
./configure
make
sudo make install
```

worked well on first try on **Linux**, as well as installing the downloaded
package like a regular **Mac** dmg.  The **Windows** installers can be used
equally smoothly, adding some entries to the start menu. What you will need is
the "node.js command prompt". This is where you will enter node.js related
commands on Windows. `node -v` will give you the version number upon successful
installation.

The `npm` package manager should be present by default after the installation
of Node.js, which you can verify with `npm --version`.

#### GitBook

The directions to get GitBook up and running are at its
[GitHub page](https://github.com/GitbookIO/gitbook).  If the suggested command
`npm install gitbook-cli -g` fails you may have to repeat it with `sudo` or
in another way as super user.  Note that you don't have to create a folder for
the GitBook application, as `npm` will automatically install it at the
appropriate locations (at least on Linux and Mac).

You can test the successful installation by issuing `gitbook` on the node.js
command prompt, which should give you a usage message, indicating tat it *is*
there in theory.

#### Python

Python should be present on any Linux system (and presumably also on Mac?).  The
book is tested with Python 2.7 but Python 3 should work as well.  Python is
needed to process LilyPond code blocks.  To test if Python is available on your
system issue `python` (without options) on the command line, which should fire
up the Python shell (indicated by some introducing lines and a `>>>` prompt).
To stop this shell enter `exit()` and press `Enter`.

For **Windows** you can download Python 2.7 from the
[official download page](https://www.python.org/downloads/release/python-2710/).
Once completed this will give you a few entries in the Start menu: a Python GUI
(IDLE), and Python command shell, which you can use to verify the installation.
However, you can also fire up python from both the node.js and the Git Bash.

#### python-ly

`python-ly` is a LilyPond document processing library provided by Frescobaldi.
You can install it through `sudo pip install pyhton-ly` or get it through its
Github repository.  However, you'll need `python-ly` > 0.9.2, so if no later
version is released you *have* to use the Git version.

Clone the repository from https://github.com/wbsoft/python-ly and add the newly
created directory to your `PYTHONPATH` environment variable.  Add something like
`export PYTHONPATH=$PYTHONPATH:/path/to/python-ly` in `~/.bashrc`, `~/.profile`
or another file, depending on your operating system (no idea about Windows so
far).

You can check if `python-ly` is properly installed by firing up a Python shell
as above and enter `import ly` inside. Leave the Python shell with `exit()`).

**NOTE:**  
Initially (as of June 25, 2015) our book relies on code that hasn't been merged
into `python-ly`'s master branch. For now please `cd` to the directory where you
have cloned `python-ly` and issue `git checkout config-colorize`.


### Getting the Source and Build the Book

Once you have Git running you can clone the book repository to a location of
your
choice with `git clone git@git.openlilylib.org:oll/book.git`.  Please note
that https access doesn't seem to work and you have to use ssh.  

If you have met all the requirements you can try to `cd` in the book repository
and run `gitbook build`.  If that goes through without errors you can check the
resulting book by opening `_book/index.html` in a browser.

Now you are (nearly) up and running to contribute to the “openLilyLib Book”.
There's one requirement left: an appropriate text editor, but we'll make a few
suggestions about this on [Coding](coding.html).  Please make sure you have read
that page and also [Collaboration / Versioning](collaboration.md) before
actually doing any work.

{% credits %}{% endcredits %}
