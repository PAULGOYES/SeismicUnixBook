########################################################################
#                                                                      #
#    SEISMIC UN*X PARA LA ENSEÑANZA DEL MÉTODO DE REFLEXIÓN SÍSMICA    #
#            Capítulo 2: Empezando con Unix y Seismic Unix             #
#  En este script se grafican los tres archivos migrados de simple.su  #
#  migración solt, phase shift y por diferencias finitas               #
#                                                                      #
########################################################################

#! bin/bash
set -x

file=simple.su
stolt=stolt.$file
ps=ps.$file
fd=fd.$file

rm -f $solt $ps $fd

# MIGRACIÓN STOLT
suxwigb < $stolt xcur=3 title="Migracion Stolt" label1="time" label2="trace" &

# MIGRACIÓN PHASE-SHIFT
suxwigb < $ps title="Migracion Phase shift" label1="time" label2="trace" xcur=3 &

# MIGRACIÓN POR DIFERENCIAS FINITAS
suxwigb < $fd title="Migracion por diferencias finitas" label1="depth" label2="trace" xcur=3 &

exit
