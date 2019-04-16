# coding: utf-8

import serial
import csv
import os
import time
import pandas as pd
import numpy as np

arduino = serial.Serial('/dev/ttyACM0', 9600, timeout=.1)

n = len(os.listdir('datos/'))
filename = 'datos/humedad_{}.csv'.format(n)

i=0
with open(filename,'w') as f:
    f.write('Date,'+'Humedad (voltios)'+'\n')
    while i<60:
        now = time.strftime('%x %X')
        data = arduino.readline()[:-1]
        if data:
            f.write(now+','+data.decode())
            print(data)
            i=i+1
