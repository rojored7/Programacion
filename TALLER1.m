clc;
close all;
clear all;

V = input('Ingrese el tamaño del vector: ');
tama=V;
Vector=[0];

for(V = 0: tama-1)
    I=input('Ingrese valor en la posicion: ');
    Vector=[Vector,I];
end
Vec=Vector(2:tama+1)
N = length(Vec)

for i = 1:N
    for j = 1:N-1
        if Vec(j) > Vec(j+1)
            Vec([j j+1]) = Vec([j+1 j]);
        end
    end

end
Vec
