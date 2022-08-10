clc;
close all;
clear all;

format long
h = 0.1; %Tamaæo del incremento
xf = 55; %Resolvemos de [0, xf]
x(1) = 0; %Condiciones iniciales
y(1) = 5;
f=@(x,y) sin(x) + cos(y); %@ sirve para declarar la función
%Ciclo RK4
for i=1:ceil(xf/h)
    x(i+1) = x(i)+h; %Actualizamos x
    k1 = f(x(i),y(i)); %Actualizamos y
    k2 = f(x(i)+0.5*h,y(i)+0.5*k1*h);
    k3 = f(x(i)+0.5*h,y(i)+0.5*k2*h);
    k4 = f(x(i)+0.5*h,y(i)+ k3*h);
    %Calculamos nuestro incremento
    delta_y = (1/6)*(k1+2*k2+2*k3+k4);
    %Actualizamos y actual con
    y(i+1) = y(i) + h*delta_y;
end
%gracamos nuestra solucion
plot(x,y)
xlabel('x')
ylabel('y')

