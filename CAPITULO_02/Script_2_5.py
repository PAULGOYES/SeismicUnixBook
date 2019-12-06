#######################################################################
#                                                                     #
#   SEISMIC UN*X PARA LA ENSEÑANZA DEL MÉTODO DE REFLEXIÓN SÍSMICA    #
#            Capítulo 2: Empezando con Unix y Seismic Unix            #
#            Script 2.5: Graficar en Python seismic1.ascii            #
#  En este script se grafica y se normaliza el archivo seismic1.ascii #
#  creado con suascii, teniendo en cuenta que los datos están         #
#  tabulados por filas                                                #
#                                                                     #
#######################################################################

import numpy as np
import matplotlib.pyplot as plt

a= np.loadtxt('seismic1.ascii')
a2= (a-a.min())/a.ptp() # normalizar entre 0 y 1
data= np.reshape(a, (601, 801), order='F') # 601 muestras y 801 trazas
data= data
data2= np.reshape(a2, (601, 801), order='F')
data2= data2
plt.subplot(121)
plt.imshow(data, cmap='seismic',aspect= 'auto', interpolation='bilinear')
plt.title("seismic.su original en Python")
plt.xlabel("Numero de trazas")
plt.ylabel("Numero de muestras en el tiempo")
plt.colorbar()
plt.subplot(122)
plt.imshow(data2, cmap='seismic',aspect= 'auto', interpolation='bilinear')
plt.title("seismic.su normalizado en Python")
plt.xlabel("Numero de trazas")
plt.colorbar()
plt.show()
np.savetxt('seismic_py1.ascii', data2.T.flatten()) # guardar normalizacion

