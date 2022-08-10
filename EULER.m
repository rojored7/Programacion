clc;
close all;
clear all;

format long
x = 0:0.01:2;
fdx = cos(5*x)/5;
plot(x,fdx)
grid on
y0 = 0.2;
x0 = 0;
delta_x = 0.01;
iteraciones = 2/delta_x;
xr = 0:delta_x:2; %deno un vector donde vayan todas las x que queremos calcular
xr(1) = x0;
y(1) = y0;
for i = 1:iteraciones
    f(i) = -sin(5*xr(i));
    y(i+1) = f(i)*delta_x+y(i);
end
hold on
scatter (xr,y)

