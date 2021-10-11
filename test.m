% Reikna álagsvigur
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
syms x y a L A p t
b = 0.03;   % [m] - Breidd
h = 0.02;   % [m] - Haed
x1=0;y1=0;
x2=b;y2=0;
x3=0;y3=h;
%
beta1 = y2 - y3; beta2 = y3 - y1; beta3 = y1 - y2;
gamma1 = x3 - x2; gamma2 = x1 - x3; gamma3 = x2 - x1;
alpha1 = x2*y3 - x3*y2; alpha2 = x3*y1 - x1*y3; alpha3 = x1*y2 - x2*y1;
A = (alpha1 + alpha2 + alpha3)/2;
% shape functions
Nraun = [1/(2*A)*(alpha1+beta1*x+gamma1*y)  1/(2*A)*(alpha2 + beta2*x+gamma2*y)  1/(2*A)*(alpha3+beta3*x+gamma3*y)]
x = a;
evalNraun = eval(Nraun)
f = t*int(evalNraun.'*p,y,0,L)
