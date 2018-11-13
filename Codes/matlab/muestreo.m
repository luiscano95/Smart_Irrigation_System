clc
clear all 
close all

X = 1:1:8;
Y = 1:1:8;
[Xr Yr] = meshgrid(X, Y);
Zr = xlsread('puntos_grafico.xlsx');

datos = reshape(Zr, [1, 64])';
datos1 = reshape(Xr, [1, 64])';
datos2 = reshape(Yr, [1, 64])';

todo = [datos1 datos2 datos];

ind1 = todo(:,3) >= 70.1 & todo(:,1) < 10 & todo(:,2) < 10;
ind2 = todo(:,3) > 30 & todo(:,3) <= 70 & todo(:,1) < 10 & todo(:,2) < 10;
ind3 = todo(:,3) <= 30 & todo(:,1) < 10 & todo(:,2) < 10;

A = todo(ind1,:);
B = todo(ind2,:);
C = todo(ind3,:);

kh = randperm(29);
km = randperm(33);
kl = randperm(2);

hi = A(kh(1:8),:);
med = B(km(1:9),:);
low = C(kl(1:1),:);

figure(1)
surf(Xr, Yr, Zr)
title('Parque Tamayo');
xlabel('Latitud');
ylabel('Longitud');
zlabel('Valor de Humedad');
hold on
plot3(hi(:,1),hi(:,2),hi(:,3), '.g','MarkerSize',25, 'LineWidth',5)
hold on
plot3(med(:,1),med(:,2),med(:,3), '.b','MarkerSize',25, 'LineWidth', 5)
hold on
plot3(low(:,1),low(:,2),low(:,3), '.r','MarkerSize',25, 'LineWidth', 5)