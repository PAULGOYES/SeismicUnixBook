#####################################################################
#                                                                   #
#  SEISMIC UN*X PARA LA ENSEÑANZA DEL MÉTODO DE REFLEXIÓN SÍSMICA   #
#                Capítulo 3: Modelamiento sísmico 2D                #
#  En este script se elabora el modelo de velocidades uniforme de   #
#  cuatro capas homogéneas con unif2                                #
#                                                                   #
#####################################################################

#! /bin/sh
set -x

# Parametros de entrada
modelfile=coordenadas.txt
velfile=Unif2.bin

rm -f $modelfile $velfile

n1=500      # numero de muestras en el eje z
n2=1000     # numero de muestras en el eje x
d1=2        # intervalo de muestreo en el eje z (metros)
d2=2        # intervalo de muestreo en el eje x (metros)

unif2 <$modelfile nx=$n2 nz=$n1 dx=$d1 dz=$d2 v00=1500,1850,2400,3000 \
ninf=4 method=linear > $velfile 
# v00= velocidades en m/s
# method= metodo de interpolacion

# crear un archivo Postscript del modelo
psimage < $velfile > unif2.eps n1=$n1 n2=$n2 d1=$d1 d2=$d2 label2="Distancia (m)" label1="Profundidad (m)" width=10.0 height=5.0 legend=1 lx=0 units="m/s" d1num=250 f1num=0 d2num=250 f2num=0

exit
