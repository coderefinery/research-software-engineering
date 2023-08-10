program example
  use mpi

  implicit none

  integer :: error
  integer :: id

  call MPI_Init(error)
  call MPI_Comm_rank(MPI_COMM_WORLD, id, error)

  print *, "hello from rank ", id

  call MPI_Finalize(error)
end program
