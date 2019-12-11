clc
clear all 
close all

X = 1:1:8;
Y = 1:1:8;
[Xr Yr] = meshgrid(X, Y);
Zr = xlsread('puntos_grafico.xlsx');
Zchico = [Zr(1,1);Zr(8,1);Zr(4,4);Zr(1,8);Zr(8,8)];
Xchico = [1;1;2;3;3];
Ychico = [1;3;2;1;3];
%[Xchicog, Ychicog] = meshgrid(Xchico, Ychico);
%Zchicog = meshgrid(Zchico);

input = [Xchico, Ychico];
output = Zchico;
red1 = newrbe(input',output',1);

figure(1)
surf(Xr, Yr, Zr)
title('Parque Tamayo');
xlabel('Latitud');
ylabel('Longitud');
zlabel('Valor de Humedad');
Z = [Zr(1,:)';Zr(2,:)';Zr(3,:)';Zr(4,:)';Zr(5,:)';Zr(6,:)';Zr(7,:)';Zr(8,:)';];
X = [Xr(1,:)';Xr(2,:)';Xr(3,:)';Xr(4,:)';Xr(5,:)';Xr(6,:)';Xr(7,:)';Xr(8,:)';];
Y = [Yr(1,:)';Yr(2,:)';Yr(3,:)';Yr(4,:)';Yr(5,:)';Yr(6,:)';Yr(7,:)';Yr(8,:)';];
entrada_red = [X,Y];

red2 = newrbe(entrada_red',Z',1);
xx = 1:0.1:8;
xx=xx';
yy = 1:0.1:8;
yy=yy';
entrada = [xx, yy];

salida1 = sim(red2,entrada');

Zp = meshgrid(salida1);
[Xp Yp] = meshgrid(xx,yy);

figure(2)
surf(Xp, Yp, Zp)

teste=[X,Y];

salida2 = sim(red1, teste');
figure(3)
salida2 = salida2';
Zsal = reshape(salida2,[8,8]);
surf(Xr, Yr, Zsal);



