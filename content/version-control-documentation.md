# Version control and documentation

These exercises are adapted from the [CodeRefinery](https://coderefinery.org/) lessons:
- [Introduction to version control with Git](https://coderefinery.github.io/git-intro/)
- [Collaborative distributed version control](https://coderefinery.github.io/git-collaborative/)
- [How to document your research software](https://coderefinery.github.io/documentation/)


## Exercise Git-and-documentation-1: Put your (example) project under version control

This is a good exercise if your project is not tracked by Git yet. If you don't
have your own coding project yet, you can first create few example files: for
instance few cooking recipes and we will use Git to track their versions.

1. You will need to have [Git installed and configured](https://coderefinery.github.io/installation/shell-and-git/).

2. Create a new directory and copy the project files into it.

3. Initialize a new Git repository:
```console
$ git init

Initialized empty Git repository in /home/user/example/.git
```

4. Now try `git status`. It will list all files as untracked (your files will
   be there instead of "another-file.txt" and "some-file.txt"):
```console
$ git status

On branch main

No commits yet

Untracked files:
  (use "git add <file>..." to include in what will be committed)
	another-file.txt
	some-file.txt

nothing added to commit but untracked files present (use "git add" to track)
```

5. Now `git add` the files to start tracking their changes (replace
   "another-file.txt" and "some-file.txt" with your actual files):
```console
$ git add another-file.txt
$ git add some-file.txt
```

6. Now try `git status` again:
```console
$ git status

On branch main

No commits yet

Changes to be committed:
  (use "git rm --cached <file>..." to unstage)
	new file:   another-file.txt
	new file:   some-file.txt
```

7. Now commit the changes (a commit records/"saves" the changes):
```console
$ git commit -m "adding files to get started"
```

8. Now you got a commit. Inspect it with:
```console
$ git log
```

9. Make some changes to these files or create new files, `git add` these
   changes, and commit them with:
```console
$ git commit -m "informative message"
```

10. Then inspect the history again with `git log`.

Now you have a Git repository! If you now modify any of the files that are
tracked, you can always go back.

---

## Exercise Git-and-documentation-2: Backup/publish your (example) project to GitHub/GitLab/YourServer

```{instructor-note}
Work in progress. Steps will be explained and screenshots added.
```

---

## Exercise Git-and-documentation-3: Practice code review with somebody else

```{instructor-note}
Work in progress. Steps will be explained and screenshots added.
```

- Students work in pairs of two
- They create an example repository on GitHub or share one of their recent repositories
- The other student sends a pull request with a small improvement

---

## Exercise Git-and-documentation-4: Improve the README of your project

In this exercise we will try to add a README to your project. If you have one
already, we will try to improve it by following the checklist from the
[presentation
slides](https://cicero.xyz/v3/remark/0.14.0/github.com/coderefinery/research-software-engineering/main/presentation.md/):

- **Purpose**
- **Installation instructions**
- **Dependencies and their versions or version ranges**
- **Copy-paste-able example to get started**
- Tutorials covering key functionality
- Reference documentation (e.g. API) covering all functionality
- How do you want to be asked questions (mailing list or forum or chat or issue tracker)
- Possibly a FAQ section
- Authors
- **Recommended citation**
- License
- Contribution guide

See also:
- [JOSS review checklist](https://joss.readthedocs.io/en/latest/review_checklist.html)

If you are unsure where to start, start with one of the items in bold.
