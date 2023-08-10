module greeting

  implicit none

  public say_hello

  private

contains

  pure function say_hello() result(message)

    implicit none

    character(len=11) :: message

    message = 'Hello world'

  end function

end module
