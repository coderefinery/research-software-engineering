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
