X = 0:0.1:10;
n = length(X);
y = X*5;
ruid = 10*(rand(1,n)-0.5);
Y = y + ruid;
scatter(X,Y,'b');
hold on
plot(X,y,'r')

Sx2 = sum(X.*X);
Sx = sum(X);
S1 = n;

Sxy = sum(X.*Y);
Sy = sum(Y);

M1 = [Sx2 Sx; Sx S1];
M2 = [Sxy; Sy];

V = M1^-1 * M2;

a = V(1)
b = V(2)

YEst = X*a + b;

plot(X,YEst,'k');

hold off