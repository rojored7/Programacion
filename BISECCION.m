clc;
close all;
clear all;

format long
x = -4:0.1:4;
y = (x.^2)+3*sin(2*x)-3;
plot(x,y)
grid on

error = 0.000001;
a = 0;%definimos el intervalo de donde quiero encontrar la raíz
b = 1;
c = (a+b)/2;
fdc = (c^2)+3*sin(2*c)-3;
i=0;
while(abs(fdc)> error)%mientras que el valor absoluto de fdc sea mayor al error, continua evaluando
    c=(a+b) / 2;
    fda=(a^2) + 3*sin(2*a) - 3;%pedimos que evalœe la ecuación en a, b y c
    fdb=(b^2) + 3*sin(2*b) - 3;
    fdc=(c^2) + 3*sin(2*c)-3;
    i=i+1; % para contruir una tabla
    a_vector(i)=a;
    c_vector(i)=c;
    b_vector(i)=b;
    fda_vector(i)=fda;
    fdc_vector(i)=fdc;
    fdb_vector(i)=fdb; % termina los valores para la tabla.
    if fda*fdc < 0 %si fda por fdc es mayor a 0, b se recorre a c
        b = c;
    else
       a = c; %si no, a se recorre
    end
end
i; % va a imprimir el nœmero de iteraciones que necesitó para llegar a ese valor
Tabla=[a_vector;c_vector;b_vector;fda_vector;fdc_vector;fdb_vector]; % se construye la tabla
a_vector
raiz = c %para imprimir la raíz
xlswrite('Tabla_180213_Metodo_biseccion.xlsx',Tabla) %Mandamos nuestros datos a un archivo de Excel.

