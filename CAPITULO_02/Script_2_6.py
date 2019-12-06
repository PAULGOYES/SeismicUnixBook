########################################################################
#                                                                      #
#   SEISMIC UN*X PARA LA ENSEÑANZA DEL METODO DE REFLEXION SISMICA     #
#            Capitulo 2: Empezando con Unix y Seismic Unix             #
#  En este script se grafica y se normaliza el archivo seismic2.ascii  #
#  creado con b2a, teniendo en cuenta que los datos están              #
#  tabulados por espacios                                              #
#                                                                      #
########################################################################

import numpy as np
import matplotlib.pyplot as plt

a= np.loadtxt('seismic2.ascii') # normalizar entre 0 y 1
a2= (a-a.min())/a.ptp()
data= np.reshape(a, (801, 601), order='F')
data= data.T
data2= np.reshape(a2, (801, 601), order='F')
data2= data2.T

plt.subplot(121)
plt.imshow(data, cmap='seismic',aspect= 'auto', interpolation='bilinear')
plt.title("seismic.su original en Python")
plt.xlabel("Numero de trazas")
plt.ylabel("Numero de muestras en el tiempo")
plt.colorbar()

plt.subplot(122)
plt.imshow(data2, cmap='seismic',aspect = 'auto', interpolation \
='bilinear')
plt.title("seismic.su normalizado en Python")
plt.xlabel("Numero de trazas")
plt.colorbar()
plt.show()
np.savetxt('seismic_py2.ascii', data2.T.flatten())

