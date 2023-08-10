#include <iostream>

#include <mpi.h>

int main() {
    MPI_Init(NULL, NULL);

    int id;
    MPI_Comm_rank(MPI_COMM_WORLD, &id);

    std::cout << "hello from rank " << id << std::endl;

    MPI_Finalize();
}
