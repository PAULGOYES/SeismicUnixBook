######################################################################
#                                                                    #
#  SEISMIC UN*X PARA LA ENSEÑANZA DEL MÉTODO DE REFLEXIÓN SÍSMICA    #
#                Capítulo 3: Modelamiento sísmico 2D                 #
#  En este script se construye el modelo de velocidades triangulado  #
#  para la cuenca del Chocó con trimodel                             #
#                                                                    #
######################################################################

#! /bin/sh
set -x

# Parametros de entrada
name=Choco_Trimodel
modfile=$name.dat
psfile=$name.eps

rm -f $psfile $modfile

trimodel xmin=0 xmax=17 zmin=0 zmax=4 \
1  xedge=0,17 \
   zedge=0,00 \
   sedge=0,00 \
3  xedge=1.92,6.1,9.7 \
   zedge=0.00,0.7,0.9 \
   sedge=0.00,0.0,0.0 \
4  xedge=9.72,10.1 \
   zedge=1.10,1.10 \
   sedge=0.00,0.00 \
5  xedge=10.1,10.3 \
   zedge=1.00,1.00 \
   sedge=0.00,0.00 \
6  xedge=10.35,11.6,15.9 \
   zedge=0.900,0.90,0.00 \
   sedge=0.000,0.00,0.00 \
10 xedge=0.00,1.14,1.50 \
   zedge=0.73,0.74,0.80 \
   sedge=0.00,0.00,0.00 \
11 xedge=1.52,6.1,9.73 \
   zedge=0.74,1.4,1.60 \
   sedge=0.00,0.0,0.00 \
12 xedge=9.74,10.15 \
   zedge=1.70,1.700 \
   sedge=0.00,0.000 \
13 xedge=10.20,11.6,15.4,16.8 \
   zedge=1.550,1.55,0.70,0.00 \
   sedge=0.000,0.00,0.00,0.00 \
15 xedge=0.0,1.40 \
   zedge=1.3,1.32 \
   sedge=0.0,0.00 \
16 xedge=1.38,1.52 \
   zedge=1.34,1.40 \
   sedge=0.00,0.00 \
17 xedge=1.55,2.00,4.44,4.80,8.10,9.75 \
   zedge=1.34,1.40,1.80,1.80,2.10,2.05 \
   sedge=0.00,0.00,0.00,0.00,0.00,0.00 \
18 xedge=9.76,9.90 \
   zedge=2.10,2.10 \
   sedge=0.00,0.00 \
19 xedge=10.0,11.6,13.4,14.5,15.4 \
   zedge=2.05,2.20,1.70,1.15,0.70 \
   sedge=0.00,0.00,0.00,0.00,0.00 \
20 xedge=14.5,15.5,16.8 \
   zedge=1.15,0.80,0.00 \
   sedge=0.00,0.00,0.00 \
22 xedge=4.44,5.53 \
   zedge=1.80,2.00 \
   sedge=0.00,0.00 \
23 xedge=5.65,5.70,7.50,7.91 \
   zedge=2.20,2.20,2.80,2.87 \
   sedge=0.00,0.00,0.00,0.00 \
24 xedge=8.00,8.30,8.50,8.70 \
   zedge=2.70,2.70,2.75,2.69 \
   sedge=0.00,0.00,0.00,0.00 \
25 xedge=8.75,9.00,9.35 \
   zedge=2.55,2.67,2.67 \
   sedge=0.00,0.00,0.00 \
26 xedge=9.60,10.1 \
   zedge=2.45,2.60 \
   sedge=0.00,0.00 \
27 xedge=10.2,11.2,13.4 \
   zedge=2.50,2.65,1.70 \
   sedge=0.00,0.00,0.00 \
2  xedge=0,17 \
   zedge=4,04 \
   sedge=0,00 \
7  xedge=9.7,9.72,9.73,9.74,9.75,9.76 \
   zedge=0.9,1.10,1.60,1.70,2.05,2.10 \
   sedge=0.0,0.00,0.00,0.00,0.00,0.00 \
8  xedge=10.1,10.1 \
   zedge=1.00,1.10 \
   sedge=0.00,0.00 \
9  xedge=9.35,9.60,9.90,10.0,10.15,10.20,10.3,10.35 \
   zedge=2.67,2.45,2.10,2.05,1.700,1.550,1.00,0.900 \
   sedge=0.00,0.00,0.00,0.00,0.000,0.000,0.00,0.000 \
14 xedge=1.38,1.40,1.50,1.52 \
   zedge=1.34,1.32,0.80,0.74 \
   sedge=0.00,0.00,0.00,0.00 \
21 xedge=1.52,1.55 \
   zedge=1.40,1.34 \
   sedge=0.00,0.00 \
28 xedge=5.53,5.65 \
   zedge=2.00,2.20 \
   sedge=0.00,0.00 \
29 xedge=7.91,8.00 \
   zedge=2.87,2.70 \
   sedge=0.00,0.00 \
30 xedge=8.70,8.75 \
   zedge=2.69,2.55 \
   sedge=0.00,0.00 \
31 xedge=10.1,10.2 \
   zedge=2.60,2.50 \
   sedge=0.00,0.00 \
kedge=1,2 \
sfill=8.00,0.10,0,0,0.44,0,0 \
sfill=1.60,0.71,0,0,0.34,0,0 \
sfill=10.0,1.11,0,0,0.34,0,0 \
sfill=11.6,0.91,0,0,0.34,0,0 \
sfill=1.00,0.75,0,0,0.25,0,0 \
sfill=6.10,1.50,0,0,0.25,0,0 \
sfill=10.0,1.80,0,0,0.25,0,0 \
sfill=11.6,1.60,0,0,0.25,0,0 \
sfill=15.4,0.71,0,0,0.34,0,0 \
sfill=8.10,2.11,0,0,0.16,0,0 \
sfill=11.6,2.21,0,0,0.16,0,0 \
sfill=2.00,3.00,0,0,0.03,0,0 > $modfile

spsplot < $modfile > $psfile gtri=0.6 gedge=0 gmin=0 gmax=1 dxnum=2 dznum=2 labelz="Profundidad (km)" labelx="Distancia (km)" wbox=21.5 hbox=5.0

exit
