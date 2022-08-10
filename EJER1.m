ok = 0;
while(ok == 0)
    V = input('Ingrese el vector de entrada: ');
    S = size(V);
    if length(S) ~= 2
        disp('Dos dimensiones, por favor.')
    elseif ((S(1) && S(2)) ~= 1)
        disp('Vector fila o columna, por favor.')
    else
        ok = 1;
    end
end



if S(1) > S(2)
    V = V';
end

imshow([V; V; V; V; V; V; V])

N = length(V);

V


for i = 2:N
    for j = 1:N-1
        if V(j) > V(j+1)
            V([j j+1]) = V([j+1 j]);
        end
    end
    imshow([V; V; V; V; V; V; V])
end

V