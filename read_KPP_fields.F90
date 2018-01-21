program read_KPP_fields

use netcdf
implicit none

character (len = *), parameter :: FILE_NAME = "./KPP_fields.nc"
integer :: ncid, varid

integer, parameter :: IIPAR=72, JJPAR=46, LLPAR=72
integer, parameter :: NSPEC=238, NREACT=722
REAL*8 :: C_before(NSPEC, IIPAR, JJPAR, LLPAR)
!REAL(fp) :: C_after(NSPEC, IIPAR, JJPAR, LLPAR)
!REAL(fp) :: RCONST(NREACT, IIPAR, JJPAR, LLPAR)

! Open the file with read-only access
call check( nf90_open(FILE_NAME, NF90_NOWRITE, ncid) )

! Get the varid of the data variable, based on its name.
call check( nf90_inq_varid(ncid, "C_before", varid) )

! Read the data.
call check( nf90_get_var(ncid, varid, C_before) )

print*, C_before(227, 31, 31, :)

! Close the file, freeing all resources.
call check( nf90_close(ncid) )

contains

  subroutine check(status)
    integer, intent ( in) :: status
    
    if(status /= nf90_noerr) then 
      print *, trim(nf90_strerror(status))
      stop "Stopped"
    end if
  end subroutine check  
  
end program read_KPP_fields