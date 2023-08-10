#include "config.h"

#include <cstdlib>
#include <iostream>

int main() {
  std::cout << "Number of logical cores: " << NUMBER_OF_LOGICAL_CORES << std::endl;
  std::cout << "Number of physical cores: " << NUMBER_OF_PHYSICAL_CORES << std::endl;
  std::cout << "Processor is 64Bit: " << IS_64BIT << std::endl;
  std::cout << "Processor supports SSE2 instructions: " << HAS_SSE2 << std::endl;
  std::cout << "OS name: " << OS_NAME << std::endl;
  std::cout << "OS sub-type: " << OS_RELEASE << std::endl;

  std::cout << "Compiler: " << COMPILER << std::endl;
  std::cout << "Compiler version: " << COMPILER_VERSION << std::endl;

  return EXIT_SUCCESS;
}
