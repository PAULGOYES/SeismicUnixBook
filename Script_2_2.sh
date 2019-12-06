#####################################################################
#                                                                   #
#  SEISMIC UN*X PARA LA ENSEÑANZA DEL MÉTODO DE REFLEXIÓN SÍSMICA   #
#           Capítulo 2: Empezando con Unix y Seismic Unix           #
#                  Script 2.2: Sintaxis de un case                  #
#  El siguiente script corresponde a un ejemplo de un case aplicado #
#  a los programas de SU: suxwigb, suximage y supswigp              #
#                                                                   #
#####################################################################

#!/bin/sh

signaltonoise=10

# Definir una variable
suplane | suaddnoise sn=$signaltonoise > myplot.su
# suaddnoise agrega ruido a suplane según la variable signaltonoise

case $1 in
# Definir una variable
wiggle)
# Valor que puede tomar la variable
suxwigb < myplot.su title="Grafica de wiggles";;
# Comando ejecutado para el valor wiggle
imagen)
suximage < myplot.su title="Mapa de bits";;
pswiggle)
supswigp < myplot.su > myplot1.eps title="Postscript Wiggle"
echo " "
echo "El archivo de wiggles myplot1.eps ha sido creado."
# Imprimir el texto en pantalla
echo " ";;
psimagen)
supsimage < myplot.su > myplot2.eps title="Postscript Mapa de bits"
echo " "
echo "El archivo de mapa de bits myplot2.eps ha sido creado."
echo " ";;
esac

exit
