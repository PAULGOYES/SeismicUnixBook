####################################################################
#                                                                  #
#  SEISMIC UN*X PARA LA ENSEÑANZA DEL MÉTODO DE REFLEXIÓN SÍSMICA  #
#                Capítulo 3: Modelamiento sísmico 2D               #
#  En este script se hace la conversión del modelo de velocidades  #
#  triangulado de cuatro capas homogéneas al modelo uniforme con   #
#  tri2uni                                                         #
#                                                                  #
####################################################################

#! /bin/sh
set -x

# Parametros de entrada
modelfile=Trimodel.dat
file=Tri2uni
psfile=$file.eps

Lx=2        # longitud del modelo (km)
Lz=1        # profundidad del modelo (km)
n1=1000     # numero de muestras en el eje z
n2=2000     # numero de muestras en el eje x

# no modificar!
d1=`echo "$Lx/$n2" | bc -l`     # intervalo de muestreo eje z en km
d2=`echo "$Lz/$n1" | bc -l`     # intervalo de muestreo eje x en km

d1m=`echo "$d1*1000" | bc -l`   # intervalo de muestreo eje z en m
d2m=`echo "$d2*1000" | bc -l`   # intervalo de muestreo eje x en m

tri2uni < $modelfile n2=$n2 n1=$n1 d1=$d1 d2=$d2 > $file

farith < $file op=pinvsqrt > op1        # raiz cuadrada de 1/$file
farith < op1 scale=1000 op=scale > op2  # multiplicar por 1000

# crear un archivo Postscript del modelo
psimage < op2 > $psfile n1=$n1 n2=$n2 d1=$d1m d2=$d2m title="Tri2uni" label2="Distancia (m)" label1="Profundidad (m)" width=10.0 height=5.0 legend=1 units="m/s" lx=0 d1num=200 f1num=0 d2num=200 f2num=0

exit
