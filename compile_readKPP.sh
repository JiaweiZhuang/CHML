#!/bin/bash

gfortran-6 read_KPP_fields.F90 -o read_KPP_fields.exe -I$NETCDF_HOME/include -L$NETCDF_HOME/lib -lnetcdff
