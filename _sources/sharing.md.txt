# Sharing (licensing and publishing)

:::{objectives}
- Add a **license** to your project.
- Understand why software licenses matter.
- Learn how to make a code project **persistent** and **citable**.
- Understand that publishing a code on GitHub is not enough
  to make it persistent and findable 10 years from now.
:::


## Why software licenses matter

- We often want or need to make changes to other people's code,
  or we want other people to be able to make changes to our code.
- Without a license the **derivative work** cannot be distributed or
  published.
- Maybe you want to be able to use and change your own code in your next job?


## Taxonomy of software licenses

If you don't have a license, your code is in the red area
in this picture and others cannot mix it with their code.
Arrows represent compatibility (A -> B: B can reuse A).

:::{figure} img/license-models.png
:alt: "European Union Public Licence (EUPL): guidelines July 2021"

European Commission, Directorate-General for Informatics, Schmitz, P.,
European Union Public Licence (EUPL): guidelines July 2021, Publications
Office, 2021, <https://data.europa.eu/doi/10.2799/77160>.
:::

**Choose a standard license**.
Don't design your own otherwise compatibility won't be clear.

**Great resources**:
- [Joinup Licensing Assistant](https://joinup.ec.europa.eu/collection/eupl/solution/joinup-licensing-assistant/jla-find-and-compare-software-licenses)
- [Joinup Licensing Assistant - Compatibility Checker](https://joinup.ec.europa.eu/collection/eupl/solution/joinup-licensing-assistant/jla-compatibility-checker)


## Demonstration

1. Choose a license and add a LICENSE file to your repository.

2. Add a `CITATION.cff` file to your repository:
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

   More about `CITATION.cff` files:
   - [GitHub now supports CITATION.cff files](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-citation-files)
   - [Web form to create, edit, and validate CITATION.cff files](https://citation-file-format.github.io/cff-initializer-javascript/)
   - [Video: "How to create a CITATION.cff using cffinit"](https://www.youtube.com/watch?v=zcgLIT5Qd4M)

3. We can make our code persistent and citable following
   [these steps](https://docs.github.com/en/repositories/archiving-a-github-repository/referencing-and-citing-content).


## Where to explore more

- Presentation slides "Practical software licensing" (R. Bast): <https://doi.org/10.5281/zenodo.11554001>
- [Social coding lesson material](https://coderefinery.github.io/social-coding/)
- [UiT research software licensing guide (draft)](https://research-software.uit.no/blog/2023-software-licensing-guide/)
- [Research institution policies to support research software (compiled by the Research Software Alliance)](https://www.researchsoft.org/software-policies/)
- More [reading material](https://coderefinery.github.io/social-coding/software-licensing/#great-resources)


## Exercises

:::{exercise} Exercise Sharing-1: Add a license file to your project

You can use the [Joinup Licensing Assistant](https://joinup.ec.europa.eu/collection/eupl/solution/joinup-licensing-assistant/jla-find-and-compare-software-licenses).
:::

:::{exercise} Exercise Sharing-2: CITATION.cff and Zenodo sandbox

In this exercise you can practice adding a `CITATION.cff` file to your own project.

We will then practice getting a DOI using the [Zenodo
sandbox](https://sandbox.zenodo.org).  We use here the Zenodo sandbox and not
the "real" Zenodo, since we are only practicing. On the "real" Zenodo a record
with a DOI cannot be deleted (this is the point of making it persistent).

How to get a DOI using the [Zenodo sandbox](https://sandbox.zenodo.org):
- Log into the [Zenodo sandbox](https://sandbox.zenodo.org) using
  GitHub.
- Follow [these steps](https://docs.github.com/en/repositories/archiving-a-github-repository/referencing-and-citing-content)
  to create a GitHub release and get a DOI.
:::

:::{exercise} Exercise Sharing-3: What constitutes derivative work?

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
:::

:::{exercise} Exercise Sharing-4: Licensing situations

Consider some common licensing situations. If you are part of an exercise
group, discuss these with others:
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
:::
