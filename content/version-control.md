# Version control and code review

:::{objectives}
- Browse **commits** and **branches** of a Git repository.
- Remember that commits are like snapshots of the repository at a certain point in time.
- Know the difference between **Git** (something that tracks changes) and
  **GitHub/GitLab** (a platform to host Git repositories).
:::


## Why do we need to keep track of versions?

Version control is an answer to the following questions (do you recognize some
of them?):

- "It broke ... hopefully I have a working version somewhere?"

- "Can you please send me the latest version?"

- "Where is the latest version?"

- "Which version are you using?"

- "Which version have the authors used in the paper I am trying to reproduce?"

- "Found a bug! Since when was it there?"

- "I am sure it used to work. When did it change?"

- "My laptop is gone. Is my thesis now gone?"


## Demonstration

- Example repository: <https://github.com/coderefinery/planets>
- Commits are like **snapshots** and if we break something we can go back to a
  previous snapshot.
- Commits carry **metadata** about changes: author, date, commit message, and
  a checksum.
- **Branches** are like parallel universes where you can experiment with
  changes without affecting the default branch:
  <https://github.com/coderefinery/planets/network>
  ("Insights" -> "Network")
- With version control we can **annotate code**
  ([example](https://github.com/coderefinery/planets/blame/main/animate.py)).
- **Collaboration**: We can fork (make a copy on GitHub), clone (make a copy
  to our computer), review, compare, share, and discuss.
- **Code review**: Others can suggest changes using pull requests or merge
  requests. These can be reviewed and discussed before they are merged.
  Conceptually, they are similar to "suggesting changes" in Google Docs.


## Where to explore more

- [Introduction to version control with Git](https://coderefinery.github.io/git-intro/)
- [CodeRefinery lesson on collaborative Git](https://coderefinery.github.io/git-collaborative/)
- [CodeRefinery mini-workshop](https://coderefinery.github.io/mini-workshop/)


## Exercises

:::::{exercise} Exercise VC-1: Turn your project to a Git repo and share it

1. Create a new directory called **myproject** with one or few files in it.
   This represents our own project. It is not yet a Git repository. You can try
   that with your own project or use a simple placeholder example.
2. Turn this new directory into a Git repository.
3. Share this repository on GitHub (or GitLab, since it really works the same).

We offer **three different paths** of how to do this exercise.
* Via **GitHub web interface**: easy and can be a good starting point if you are completely
  new to Git.
* **VS Code** is quite easy, since VS Code can offer to create the
  GitHub repositories for you.
* **Command line**: you need to create the
  repository on GitHub and link it yourself.

::::{tabs}

:::{group-tab} Only using GitHub
### Create an repository on GitHub

First log into GitHub, then follow the screenshots and descriptions below.
```{figure} img/sharing/new-repository.png
:alt: Screenshot on GitHub before a new repository form is opened
:width: 60%
:class: with-border

Click on the "plus" symbol on top right, then on "New repository".
```

Then:
```{figure} img/sharing/create-repository-with-readme.png
:alt: Screenshot on GitHub just before a new repository is created
:width: 100%
:class: with-border

Choose a repository name, add a short description, and in this case **make sure to check** "Add a
README file". Finally "Create repository".
```


### Upload your files

Now that the repository is created, you can upload your files:
```{figure} img/sharing/upload-files.png
:alt: Screenshot on GitHub just before uploading files
:width: 100%
:class: with-border

Click on the "+" symbol and then on "Upload files".
```
:::

:::{group-tab} VS Code
In VS Code it only takes few clicks.

First, open the folder in VS Code. My example project here contains two files.
Then click on the source control icon:
```{figure} img/sharing/vscode-start.png
:alt: Screenshot of VS Code before clicking on the source control icon
:width: 100%
:class: with-border

Open the folder in VS Code. Then click on the source control icon.
```

```{figure} img/sharing/vscode-publish-to-github1.png
:alt: Screenshot of VS Code before publishing to GitHub
:width: 100%
:class: with-border

Choose "Publish to GitHub". In this case I never even clicked on "Initialize Repository".
```

```{figure} img/sharing/vscode-publish-to-github2.png
:alt: Screenshot of VS Code before publishing to GitHub
:width: 100%
:class: with-border

In my case I chose to "Publish to GitHub public repository". Here you can also rename
the repository if needed.
```

```{figure} img/sharing/vscode-authorize.png
:alt: Screenshot of VS Code asking for authorization
:width: 50%
:class: with-border

First time you do this you might need to authorize VS Code to access your
GitHub account by redirecting you to https://github.com/login/oauth/authorize.
```

```{figure} img/sharing/vscode-publish-to-github3.png
:alt: Screenshot of VS Code after publishing to GitHub
:width: 100%
:class: with-border

After it is published, click on "Open on GitHub".
```
:::

:::{group-tab} Command line
### Make sure your Git is configured

We have an own section on this: <https://coderefinery.github.io/git-intro/configuration/>


### Put your project under version control

My example project here consists of two files. Replace this with your own
example files:
```console
$ ls -l

.rw------- 19k user  7 Mar 17:36 LICENSE
.rw-------  21 user  7 Mar 17:36 myscript.py
```

I will first initialize a Git repository in this directory.
If you get an error, try without the `-b main` (and your default branch will
then be called `master`, this will happen for Git versions older than
2.28):
```console
$ git init -b main
```

Now add and commit the two files to the Git repository:
```console
$ git add LICENSE myscript.py
$ git commit -m "putting my project under version control"
```

If you want to add all files in one go, you can use `git
add .` instead of `git add LICENSE myscript.py`.

Now you have a Git repository with one commit. Verify this with `git log`.
But it's still only on your computer. Let's put it on GitHub next.


### Create an <u>empty</u> repository on GitHub

First log into GitHub, then follow the screenshots and descriptions below.
```{figure} img/sharing/new-repository.png
:alt: Screenshot on GitHub before a new repository form is opened
:width: 60%
:class: with-border

Click on the "plus" symbol on top right, then on "New repository".
```

Then create an empty repository without any files and without any commits:
```{figure} img/sharing/create-repository.png
:alt: Screenshot on GitHub just before a new repository is created
:width: 100%
:class: with-border

Choose a repository name, add a short description, but please **do not check** "Add a
README file". For "Add .gitignore" and "Choose a license" also leave as "None". Finally "Create repository".
```

Once you click the green "Create repository", you will see a page similar to:
```{figure} img/sharing/bare-repository.png
:alt: Screenshot on GitHub after a bare repository was created
:width: 100%
:class: with-border
```

What this means is that we have now an empty project with either an HTTPS or an
SSH address: click on the HTTPS and SSH buttons to see what happens.


### Push an existing repository from your computer to GitHub

We now want to follow the "**... or push an existing repository from the command line**":

1. In your terminal make sure you are still in your myproject directory.
2. Copy paste the three lines below the red arrow to the terminal and execute
   those, in my case (**you need to replace the "USER" part and possibly also
   the repository name**):

`````{tabs}
  ````{group-tab} SSH
  ```console
  $ git remote add origin git@github.com:USER/myproject.git
  ```
  ````
  ````{group-tab} HTTPS
  ```console
  $ git remote add origin https://github.com/USER/myproject.git
  ```
  ````
`````

Then:
```console
$ git branch -M main
$ git push -u origin main
```

The meaning of the above lines:
- Add a remote reference with the name "origin"
- Rename current branch to "main"
- Push branch "main" to "origin"

You should now see:

```text
Enumerating objects: 4, done.
Counting objects: 100% (4/4), done.
Delta compression using up to 12 threads
Compressing objects: 100% (3/3), done.
Writing objects: 100% (4/4), 6.08 KiB | 6.08 MiB/s, done.
Total 4 (delta 0), reused 0 (delta 0), pack-reused 0
To github.com:USER/myproject.git
 * [new branch]      main -> main
branch 'main' set up to track 'origin/main'.
```

Reload your GitHub project website and your commits should now be
online!


### Troubleshooting

**error: remote origin already exists**
- Explanation: You probably ran a `git remote add origin ...` command, then changed your
  mind about HTTPS or SSH and then tried to run the other `git remote add
  origin ...` command but "origin" then already exists.
- Recovery:
  - First remove "origin" with `git remote remove origin`
  - Then run the correct `git remote add origin ...` command

**remote contains work that you do not have**
- Explanation: You probably clicked on "Add a README file" and now the
  repository on GitHub is not empty but contains one commit and locally you
  have a different history. Git now prevents you from accidentally overwriting
  the history on GitHub.
- Recovery:
  - Use `git push --force` instead of `git push`, which will force Git to overwrite the history on GitHub
  - Note that this is a powerful but also possibly dangerous option but here it
    helps us. If it's a brand new repo, it probably is fine to do this. For real
    repositories, don't do this unless you are very sure what is happening.
:::

:::{group-tab} RStudio

This is not fully explained, because a lot of it is similar to the "Command line" method (and an RStudio expert could help us some).  The main differeences are:

### Put your project under version conrol

1. Tools → Version control → Project setup → Version conrol system = Git.
1. Select "Yes" for "do you want to initialize a new git repository for this project.
1. Select yes to restart the project with RStudio.
1. Switch to branch `main` to have you branch named that.

### Create an <u>empty</u> repository on GitHub

Same as command line

### Push an existing repository from your computer to GitHub

1. Under the "Create new branch" button → "Add Remote"
1. Remote name: `origin`
1. Remote URL: as in command line (remember to select SSH or HTTPS as you have configured your RStudio)
1. The "Push" (up arrow) button will send changes on your current branch to the remote.  The "Pull" (down arrow) will get changes from the remote.

### Troubleshooting

Same as command line

:::
::::
:::::

:::{exercise} Exercise VC-2: Create a new branch and a new commit
- Fork the example repository: <https://github.com/coderefinery/planets>
- Create a new branch **in your fork** and give it a descriptive name.
- Make a modification **on the new branch** and create a new commit.
- The new branch and the new commit now only exist on the fork, not yet in the
  original repository.
- In case you would like to contribute your change back to the original
  repository, you would create a pull request (you are welcome to try).
:::
