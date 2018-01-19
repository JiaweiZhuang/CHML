#!/bin/bash

# NetCDF-Fortran 4.4.4 is speparated from NetCDF-C. Need -lnetcdff (one more 'f')
gfortran-6 write_netcdf.F90 -I$NETCDF_HOME/include -L$NETCDF_HOME/lib -lnetcdff
