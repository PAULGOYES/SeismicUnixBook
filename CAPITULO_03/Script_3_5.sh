####################################################################
#                                                                  #
#  SEISMIC UN*X PARA LA ENSEÑANZA DEL MÉTODO DE REFLEXIÓN SÍSMICA  #
#                Capítulo 3: Modelamiento sísmico 2D               #
#  En este script se hace la conversión del modelo de velocidades  #
#  triangulado al modelo uniforme para la cuenca de Guajira Costa  #
#  Afuera con tri2uni                                              #
#                                                                  #
####################################################################

#! /bin/sh
set -x

# Parametros de entrada
modelfile=Guajira_Trimodel.dat
file=Guajira_Uniforme
psfile=$file.eps

Lx=10 	
Lz=4 	
n1=2000 
n2=2000 	
d1=0.002
d2=0.005

tri2uni < $modelfile n2=$n2 n1=$n1 d1=$d1 d2=$d2 > $file

farith < $file op=pinvsqrt > op1
farith < op1 scale=1000 op=scale > op2 

psimage < op2 > $filpe.eps n1=$n1 n2=$n2 d1=$d1 d2=$d2 label2="Distancia (km)" label1="Profundidad (km)" width=12.5 height=5.0 d1num=2 d2num=2 f1num=0 f2num=0 legend=1 lstyle=horibottom units="m/s"

exit
