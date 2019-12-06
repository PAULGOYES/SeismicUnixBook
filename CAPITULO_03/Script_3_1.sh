#####################################################################
#                                                                   #
#  SEISMIC UN*X PARA LA ENSEÑANZA DEL MÉTODO DE REFLEXIÓN SÍSMICA   #
#                Capítulo 3: Modelamiento sísmico 2D                #
#  En este script se elabora el modelo de velocidades triangulado   #
#  de cuatro capas homogéneas con trimodel                          #
#                                                                   #
#####################################################################

#! /bin/sh
set -x

# Parametros de entrada
name=Trimodel       # nombre del modelo
modfile=$name.dat   # nombre del archivo triangulado de salida
psfile=$name.eps    # nombre de la imagen Postscript

rm -f $psfile $modfile

trimodel xmin=0 xmax=2 zmin=0 zmax=1 \ # coordenadas max y min
1 xedge=0,2 \    # coordenadas en x de los vertices A y B
  zedge=0,0 \    # coordenadas en z de los vertices A y B
  sedge=0,0 \    # sloth a lo largo de la interfaz 1
2 xedge=0,2 \
  zedge=0.25,0.25 \
  sedge=0,0 \
3 xedge=1,2 \
  zedge=0.25,0.5 \
  sedge=0,0 \
4 xedge=0,2 \
  zedge=0.5,0.75 \
  sedge=0,0 \
5 xedge=0,2 \
  zedge=1,1 \
  sedge=0,0 \
kedge=1,2,3,4 \
sfill=1.5,0.1,0,0,0.4444,0,0 \ 
sfill=1.5,0.3,0,0,0.2922,0,0 \
sfill=1.5,0.6,0,0,0.1736,0,0 \
sfill=1.5,0.8,0,0,0.1111,0,0  > $modfile    # guardar
# sfill= x, z, x0, z0, s00, dsdx, dsdz

# crear un archivo Postscript del modelo
# seleccionar gtri=1.0 para visualizar los triangulos
spsplot < $modfile > $psfile gtri=1.0 gedge=2.0 dxnum=0.25 dznum=0.25 labelz="Profundidad (km)" labelx="Distancia (km)" wbox=10.0 hbox=5.0

exit
