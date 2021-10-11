function f = alag(hnutpunktar)
syms x y a L A p t
x1 = hnutpunktar(1);
y1 = hnutpunktar(2);
x2 = hnutpunktar(3);
y2 = hnutpunktar(4);
x3 = hnutpunktar(5);
y3 = hnutpunktar(6);
beta1 = y2 - y3; beta2 = y3 - y1; beta3 = y1 - y2;
gamma1 = x3 - x2; gamma2 = x1 - x3; gamma3 = x2 - x1;
alpha1 = x2*y3 - x3*y2; alpha2 = x3*y1 - x1*y3; alpha3 = x1*y2 - x2*y1;
A = (alpha1 + alpha2 + alpha3)/2;
%  shape functions
N = [1/(2*A)*(alpha1+beta1*x+gamma1*y)  1/(2*A)*(alpha2 + beta2*x+gamma2*y)  1/(2*A)*(alpha3+beta3*x+gamma3*y)]
x = 0;
evalN = eval(N);
f = t*int(evalN.'*p,y,0,L);
end

