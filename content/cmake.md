# Building code with CMake

These exercises are adapted from the [CodeRefinery](https://coderefinery.org/) lesson
["CMake introduction and hands-on workshop"](https://coderefinery.github.io/cmake-workshop/).


## Exercise CMake-1: Compiling "Hello, world" with CMake

In this exercise we will compile a single source file to an executable. Choose
your favorite language.

1. Create a new folder and in the folder create a source file:

````{tabs}
   ```{group-tab} C++

      ```{literalinclude} cmake/hello-executable/cxx/hello.cpp
      :language: c++
      ```
   ```

   ```{group-tab} Fortran

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

## Where to find more examples and exercises

Curious about more CMake? As a next step, we recommend to work through the
["CMake introduction and hands-on workshop"](https://coderefinery.github.io/cmake-workshop/).
