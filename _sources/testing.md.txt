# Testing

:::{objectives}
- Know **where to start** in your own project.
- Have an example for how to make the **testing part of code review**.
:::


## Motivation

Testing is a way to check that the code does what it is expected to.

- **Less scary to change code**: tests will tell you whether something broke.
- **Easier for new people** to join.
- Easier for somebody to **revive an old code**.
- **End-to-end test**: run the whole code and compare result to a reference.
- **Unit tests** can guide towards better structured code: complicated code is more difficult to test.


## Where to start

Short answer: **Start with an end-to-end test**.

:::{solution} Longer answer
- A simple script or notebook probably does not need an automated test.

**If you have nothing yet**:
- Start with an end-to-end test.
- Describe in words how *you* check whether the code still works.
- Translate the words into a script (any language).
- Run the script automatically on every code change.

**If you want to start with unit-testing**:
- You want to rewrite a function? Start adding a unit test right there first.
:::


## Demonstration

- This is our end-to-end test: <https://github.com/coderefinery/planets/blob/main/test.sh>
- Note how we can run it [on GitHub automatically](https://github.com/coderefinery/planets/blob/813d49a247f36e9c1e10cbe78ecf1ae4b6e971c3/.github/workflows/test.yml#L28).
- If we have time, we can try to create a pull request which would break the
  code and see how the test fails.

:::{discussion}
Is the [end-to-end test](https://github.com/coderefinery/planets/blob/main/test.sh)
perfect? No. But it's a good starting point. Discuss its limitations.
:::


## Where to explore more

- [Software testing lesson material](https://coderefinery.github.io/testing/)
- [Mini-workshop on testing](https://coderefinery.github.io/mini-workshop/2/testing/)


## Exercises

:::{exercise} Exercise Testing-1: Design an end-to-end test
Try this process on your own code or a code that you have
recently used:
1. Describe in words how *you* check whether the code still works.
1. Translate the words into a script (any language).
1. Run the script automatically on every code change.

Already step 1 is a good exercise in itself.  If you can arrive at step 2,
it's amazing, but it can take some time. Step 3 is typically relatively easy.
:::

::::{exercise} Exercise Testing-2: Add a unit test
You can do this exercise either on your computer (in this case **clone** the
[example project](https://github.com/coderefinery/planets)), or on GitHub (in
this case **fork** the [example
project](https://github.com/coderefinery/planets)).

First we need to add a test function, for instance
for [this function](https://github.com/coderefinery/planets/blob/813d49a247f36e9c1e10cbe78ecf1ae4b6e971c3/simulate.py#L31-L39):
```{code-block} python
---
emphasize-lines: 12-20
---
def force_between_planets(position1, mass1, position2, mass2):
    G = 1.0  # gravitational constant

    r = position2 - position1
    distance = (r[0] ** 2 + r[1] ** 2 + r[2] ** 2) ** 0.5
    force_magnitude = G * mass1 * mass2 / distance**2
    force = (r / distance) * force_magnitude

    return force


def test_force_between_planets():
    position1 = np.array([0.0, 0.0, 0.0])
    mass1 = 1.0
    position2 = np.array([1.0, 0.0, 0.0])
    mass2 = 2.0

    force = force_between_planets(position1, mass1, position2, mass2)

    assert np.allclose(force, [2.0, 0.0, 0.0])
```

We also need to extend our
[environment.yml](https://github.com/coderefinery/planets/blob/main/environment.yml):
```{code-block} yaml
---
emphasize-lines: 9
---
name: planets
channels:
  - conda-forge
dependencies:
  - python=3.12
  - numpy
  - click
  - matplotlib
  - pytest
```

If you try this on your computer, you can run
the test with:
```console
$ pytest simulate.py
```

If you want GitHub to run it, we need to extend
[.github/workflows/test.yml](https://github.com/coderefinery/planets/blob/main/.github/workflows/test.yml)
(highlighted line):
```{code-block} yaml
---
emphasize-lines: 29
---
name: Test

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout
      uses: actions/checkout@v4

    - uses: mamba-org/setup-micromamba@v1
      with:
        micromamba-version: '1.5.8-0' # any version from https://github.com/mamba-org/micromamba-releases
        environment-file: environment.yml
        init-shell: bash
        cache-environment: true
        post-cleanup: 'all'
        generate-run-shell: false

    - name: Run tests
      run: |
        ./test.sh
        pytest simulate.py
      shell: bash -el {0}
```
