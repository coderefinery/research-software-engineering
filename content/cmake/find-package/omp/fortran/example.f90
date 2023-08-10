program example
  use omp_lib

!$OMP PARALLEL
  print *, "hello from thread ", omp_get_thread_num()
!$OMP END PARALLEL

end
