# Building code with CMake

These exercises are adapted from the [CodeRefinery](https://coderefinery.org/) lesson
["CMake introduction and hands-on workshop"](https://coderefinery.github.io/cmake-workshop/).

````{note}
Running the examples below on
[Dardel](https://www.pdc.kth.se/hpc-services/computing-systems/dardel-1.1043529)?
In this case you may need to load the `CMake` module:
```console
$ module load PDC CMake
```
````


## Exercise CMake-1: Compiling "Hello, world" with CMake

In this exercise we will compile a single source file to an executable. Choose
your favorite language.

1. Create a new folder and in the folder create a source file:

````{tabs}
   ```{group-tab} C++
      hello.cpp:

      ```{literalinclude} cmake/hello-executable/cxx/hello.cpp
      :language: c++
      ```
   ```

   ```{group-tab} C
      Use and adapt the C++ example.
      In terms of CMake, both are very similar.
   ```

   ```{group-tab} Fortran
      hello.f90:

      ```{literalinclude} cmake/hello-executable/fortran/hello.f90
      :language: fortran
      ```
   ```
````

2. The folder contains only the source code. We need to add a file called
   `CMakeLists.txt` to it.  CMake reads the contents of these special files
   when generating the build system:

````{tabs}
   ```{group-tab} C++

      ```{literalinclude} cmake/hello-executable/cxx/CMakeLists.txt
      :language: cmake
      ```
   ```

   ```{group-tab} Fortran

      ```{literalinclude} cmake/hello-executable/fortran/CMakeLists.txt
      :language: cmake
      ```
   ```
````

3. We are ready to call CMake and get our build system:
```console
$ cmake -S. -Bbuild
```

4. And finally build our executable:
```console
$ cmake --build build
```

5. Try to also run the executable.

````{note}
Instead of creating a build directory, configuring, and building implicitly:
```console
$ cmake -S. -Bbuild
$ cmake --build build
```

... some people prefer to do this more explicitly (the build directory does not
have to be called "build"):
```console
$ mkdir build
$ cd build
$ cmake ..
$ make
```

Both approaches will work for us.
````

---

## Exercise CMake-2: Building and linking a library

Only rarely we have one-source-file projects and more realistically, as
projects grow, we split them up into separate files. This simplifies
(re)compilation but also helps humans maintaining and understanding the
project.

We stay with the toy project but also here things got more real and more
modular and we decided to split the project up into several files:

````{tabs}
   ```{group-tab} C++

      hello.cpp:

      ```{literalinclude} cmake/hello-library/cxx/hello.cpp
      :language: c++
      ```

      greeting.cpp:

      ```{literalinclude} cmake/hello-library/cxx/greeting.cpp
      :language: c++
      ```

      greeting.hpp:

      ```{literalinclude} cmake/hello-library/cxx/greeting.hpp
      :language: c++
      ```
   ```

   ```{group-tab} Fortran

      hello.f90:

      ```{literalinclude} cmake/hello-library/fortran/hello.f90
      :language: fortran
      ```

      greeting.f90:

      ```{literalinclude} cmake/hello-library/fortran/greeting.f90
      :language: fortran
      ```
   ```
````

**Your first goal**: try to build this by adapting the `CMakeLists.txt` from
earlier by first adding all the source files into the same `add_executable`.

CMake can of course be used to produce libraries as well as executables.  The
relevant command is `add_library`.  You can link libraries can be linked into
other targets (executables or other libraries) with `target_link_libraries`.

**Your second goal**: now try to build a greeting library and link against this
library instead of collecting all sources into the executable target:

````{tabs}
   ```{group-tab} C++

      ```{literalinclude} cmake/hello-library/cxx/CMakeLists.txt
      :language: cmake
      ```
   ```

   ```{group-tab} Fortran

      ```{literalinclude} cmake/hello-library/fortran/CMakeLists.txt
      :language: cmake
      ```
   ```
````

Which solution did you like better? Discuss the pros and cons.

---

## Exercise CMake-3: Detecting your environment

Sometimes we need to write code that performs different operations based on
compile-time constants.
Like in this example (`example.cpp`):

```{literalinclude} cmake/os-dependent/example.cpp
:language: c++
```

We can do this with the following `CMakeLists.txt`:

```{literalinclude} cmake/os-dependent/CMakeLists.txt
:language: cmake
```

**Please try it out** before moving on.

We achieved this with a combination of host system
introspection and the `target_compile_definitions` command.

Now before moving on, **create a new directory**.
A common customization is to apply processor-specific compiler flags. We can
gain such information on the host system with the built-in
`cmake_host_system_information` command.

Another thing that is common and convenient is to have a single file containing
all these compile-time constants, rather than passing them to preprocessor.
This can be achieved by having a *scaffold* file and then letting CMake
configure it with `configure_file` after discovering the values for all the
necessary compile-time constants.

Here is an example source file (`example.cpp`):

```{literalinclude} cmake/configure-file/problem/example.cpp
:language: c++
```

The file `config.h` does not exist, it will be generated at configure time
from `config-template.h`:

```{literalinclude} cmake/configure-file/problem/config-template.h
:language: c
```

Here is the `CMakeLists.txt` which takes care of introspection and also
generates the file `config.h`:

```{literalinclude} cmake/configure-file/problem/CMakeLists.txt
:language: cmake
:emphasize-lines: 29
```

Your goal is to adapt the above example
and make it possible to get the compiler and compiler version into the
output of your code:

```{literalinclude} cmake/configure-file/problem/example.cpp
:language: c++
:emphasize-lines: 15-16
```

Hints:
- You will only need to uncomment these and only have to modify `configure-template.h`.
- You will not need to modify `CMakeLists.txt`.
- The relevant variable names are `CMAKE_CXX_COMPILER_ID` and `CMAKE_CXX_COMPILER_VERSION` (or replace `CXX` by `C` or `Fortran`).

````{solution}
```{literalinclude} cmake/configure-file/solution/config-template.h
:language: c
:emphasize-lines: 9,10
```
````

**What else to record when configuring?** Here are some ideas:
- Code version and/or Git hash
- Compiler versions
- Compiler flags
- Compile-time definitions
- Library versions
- Some environment variables

Discuss how they can be useful for you and others running your code.

---

## Exercise CMake-4: Finding and using dependencies

CMake offers a family of commands to find artifacts installed on your system:

- `find_file` to retrieve the full path to a file.
- `find_library` to find a library, shared or static.
- `find_package` to find and load settings from an external project.
- `find_path` to find the directory containing a file.
- `find_program` to find an executable.

For this exercise, choose one of the examples below which is closest to your
work and most relevant for your code.

1. Try to compile and run.
2. Browse the online documentation of the `Find<PackageName>.cmake` module (e.g. `FindOpenMP.cmake`).
3. Try to compile with verbosity (`cmake --build build -- VERBOSE=1`) and verify how the imported target modified
   compile flags and definitions.
4. **Bonus**: Try to adapt what we learned to an example which uses the BLAS or
   LAPACK library or your favorite library.

````{note}
Running the examples below on
[Dardel](https://www.pdc.kth.se/hpc-services/computing-systems/dardel-1.1043529)?
In this case you may need to load the `PrgEnv-gnu` module:
```console
$ module load PrgEnv-gnu
```
````

````{tabs}
   ```{group-tab} OpenMP (C++)
      Source file (`example.cpp`):

      ```{literalinclude} cmake/find-package/omp/cxx/example.cpp
      :language: c++
      ```

      And the `CMakeLists.txt` file:

      ```{literalinclude} cmake/find-package/omp/cxx/CMakeLists.txt
      :language: cmake
      ```
   ```

   ```{group-tab} OpenMP (Fortran)
      Source file (`example.f90`):

      ```{literalinclude} cmake/find-package/omp/fortran/example.f90
      :language: fortran
      ```

      And the `CMakeLists.txt` file:

      ```{literalinclude} cmake/find-package/omp/fortran/CMakeLists.txt
      :language: cmake
      ```
   ```

   ```{group-tab} MPI (C++)
      Source file (`example.cpp`):

      ```{literalinclude} cmake/find-package/mpi/cxx/example.cpp
      :language: c++
      ```

      And the `CMakeLists.txt` file:

      ```{literalinclude} cmake/find-package/mpi/cxx/CMakeLists.txt
      :language: cmake
      ```
   ```

   ```{group-tab} MPI (Fortran)
      Source file (`example.f90`):

      ```{literalinclude} cmake/find-package/mpi/fortran/example.f90
      :language: fortran
      ```

      And the `CMakeLists.txt` file:

      ```{literalinclude} cmake/find-package/mpi/fortran/CMakeLists.txt
      :language: cmake
      ```
   ```
````

---

## Exercise CMake-5: CMake-ify your own project

This may not be easy and you will probably need help from a TA or the
instructor but is a great exercise and we can try to do this together.  You can
find good tips in ["CMake introduction and hands-on
workshop"](https://coderefinery.github.io/cmake-workshop/).

---

## Where to find more examples and exercises

Curious about more CMake? As a next step, we recommend to work through the
["CMake introduction and hands-on workshop"](https://coderefinery.github.io/cmake-workshop/).
