# Reproducible dependencies and environments

:::{objectives}
There are not many codes that have no dependencies.
How should we **deal with dependencies**?
:::


## How to avoid: "It works on my machine &#129335;"

Use a **standard way** to list dependencies in your project:
- Python: `requirements.txt` or `environment.yml`
- R: `DESCRIPTION` or `renv.lock`
- Rust: `Cargo.lock`
- Julia: `Project.toml`
- C/C++/Fortran: `CMakeLists.txt` or `Makefile` or `spack.yaml` or the module
  system on clusters or containers
- Other languages: ...

Install dependencies into **isolated environments**:
- For each project, create a new environment.
- Don't install dependencies globally for all projects.
- Install them **from a file** which documents them at the same time.

:::{keypoints}
If somebody asks you what dependencies you have in your project, you should be
able to answer this question **with a file**.
:::


## Demonstration

1. The dependencies in our [example
   project](https://github.com/coderefinery/planets) are listed in a
   [environment.yml](https://github.com/coderefinery/planets/blob/main/environment.yml)
   file.

   :::{discussion}
   - Shouldn't the dependencies in the
     [environment.yml](https://github.com/coderefinery/planets/blob/main/environment.yml)
     file be pinned to specific versions?
   - When is a good time to pin them?
   :::

2. We also have a [container definition
   file](https://github.com/coderefinery/planets/blob/main/container.def):
   - This can be used with [Apptainer](https://apptainer.org/)/
     [SingularityCE](https://sylabs.io/singularity/).
   - A container is like an **operating system inside a file**.
   - If we have the time, we can try Exercise Reproducibility-3 below.
   - This is a simple example. It is possible but trickier to
     do MPI and/or GPU computing using containers.


## Where to explore more

- [Reproducible research](https://coderefinery.github.io/reproducible-research/)
- [The Turing Way: Guide for Reproducible Research](https://the-turing-way.netlify.app/reproducible-research/reproducible-research.html)
- [Ten simple rules for writing Dockerfiles for reproducible data science](https://doi.org/10.1371/journal.pcbi.1008316)
- [Computing environment reproducibility](https://doi.org/10.5281/zenodo.8089471)


## Exercises

:::{exercise} Exercise Reproducibility-1: Time-capsule of dependencies

Imagine the following situation: Five students (A, B, C, D, E) wrote a code
that depends on a couple of libraries.  They uploaded their projects to GitHub.
We now travel **3 years into the future** and find their GitHub repositories and
try to re-run their code before adapting it.

- Which version do you expect to be easiest to re-run? Why?
- What problems do you anticipate in each solution?

`````{tabs}
   ````{group-tab} Conda
     **A**:
     You find a couple of library imports across the code but that's it.

     **B**:
     The README file lists which libraries were used but does not mention
     any versions.

     **C**:
     You find a `environment.yml` file with:
     ```
     name: student-project
     channels:
       - conda-forge
     dependencies:
       - scipy
       - numpy
       - sympy
       - click
       - python
       - pip
       - pip:
         - git+https://github.com/someuser/someproject.git@master
         - git+https://github.com/anotheruser/anotherproject.git@master
     ```

     **D**:
     You find a `environment.yml` file with:
     ```
     name: student-project
     channels:
       - conda-forge
     dependencies:
       - scipy=1.3.1
       - numpy=1.16.4
       - sympy=1.4
       - click=7.0
       - python=3.8
       - pip
       - pip:
         - git+https://github.com/someuser/someproject.git@d7b2c7e
         - git+https://github.com/anotheruser/anotherproject.git@sometag
     ```

     **E**:
     You find a `environment.yml` file with:
     ```
     name: student-project
     channels:
       - conda-forge
     dependencies:
       - scipy=1.3.1
       - numpy=1.16.4
       - sympy=1.4
       - click=7.0
       - python=3.8
       - someproject=1.2.3
       - anotherproject=2.3.4
     ```
   ````

   ````{group-tab} Python virtualenv
     **A**:
     You find a couple of library imports across the code but that's it.

     **B**:
     The README file lists which libraries were used but does not mention
     any versions.

     **C**:
     You find a `requirements.txt` file with:
     ```
     scipy
     numpy
     sympy
     click
     python
     git+https://github.com/someuser/someproject.git@master
     git+https://github.com/anotheruser/anotherproject.git@master
     ```

     **D**:
     You find a `requirements.txt` file with:
     ```
     scipy==1.3.1
     numpy==1.16.4
     sympy==1.4
     click==7.0
     python==3.8
     git+https://github.com/someuser/someproject.git@d7b2c7e
     git+https://github.com/anotheruser/anotherproject.git@sometag
     ```

     **E**:
     You find a `requirements.txt` file with:
     ```
     scipy==1.3.1
     numpy==1.16.4
     sympy==1.4
     click==7.0
     python==3.8
     someproject==1.2.3
     anotherproject==2.3.4
     ```
   ````

   ````{group-tab} R
     **A**:
     You find a couple of `library()` or `require()` calls across the code but that's it.

     **B**:
     The README file lists which libraries were used but does not mention
     any versions.

     **C**:
     You find a [DESCRIPTION file](https://r-pkgs.org/description.html) which contains:
     ```
     Imports:
         dplyr,
         tidyr
     ```
     In addition you find these:
     ```r
     remotes::install_github("someuser/someproject@master")
     remotes::install_github("anotheruser/anotherproject@master")
     ```

     **D**:
     You find a [DESCRIPTION file](https://r-pkgs.org/description.html) which contains:
     ```
     Imports:
         dplyr (== 1.0.0),
         tidyr (== 1.1.0)
     ```
     In addition you find these:
     ```r
     remotes::install_github("someuser/someproject@d7b2c7e")
     remotes::install_github("anotheruser/anotherproject@sometag")
     ```

     **E**:
     You find a [DESCRIPTION file](https://r-pkgs.org/description.html) which contains:
     ```
     Imports:
         dplyr (== 1.0.0),
         tidyr (== 1.1.0),
         someproject (== 1.2.3),
         anotherproject (== 2.3.4)
     ```
   ````
`````

```{solution}
**A**: It will be tedious to collect the dependencies one by one. And after
the tedious process you will still not know which versions they have used.

**B**: If there is no standard file to look for and look at and it might
become very difficult for to create the software environment required to
run the software. But at least we know the list of libraries. But we don't
know the versions.

**C**: Having a standard file listing dependencies is definitely better
than nothing. However, if the versions are not specified, you or someone
else might run into problems with dependencies, deprecated features,
changes in package APIs, etc.

**D** and **E**: In both these cases exact versions of all dependencies are
specified and one can recreate the software environment required for the
project. One problem with the dependencies that come from GitHub is that
they might have disappeared (what if their authors deleted these
repositories?).

**E** is slightly preferable because version numbers are easier to understand than Git
commit hashes or Git tags.
```
:::


:::{exercise} Exercise Reproducibility-2: Time-travel with containers

Imagine the following situation: A researcher has written and published their research code which
requires a number of libraries and system dependencies. They ran their code
on a Linux computer (Ubuntu). One very nice thing they did was to publish
also a container image with all dependencies included, as well as the
definition file (below) to create the container image.

Now we travel 3 years into the future and want to reuse their work and adapt
it for our data. The container registry where they uploaded the container
image however no longer exists. But luckily (!) we still have the definition
file (below). From this we should be able to create a new container image.

- Can you anticipate problems using the definition file here 3 years after its
  creation? Which possible problems can you point out?
- Discuss possible take-aways for creating more reusable containers.

``````{tabs}
  `````{tab} Python project using virtual environment
    ```{literalinclude} containers/bad-example-python.def
    :language: docker
    :linenos:
    ```

    ````{solution}
    - Line 2: "ubuntu:latest" will mean something different 3 years in future.
    - Lines 11-12: The compiler gcc and the library libgomp1 will have evolved.
    - Line 30: The container uses requirements.txt to build the virtual environment but we don't see
      here what libraries the code depends on.
    - Line 33: Data is copied in from the hard disk of the person who created it. Hopefully we can find the data somewhere.
    - Line 35: The library fancylib has been built outside the container and copied in but we don't see here how it was done.
    - Python version will be different then and hopefully the code still runs then.
    - Singularity/Apptainer will have also evolved by then. Hopefully this definition file then still works.
    - No help text.
    - No contact address to ask more questions about this file.
    - (Can you find more? Please contribute more points.)

    ```{literalinclude} containers/bad-example-python.def
    :language: docker
    :linenos:
    :emphasize-lines: 2, 11-12, 30, 33, 35
    ```
    ````
  `````

  `````{tab} C++ project
    This definition files has potential problems 3 years later. Further down on
    this page we show a better and real version.

    ```{literalinclude} containers/bad-example-cxx.def
    :language: docker
    :linenos:
    ```

    ````{solution}
    - Line 2: "ubuntu:latest" will mean something different 3 years in future.
    - Lines 9: The libraries will have evolved.
    - Line 11: We clone a Git repository recursively and that repository might evolve until we build the container image the next time.
      here what libraries the code depends on.
    - Line 18: The library fancylib has been built outside the container and copied in but we don't see here how it was done.
    - Singularity/Apptainer will have also evolved by then. Hopefully this definition file then still works.
    - No help text.
    - No contact address to ask more questions about this file.
    - (Can you find more? Please contribute more points.)

    ```{literalinclude} containers/bad-example-cxx.def
    :language: docker
    :linenos:
    :emphasize-lines: 2, 9, 11, 18
    ```
    ````
  `````
``````
:::


::::::{exercise} Exercise Reproducibility-3: Build a container and run it on a cluster

Here we will try to build a container from
[the definition file](https://github.com/coderefinery/planets/blob/main/container.def)
of our example project.

Requirements:
1. Linux (it is possible to build them on a macOS or Windows computer but it is
   more complicated).
2. An installation of [Apptainer](https://apptainer.org/) (e.g. following the
   [quick installation](https://apptainer.org/docs/user/latest/quick_start.html#quick-installation)).
   Alternatively, [SingularityCE](https://sylabs.io/singularity/) should also
   work.

Now you can build the container image from the container definition file.
Depending on the configuration you might need to run the command with `sudo`
or with `--fakeroot`.

Hopefully one of these four will work:
```console
$ sudo apptainer build container.sif container.def
$ apptainer build --fakeroot container.sif container.def

$ sudo singularity build container.sif container.def
$ singularity build --fakeroot container.sif container.def
```

Once you have the `container.sif`, copy it to a cluster and try to run it
there.

Here are two job script examples:

:::::{tabs}
   ::::{group-tab} Dardel (Sweden)
     ```bash
     #!/usr/bin/env bash

     # the SBATCH directives and the module load below are only relevant for the
     # Dardel cluster and the PDC Summer School; adapt them for your cluster

     #SBATCH --account=edu24.summer
     #SBATCH --job-name='container'
     #SBATCH --time=0-00:05:00

     #SBATCH --partition=shared

     #SBATCH --nodes=1
     #SBATCH --tasks-per-node=1
     #SBATCH --cpus-per-task=16


     module load PDC singularity


     # catch common shell script errors
     set -euf -o pipefail


     echo
     echo "what is the operating system on the host?"
     cat /etc/os-release


     echo
     echo "what is the operating system in the container?"
     singularity exec container.sif cat /etc/os-release


     # 1000 planets, 20 steps
     time ./container.sif 1000 20 ${SLURM_CPUS_PER_TASK} results
     ```
   ::::

   ::::{group-tab} Saga (Norway)
     ```bash
     #!/usr/bin/env bash

     #SBATCH --account=nn9997k
     #SBATCH --job-name='container'
     #SBATCH --time=0-00:05:00

     #SBATCH --mem-per-cpu=1G

     #SBATCH --nodes=1
     #SBATCH --tasks-per-node=1
     #SBATCH --cpus-per-task=16


     # catch common shell script errors
     set -euf -o pipefail


     echo
     echo "what is the operating system on the host?"
     cat /etc/os-release


     echo
     echo "what is the operating system in the container?"
     singularity exec container.sif cat /etc/os-release


     # 1000 planets, 20 steps
     time ./container.sif 1000 20 ${SLURM_CPUS_PER_TASK} results
     ```
   ::::
::::::


:::{exercise} Exercise Reproducibility-4: Building a container on GitHub and running it on a cluster

You can build a container on GitHub (using GitHub Actions) or GitLab (using
GitLab CI) and host the image it on GitHub/GitLab.  This has the following
advantages:
- You don't need to host it yourself.
- But the image stays close to its sources and is not on a different service.
- Anybody can inspect the recipe and how it was built.
- Every time you make a change to the recipe, it builds a new image.

If you want to try this out:
- Take [this repository](https://github.com/bast/apptainer-conda)
  as starting point and inspiration.
- Don't focus too much on what this container does, but rather [how it is built](https://github.com/bast/apptainer-conda/tree/main/.github/workflows).
- To build a new version, one needs to send a pull request which updates `VERSION`
  and modifies the definition file (in this case `conda.def`).
:::


:::{exercise} Exercise Reproducibility-5: Building a container on a cluster

This may not be easy and you will probably need help from a TA or the
instructor but is a great exercise and we can try to do this together.

A good starting point is the [Apptainer User
Guide](https://apptainer.org/docs/user/latest/), particularly the documentation
about [definition
files](https://apptainer.org/docs/user/latest/definition_files.html).

A good test is to build the container on one computer and try to run it on
another one.  A big benefit of this exercise is that it will clarify to you
which dependencies your code really has because you have to document them -
there are no shortcuts.
:::
