clc;
close all;
clear all;

format long
x = -3:0.1:0;
y = tan(exp(x)) + 5*x + 20;
plot(x,y)
grid on

a = -3;
b = 0;
delta_x = 0.1;
iteraciones = (b-a)/delta_x; %nos dice cuÆntos "rectÆngulos son"
x1 = a:delta_x:b-delta_x; %x1 va de a hasta b con intervalos de delta x
fdx1 = tan(exp(x1))+5*x1+20; %sacamos las alturas de los delta x
Area = fdx1*delta_x; %sacamos el Ærea de cada uno de los rectÆngulos
Area_total = sum(Area) %suma todas las Æreas de los rectÆngulos
