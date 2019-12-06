####################################################################
#                                                                  #
#  SEISMIC UN*X PARA LA ENSEÑANZA DEL MÉTODO DE REFLEXIÓN SÍSMICA  #
#                Capítulo 3: Modelamiento sísmico 2D               #
#  En este script se grafica el modelo de velocidad de onda P      #
#  uniforme de la cuenca del Mar Rojo                              #
#                                                                  #
####################################################################

#! /bin/sh
set -x

# Parametros de entrada
modelfile=vp_redsea_model.su
sufile=vp_redsea.su
binfile=vp_redsea
psfile=$binfile.eps
n1=2801                 # numero de muestras en el eje z
n2=9441                 # numero de muestras en el eje x
d1=0.00125              # intervalo de muestreo en el eje z
d2=0.00125              # intervalo de muestreo en el eje x

suoldtonew < $modelfile > $sufile
sustrip < $sufile > $binfile

psimage < $binfile > $psfile n1=$n1 d1=$d1 n2=$n2 d2=$d2 label2="Distancia (km)" label1="Profundidad (km)" width=11.8 height=3.5 d1num=1 f1num=0 d2num=2 f2num=0 legend=1 lstyle=horibottom units="m/s"

exit
