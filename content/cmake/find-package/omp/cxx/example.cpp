#include <cstdlib>
#include <iostream>

#include <omp.h>

int main() {

  #pragma omp parallel
  {
    std::cout << "hello from thread " << omp_get_thread_num() << std::endl;
  }

  return EXIT_SUCCESS;
}
