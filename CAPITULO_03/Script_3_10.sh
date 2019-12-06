####################################################################
#                                                                  #
#  SEISMIC UN*X PARA LA ENSEÑANZA DEL MÉTODO DE REFLEXIÓN SÍSMICA  #
#                Capítulo 3: Modelamiento sísmico 2D               #
#  En este script se grafica el modelo de velocidad de onda P      #
#  uniforme de la cuenca de aguas profundas del Golfo de México    #
#                                                                  #
####################################################################

#! /bin/sh
set -x

modelfile=SEAM_Vp_Elastic_N23900.sgy
sufile=vp_SEAM.su
binfile=vp_SEAM
psfile=$binfile.eps
n1=1501         # numero de muestras en el eje z
n2=1751         # numero de muestras en el eje x
d1=0.01         # intervalo de muestreo en el eje z en km
d2=0.02         # intervalo de muestreo en el eje x en km

segyread tape=$modelfile | segyclean > $sufile
sustrip < $sufile > $binfile

psimage < $binfile > $psfile n1=$n1 d1=$d1 n2=$n2 d2=$d2 label2="Distancia (km)" label1="Profundidad (km)" width=14 height=6 d1num=5 f1num=0 d2num=5 f2num=0 legend=1 lstyle=horibottom units="m/s"

exit
