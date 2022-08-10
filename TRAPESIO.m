clc;
close all;
clear all;

format long
a = 0;
b = 2;
N = 1000; %nœmero de intervalos
h = (b - a)/N; %altura
x = a:h:b; %vamos de a a b con intervalos de h
y = sin(x.^2); %función a evaluar
area= y(1)+y(N);
for i = 2 : N-1
    area = area + 2*(y(i));
end
area=area*h/2
plot (x,y)
grid on


