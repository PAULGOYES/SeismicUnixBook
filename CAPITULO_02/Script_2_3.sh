#####################################################################
#                                                                   #
#  SEISMIC UN*X PARA LA ENSEÑANZA DEL MÉTODO DE REFLEXIÓN SÍSMICA   #
#           Capítulo 2: Empezando con Unix y Seismic Unix           #
#         Script 2.3: Crear archivos migrados de simple.su          #
#  En este script se crean tres archivos migrados de simple.su, con #
#  los programas sustolt, sumigps y sumigfd                         #
#                                                                   #
#####################################################################


#! bin/bash
set -x

file=simple.su
stolt=stolt.$file
ps=ps.$file
fd=fd.$file

rm -f $solt $ps $fd

wget http://www.reproducibility.org/data/cwp/simple.su
wget http://www.reproducibility.org/data/cwp/vel.kdmig.simple

# MIGRACIÓN STOLT
sustolt < $file cdpmin=1 cdpmax=80 dxcdp=40 vmig=2000 tmig=0.0> $solt

# MIGRACIÓN PHASE-SHIFT
sumigps < $file dx=40 vmig=2000 tmig=0.0 > $ps

# MIGRACIÓN POR DIFERENCIAS FINITAS
sumigfd < $file dx=40 dz=12 nz=150 vfile=vel.kdmig.simple > $fd

exit 
