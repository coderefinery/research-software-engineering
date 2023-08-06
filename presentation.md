class: center, middle, gray-background

# Research software engineering for HPC

## Radovan Bast ([fosstodon.org/@radovan](https://fosstodon.org/@radovan))

### UiT The Arctic University of Norway

<img src="img/coderefinery.png" style="height: 140px;"/>
&nbsp;
<img src="img/rse-logo.png" style="height: 180px;"/>

Text: CC-BY 4.0

---

# About me

.left-column30[
<img src="img/avatar.jpg" style="width: 80%;"/>
]

.right-column70[
- Theoretical chemist turned research software engineer.

- I write research software and teach programming to researchers and lead the
  [CodeRefinery project](https://coderefinery.org).

- I lead the [high-performance computing group](https://hpc.uit.no) and the
  [research software engineering group](https://research-software.uit.no) at UiT.
]

---

# What is "research software"?

.left-column50[
- Script to convert data from one format to another

- Script to read data and visualize it

- Program that generates data

- Analysis script
]

.right-column50[
- Set of scripts that form an analysis pipeline

- Code that is compiled

- Code that is dynamically interpreted and not compiled

- Web app

- ...
]

---

class: center, middle, inverse

# You don't need to be a

# "proper software engineer"

# to produce research software

We consider **any code, script, notebook, or file, regardless of size**, as
"research software" if it is needed to generate, visualize, or reproduce
data/results as part of a publication.

---

# CodeRefinery

(slide about CodeRefinery)

---

# 6 most important RSE topics?

.left-column50[
- Version control

- Building code (CMake, HPC-specific part)

- Reproducibility and containers

- Automated testing

- Documentation

- Sharing and reusing
]

.right-column50[
(figure: job of an RSE - archaeology and time travel?)
]

---

# Exercises

(link to separate page)

---

class: middle, inverse

# Documentation

# &#128151;&#9993;&#65039; to your future self

Inspiration and where to find more:
- [Documentation lesson material](https://coderefinery.github.io/documentation/) by [CodeRefinery](https://coderefinery.org/)
- [Talk material "Documenting code" by S. Wittke](https://github.com/samumantha/documentation_example)

---

# Why? &#128151;&#9993;&#65039; to your future self

- You will probably use your code in the future and may forget details.

- You may want others to use your code (almost impossible without documentation).

- You may want others to contribute to the code.

- Time is limited - let the documentation answer FAQs.

---

# Checklist

- .emph[Purpose]
- Installation instructions
- Dependencies and their versions or version ranges
- .emph[Copy-paste-able example to get started]
- Tutorials covering key functionality
- Reference documentation (e.g. API) covering all functionality
- How do you want to be asked questions (mailing list or forum or chat or issue tracker)
- Possibly a FAQ section
- Authors
- .emph[Recommended citation]
- License
- Contribution guide

See also:
- [JOSS review checklist](https://joss.readthedocs.io/en/latest/review_checklist.html)

---

Not very useful (more commentary than comment):
```python
# now we check if temperature is larger than -50
if temperature > -50:
    print("ERROR: temperature is too low")
```

More useful (explaining .emph[why]):
```python
# we regard temperatures below -50 degrees as measurement errors
if temperature > -50:
    print("ERROR: temperature is too low")
```

Keeping zombie code "just in case" (rather use version control):
```python
# do not run this code!
# if temperature > 0:
#     print("It is warm")
```

Emulating version control:
```python
# somebody: threshold changed from 0 to 15 on August 5, 2013
if temperature > 15:
    print("It is warm")
```

---

# In-code documentation

.left-column30[
- Useful for those who want/need to understand and modify the code

- Useful if it describes .emph[why] the piece of code is there
]

.right-column60[
Docstrings can be useful both for .emph[developers and users of a function]:
```python
def kelvin_to_celsius(temp_k: float) -> float:
    """
    Converts temperature in Kelvin to Celsius.

    Parameters
    ----------
    temp_k : float
        temperature in Kelvin

    Returns
    -------
    temp_c : float
        temperature in Celsius
    """
    assert temp_k >= 0.0, "ERROR: negative T_K"
    temp_c = temp_k - 273.15
    return temp_c


print(kelvin_to_celsius.__doc__)
```
]

---

## Often a README is enough (first impression!)

.left-column50[
```markdown
# Project title

## Purpose

Motivation (why the project exists)
and basics.

## Installation

How to setup. Dependencies and their
versions.

## Getting started

Copy-pastable quick start example.
Tutorials covering key functionality.

## Usage reference

...

## Recommended citation

...

## License

...
```
]

.right-column50[
<img src="img/readme.png"
     alt="Screenshot of a GitHub repo that renders README.md"
     style="width: 100%" />
]

---

# When projects grow out of a README

- Write documentation in
  [Markdown (.md)](https://en.wikipedia.org/wiki/Markdown)
  or
  [reStructuredText (.rst)](https://en.wikipedia.org/wiki/ReStructuredText)
  or
  [R Markdown (.Rmd)](https://rmarkdown.rstudio.com/)

- In the .emph[same repository] as the code -> version control and **reproducibility**

- Use one of many tools to build HTML out of md/rst/Rmd:
  [Sphinx](sphinx-doc.org),
  [Zola](https://www.getzola.org/), [Jekyll](https://jekyllrb.com/),
  [Hugo](https://gohugo.io/), RStudio, [knitr](https://yihui.org/knitr/),
  [bookdown](https://bookdown.org/),
  [blogdown](https://bookdown.org/yihui/blogdown/), ...

- Deploy the generated HTML to [GitHub Pages](https://pages.github.com/) or
  [GitLab Pages](https://docs.gitlab.com/ee/user/project/pages/)


## Examples

- [All CodeRefinery lessons](https://coderefinery.org/lessons/from-coderefinery/)
- <https://github.com/networkx/networkx>

---

class: middle, inverse

# Sharing and reusing

# &#127803;

Inspiration and where to find more:
- [UiT research software licensing guide (draft)](https://research-software.uit.no/blog/2023-software-licensing-guide/)
- [Social coding lesson material](https://coderefinery.github.io/social-coding/) by [CodeRefinery](https://coderefinery.org/)

---

# Why software licenses matter

- .emph[You find some great code or data] that you want to reuse for your own
  publication (good for the original author: you will cite them and maybe other
  people who cite you will cite them).

- You need to .emph[modify the code] a little bit, or you remix the data a bit.

- When it comes time to publish, you realize there is .emph[no license].


### Now we have a problem:

- You manage to **publish the paper without the software/data** but others cannot
  build on your software and data and
  you don't get as many citations as you could.
- Or, you **cannot publish it at all** if the journal requires that papers should
  come with data and software so that they are reproducible.

---

.left-column50[
### Beginning of a project

<img src="img/ai/field.png"
     alt="Generated image of an empty field"
     style="height: 250px;" />

.cite[Midjourney, CC-BY-NC 4.0]

- License does not seem important
- Easy to change (*)
- Work as if the code is public even though it still may be private
- "Open core" approach: Core can
  be open and on a public branch, unpublished code can be on a private
  repository
]

.right-column50[
### Later in the project

<img src="img/hundertwasserhaus.jpg"
     alt="Photo of Hunderwasserhaus in Vienna"
     style="height: 250px;" />

.cite[C.Stadler/Bwag, CC-BY-SA 4.0]

- Can be important
- Especially when combining codes or organizations
- Difficult to change
- Difficult to remove code that should not be published
- Authors change affiliation
]

---

## Is your work .emph[derivative work] or not?

.left-column50[
<img src="img/license-models.png"
     alt="European Union Public Licence (EUPL): guidelines July 2021"
     style="height: 400px;" />

.cite[European Union Public Licence (EUPL): guidelines July 2021, <https://data.europa.eu/doi/10.2799/77160>]
]

.right-column50[
- .emph[Derivative work]: You have started from an existing code and made changes to
  it or if you incorporated an existing code into your code

- You have started from scratch: .emph[not derivative work]
]

---

# How do I add a license to my work?

- Create a `LICENSE` file or `LICENSES/` folder in your project which will hold
  [license texts](https://reuse.software/faq/#license-templates).
- On top of each file add and adapt
  the following header ([more examples](https://reuse.software/faq/)):
  ```python
  # SPDX-FileCopyrightText: 2023 Jane Doe <jane@example.com>
  #
  # SPDX-License-Identifier: MIT
  ```
- Add a [CITATION.cff file](https://citation-file-format.github.io/) (example later)

Practical steps for making **changes to an existing project** (with a license
that allows you to do so):
- .emph[Fork] (copy) the project.
- .emph[Summarize your changes] in file headers and bigger-picture changes in the README.
- Some licenses are more .emph[permissive] (you can keep your changes private) but some licenses
  require you to publish the changes (.emph[share-alike]).

---

# Make it persistent and citable

- Add a [CITATION.cff](https://citation-file-format.github.io/) file:
```yml
cff-version: 1.2.0
message: "If you use this software, please cite it as below."
authors:
  - family-names: Druskat
    given-names: Stephan
    orcid: https://orcid.org/1234-5678-9101-1121
title: "My Research Software"
version: 2.0.4
doi: 10.5281/zenodo.1234
date-released: 2021-08-11
```

- Get a [digital object identifier
  (DOI)](https://en.wikipedia.org/wiki/Digital_object_identifier) for your code
  [Zenodo](https://zenodo.org/) or similar.

- [Software Heritage](https://www.softwareheritage.org/) and
  [CodeMeta](https://codemeta.github.io/) exist as an alternative ecosystem
  that is currently receiving some attention on a European level. Comparison
  and links to converters can be found in
  <https://zenodo.org/record/8086413>.

---

# Many tools understand CITATION.cff

<img src="img/cite-this-repo.png"
     alt="Screenshot of a GitHub repository when clicked on 'Cite this repository'"
     style="width: 100%;" />

---

# Sharing and reusing - Great resources

- [UiT research software licensing guide (draft)](https://research-software.uit.no/blog/2023-software-licensing-guide/)

- Guide from the Aalto University in Finland: ["Opening your Software at Aalto University"](https://www.aalto.fi/en/open-science-and-research/opening-your-software-at-aalto-university)

- [Joinup Licensing Assistant - Find and compare software licenses](https://joinup.ec.europa.eu/collection/eupl/solution/joinup-licensing-assistant/jla-find-and-compare-software-licenses)

- [Joinup Licensing Assistant - Compatibility Checker](https://joinup.ec.europa.eu/collection/eupl/solution/joinup-licensing-assistant/jla-compatibility-checker)

- [Social coding lesson material](https://coderefinery.github.io/social-coding/) by [CodeRefinery](https://coderefinery.org/)

- [Citation File Format (CFF)](https://citation-file-format.github.io/)

- [License Selector](https://ufal.github.io/public-license-selector/)
