clc;
close all;
clear all;

%toma de datos para X
X = input('Ingrese el tamaño del vector: ');
tamax=X;
Vectorx=[0];

for(X = 0: tamax-1)
    I=input('Ingrese valor en la posicion X: ');
    Vectorx=[Vectorx,I];
end
%toma de datos para Y

tamay=tamax;
Vectory=[0];

for(Y = 0: tamay-1)
    I=input('Ingrese valor en la posicion Y: ');
    Vectory=[Vectory,I];
end
Vecx=Vectorx(2:tamax+1)
Vecy=Vectory(2:tamay+1)
N = length(Vecy);

plot(Vecx,Vecy,'dk'); xlabel('Eje X'),ylabel('Eje Y'), title('Minimos cuadrados');
grid on;
hold on;

sumxi_yi=sum(Vecx.*Vecy);
sumxi=sum(Vecx);
sumxi_cua=sum(Vecx.^2);
cuadrado_sumxi=(sumxi)^2;
sumyi=sum(Vecy);

%calculo de minimos cuadrados con programa 
a=((N*sumxi_yi)-(sumxi*sumyi))/((N*sumxi_cua)-cuadrado_sumxi)
b=(sumyi-(a*sumxi))/N
y=a*Vecx+b;

plot(Vecx,y,'r:')

%calculo de minimos cuadrados por funcion de matlab
ecmatlab=polyfit(Vecx,Vecy,1)

