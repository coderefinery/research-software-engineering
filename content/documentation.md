# Documentation

:::{objectives}
- Understand why documentation needs to be kept
  **in the same Git repository** as the code.
- Improve the README of your project or our example project.
:::

:::{keypoints}
- Often a README is enough.
- Documentation which is only in the source code is not enough.
:::


## Why? &#128151;&#9993;&#65039; to your future self

- You will probably use your code in the future and may forget details.
- You may want others to use your code or contribute
  (almost impossible without documentation).


## Often a README is enough - checklist

- **Purpose**
- Requirements
- Installation instructions
- **Copy-paste-able example to get started**
- Tutorials covering key functionality
- Reference documentation (e.g. API) covering all functionality
- Authors and **recommended citation**
- License
- Contribution guide

See also the
[JOSS review checklist](https://joss.readthedocs.io/en/latest/review_checklist.html).


## Demonstration

- If we have time, we will improve the README.md of our example repository:
  <https://github.com/coderefinery/planets>


## What if you need more than a README?

- Write documentation in
  [Markdown (.md)](https://en.wikipedia.org/wiki/Markdown)
  or
  [reStructuredText (.rst)](https://en.wikipedia.org/wiki/ReStructuredText)
  or
  [R Markdown (.Rmd)](https://rmarkdown.rstudio.com/)

- In the **same repository** as the code -> version control and **reproducibility**

- Use one of many tools to build HTML out of md/rst/Rmd:
  [Sphinx](https://sphinx-doc.org),
  [Zola](https://www.getzola.org/), [Jekyll](https://jekyllrb.com/),
  [Hugo](https://gohugo.io/), RStudio, [knitr](https://yihui.org/knitr/),
  [bookdown](https://bookdown.org/),
  [blogdown](https://bookdown.org/yihui/blogdown/), ...

- Deploy the generated HTML to [GitHub Pages](https://pages.github.com/) or
  [GitLab Pages](https://docs.gitlab.com/ee/user/project/pages/)


## Where to explore more

- [Documentation lesson material](https://coderefinery.github.io/documentation/)
- [Talk material "Documenting code" by S. Wittke](https://github.com/samumantha/documentation_example)
- Inside Sphinx we can add tables, images, equations, code snippets, ... ([more information](https://coderefinery.github.io/documentation/sphinx/#exercise-adding-more-sphinx-content).
- [CodeRefinery mini-workshop](https://coderefinery.github.io/mini-workshop/)


## Exercises

:::{exercise} Documentation-1: Improve the README of your project

In this exercise we will try to add a README to your project. If you have one
already, we will try to improve it by following the checklist (above).

If you are unsure where to start, start with one of the items in bold.
:::

:::{exercise} Documentation-2: In-code documentation

Have a look at the following 4 examples and discuss which ones you find useful
and which ones you find less useful and why.

Example A:
```python
# now we check if temperature is below -50
if temperature < -50:
    print("ERROR: temperature is too low")
```

Example B:
```python
# we regard temperatures below -50 degrees as measurement errors
if temperature < -50:
    print("ERROR: temperature is too low")
```

Example C:
```python
# do not run this code!
# if temperature > 0:
#     print("It is warm")
```

Example D:
```python
# John Doe: threshold changed from 0 to 15 on August 5, 2013
if temperature > 15:
    print("It is warm")
```
:::
