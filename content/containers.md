# Reproducibility and containers

These exercises are adapted from the [CodeRefinery](https://coderefinery.org/) lessons
[Reproducible research and FAIR data](https://coderefinery.github.io/reproducible-research/).

If you want to try to build a container but you need to install
[SingularityCE](https://sylabs.io/singularity/)/[Apptainer](https://apptainer.org/)
on your laptop and this is only easy to do on a Linux laptop and less easy on
other operating systems:
- Reproducibility-3

If you have access to a cluster:
- Reproducibility-3
- Reproducibility-4
- Reproducibility-5

If you want exercises where you don't need to type or install anything but "only" think and discuss:
- Reproducibility-1
- Reproducibility-2

If you have your own code project and want to try to containerize it:
- Reproducibility-6

---

## Exercise Reproducibility-1: Time-capsule of dependencies

Imagine the following situation: five students (A, B, C, D, E) wrote a code
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

---

## Exercise Reproducibility-2: Time-travel with containers

Imagine the following situation: A researcher has written and published their research code which
requires a number of libraries and system dependencies. They ran their code
on a Linux computer (Ubuntu). One very nice thing they did was to publish
also a container image with all dependencies included, as well as the
definition file (below) to create the container image.

Now we travel 3 years into the future and want to reuse their work and adapt
it for our data. The container registry where they uploaded the container
image however no longer exists. But luckily we still have the definition file
(below)! From this we should be able to create a new container image.

- Can you anticipate problems using the definitions file 3 years after its creation?
  Which possible problems can you point out?
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

---

## Exercise Reproducibility-3: Build a container and run it on a cluster

If you want to try to build a container but you need to install
[SingularityCE](https://sylabs.io/singularity/)/[Apptainer](https://apptainer.org/)
on your laptop and this is only easy to do on a Linux laptop and less easy on
other operating systems.

We will start with a relatively simple example definition file (`hello.def`).
All it does is to install cmake on top of a Ubuntu 22.04 Docker image:
```{literalinclude} containers/hello.def
:language: docker
```

You can try to build it on your laptop:
```console
$ sudo singularity build hello.sif hello.def
```

Then copy the generated `hello.sif` to the cluster and run it with the following script:
```{literalinclude} containers/run-hello.sh
:language: bash
```

This is the relevant output (observe the highlighted lines and discuss what this means):
```{literalinclude} containers/hello.out
:emphasize-lines: 8, 20, 25, 32, 46, 51
```

**Here is another example** of [a project](https://github.com/mfumagalli/ngsTools)
that I had to containerize recently because it did not build on latest
compilers (`ngstools.def`):
```{literalinclude} containers/ngstools.def
:language: docker
```

You can try to build it similarly to the example above and then run it with the following script:
```{literalinclude} containers/run-ngstools.sh
:language: bash
```

It should produce an output which contains:
```
==> Input Arguments:
    geno: (null)
    probs: false
    log_scale: false
    n_ind: 0
    n_sites: 0
    tot_sites: 0
    labels: (null) (WITHOUT header)
    positions: (null) (WITHOUT header)
    call_geno: false
    N_thresh: 0.000000
    call_thresh: 0.000000
    pairwise_del: false
    avg_nuc_dist: false
    evol_model: None
    geno_indep: false
    n_boot_rep: 0
    boot_block_size: 1
    out: (null)
    n_threads: 1
    verbose: 1
    seed: 1691765155
    version: 1.0.9 (Aug 11 2023 @ 14:39:11)


=====
ERROR: [parse_cmd_args] genotype input file (--geno) missing!
=====

    : Success
```

We are happy to see "Success". The "ERROR" does not bother us here. This is because
we did not provide any input files.

---

## Exercise Reproducibility-4: Download a container image and run it on a cluster

In this exercise we will try something fun: create an isolated, reproducible,
and documented Conda environment without even installing Conda using the
container image from <https://github.com/bast/singularity-conda>.

We will use the following defining the Conda environment that we wish to have
(`environment.yml`):
```{literalinclude} containers/environment.yml
:language: yaml
```

Together with the following Python script (`example.py`):
```{literalinclude} containers/example.py
:language: python
```

This job script (`run-conda.sh`) will download the container image and use it
to set up a local Conda environment:
```{literalinclude} containers/run-conda.sh
:language: bash
```

```console
$ sbatch run-conda.sh
```

And now track the generated `conda.out` where we are interested to see what the
Python version is and what the versions of the install Pandas and SciPy
libraries are.  The run can take few minutes since it needs to install
dependencies into a generated directory called `environment/`:
```
... lots of output ...
Transaction finished
Python 3.9.17
pandas version: 1.5.3
scipy version: 1.11.1
```

But if you run the script again, it will complete in seconds:
```
Python 3.9.17
pandas version: 1.5.3
scipy version: 1.11.1
```

---

## Exercise Reproducibility-5: Building a container on GitHub and running it on a cluster

You can build a container on GitHub (using GitHub Actions) or GitLab (using
GitLab CI) and host the image it on GitHub/GitLab.  This has the following
advantages:
- You don't need to host it yourself
- But the image stays close to its sources and is not on a different service
- Anybody can inspect the recipe and how it was built
- Every time you make a change to the recipe, it builds a new image

If you want to try this out, you can take this repository as starting point and
inspiration: <https://github.com/bast/singularity-latex>

---

## Exercise Reproducibility-6: Containerizing your own code

This may not be easy and you will probably need help from a TA or the
instructor but is a great exercise and we can try to do this together.

A good test is to build the container on one computer and try to run it on
another one.  A big benefit of this exercise is that it will clarify to you
which dependencies your code really has because you have to document them -
there are no shortcuts.

A good starting point is the [Apptainer User
Guide](https://apptainer.org/docs/user/latest/), particularly the documentation
about [definition
files](https://apptainer.org/docs/user/latest/definition_files.html).
