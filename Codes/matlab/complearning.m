clear all
close all
clc

% Se crean los inputs de X.
% Datos aleatorios pero clusterizados.
bounds = [0 1; 0 1];   % Centro de clusters que estaran en este rango.
clusters = 2;          % Cantidad de Clusters.
points = 10;           % Numero de data points en cada cluster.
std_dev = 0.05;        % Desviaci�n est�ndar de cada cl�ster.
%x = nngenc(bounds,clusters,points,std_dev);


x = [0.8  0.1736 0.707 0.342 0.6
     0.58 -0.9848 0.707 -0.9397 0.8]

% Se plotean los puntos para visualizarlos.
figure (1)
plot(x(1,:),x(2,:),'+r');
title('Input Vectors');
xlabel('x(1)');
ylabel('x(2)');



% Aqu� COMPETLAYER toma dos argumentos, el n�mero de neuronas y la tasa de
% aprendizaje. Se puede configurar las entradas de red (suele realizarse de
% forma autom�tica en TRAIN) y trazar los vectores de pesos iniciales para
% ver su intento de clasificaci�n.
net = competlayer(2,.1);
net = configure(net,x);
w = net.IW{1};
figure (2)
plot(x(1,:),x(2,:),'+r');
hold on;
circles = plot(w(:,1),w(:,2),'ob');

% Establecer el n�mero de iteraciones (epochs) para entrenar
% antes de detenerse y entrenar la capa competitiva
% Ploteamos los pesos actualizados de las capas en el mismo gr�fico.
net.trainParam.epochs = 7;
net = train(net,x);
w = net.IW{1};
delete(circles);

plot(w(:,1),w(:,2),'ob');


% Ahora se puede usar la capa competitiva como un clasificador, donde cada
% neurona corresponde a una categor�a. Aqu� se define un vector input como
% [0; 0.2].
% El output Y indica qu� neurona est� respondiendo y por lo tanto a qu�
% clase pertenece el input.
x1 = [0; 0.2];
y = net(x1);