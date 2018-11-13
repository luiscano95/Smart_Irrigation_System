clc
clear all
close all

tamayo=readfis('tamayo');
data = xlsread('tamayo.xlsx','Simulación','B92:C119');
score_tamayo = evalfis(data,tamayo);

figure(1)
plotfis(tamayo)


figure(2)
plotmf(tamayo,'input',1)
title('Humedad')

figure(3)
plotmf(tamayo,'input',2)
title('Temperatura')

figure(4)
plotmf(tamayo,'output',1)
title('Score')

figure(5)
gensurf(tamayo)
title('Matriz de combinaciones')
grid on