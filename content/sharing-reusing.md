# Sharing and reusing

These exercises are adapted from the [CodeRefinery](https://coderefinery.org/) lesson
["Social coding"](https://coderefinery.github.io/social-coding/).


## Exercise Sharing-1: What constitutes derivative work?

Which of these are derivative works?  Also reflect/discuss how this affects the
choice of license.
- A. Download some code from a website and add on to it
- B. Download some code and use one of the functions in your code
- C. Changing code you got from somewhere
- D. Extending code you got from somewhere
- E. Completely rewriting code you got from somewhere
- F. Rewriting code to a different programming language
- G. Linking to libraries (static or dynamic), plug-ins, and drivers
- H. Clean room design (somebody explains you the code but you have never seen it)
- I. You read a paper, understand algorithm, write own code

```{solution}
- Derivative work: A-F
- Not derivative work: G-I
- E and F: This depends on how you do it, see "clean room design".
```

---

## Exercise Sharing-2: Licensing situations

Consider some common licensing situations:
1. What is the StackOverflow license for code you copy and paste?
2. A journal requests that you release your software during publication. You have
   copied a portion of the code from another package, which you have forgotten.
   Can you satisfy the journal's request?
3. You want to fix a bug in a project someone else has released, but there is no license. What risks are there?
4. How would you ask someone to add a license?
5. You incorporate MIT, GPL, and BSD3 licensed code into your project. What possible licenses can you pick for your project?
6. You do the same as above but add in another license that looks strong copyleft. What possible licenses can you use now?
7. Do licenses apply if you don't distribute your code? Why or why not?
8. Which licenses are most/least attractive for companies with proprietary software?

```{solution}
1. As indicated [here](https://stackoverflow.com/help/licensing), all publicly accessible user contributions are licensed under [Creative Commons Attribution-ShareAlike](https://creativecommons.org/licenses/by-sa/4.0/) license. See Stackoverflow [Terms of service](https://stackoverflow.com/legal/terms-of-service/public#licensing) for more detailed information.
2. "Standard" licensing rules apply. So in this case, you would need to remove the portion of code you have copied from another package before being able to release your software.
3. By default you are no authorized to use the content of a repository when there is no license. And derivative work is also not possible by default. Other risks: it may not be clear whether you can use and distribute (publish) the bugfixed code. For the repo owners it may not be clear whether they can use and distributed the bugfixed code. However, the authors may have forgotten to add a license so we suggest you to contact the authors (e.g. make an issue) and ask whether they are willing to add a license.
4. As mentionned in 3., the easiest is to fill an issue and explain the reasons why you would like to use this software (or update it).
5. Combining software with different licenses can be tricky and it is important to understand compatibilities (or lack of compatibilities) of the various licenses. GPL license is the most protective (BSD and MIT are quite permissive) so for the resulting combined software you could use a GPL license. However, re-licensing may not be necessary.
6. Derivative work would need to be shared under this strong copyleft license (e.g. AGPL or GPL), unless the components are only plugins or libraries.
7. If you keep your code for yourself, you may think you do not need a license. However, remember that in most companies/universities, your employer is "owning" your work and when you leave you may not be allowed to "distribute your code to your future self". So the best is always to add a license!
8. The least attractive licenses for companies with proprietary software are licenses where you would need to keep an open license when creating derivative work. For instance GPL and and AGPL. The most attractive licenses are permissive licenses where they can reuse, modify and relicense with no conditions. For instance MIT, BSD and Apache License.
```

---

## Exercise Sharing-3: Create a CITATION.cff file for your project

Our goal here is to create a `CITATION.cff` file similar to this one and to add it
to our project:
```yaml
cff-version: 1.2.0
message: "If you use this software, please cite it as below."
authors:
  - family-names: Doe
    given-names: Jane
    orcid: https://orcid.org/1234-5678-9101-1121
title: "My Research Software"
version: 2.0.4
doi: 10.5281/zenodo.1234
date-released: 2021-08-11
```

For more information about `CITATION.cff` files please see <https://citation-file-format.github.io/>.

Steps:
- You can use this nice page that initializes a file for you based on a form: <https://citation-file-format.github.io/cff-initializer-javascript/>
- Or start from the example above and adapt it.
- If your project is on GitHub, push the new file to the repository (here link
  to instructions on how to do that). Then you can verify that you see a "Cite
  this repository" on GitHub.

Optional:
- Validate the `CITATION.cff` file using [cffconvert](https://github.com/citation-file-format/cffconvert).
- Add a GitHub Action to automatically validate it on each repository change using [cff-validator](https://github.com/marketplace/actions/cff-validator).

````{solution}
**Validating `CITATION.cff`**

First install `cffconvert` into a Python virtual environment or a Conda environment:
```console
$ pip install cffconvert
```
Then run it to validate the file:
```console
$ cffconvert --validate

Citation metadata are valid according to schema version 1.2.0.
```


**Automatically validating it using a GitHub Action**

Here is an example: <https://github.com/NordicHPC/sonar/blob/main/.github/workflows/validate-cff.yml>
````
