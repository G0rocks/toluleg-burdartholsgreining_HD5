% Plane stress model 
% Ath. þessi kóði keyrir ekki nema með viðbótum
% Reikna k-fylki með function ke
clear all
close all
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
global x y E t nu ieg dof
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x = [0  0  0.4  0.4]';
y = [0  0.2 0.2  0]';
E = 210E9; nu = 0.3;
t = 0.020;
nel = 2;
nnodes = length(x); 			
ieg = [1 1;			%Tengja hnútpkt elemt
 	3 4;
	2 3];
nn= [1,2,3,4];
dof=6;
F = [0 0 0 0 14000 0 14000 0]';

% Setjum núll í kerfisstífnifylkið K
K = zeros(2*nnodes);

% Hér köllum við á global hnútpkt.nr. til að setja rétt inn í kerfisstífnifylkið
for i = 1:nel
   lb = 2*(ieg(1,i)-1);
   mb = 2*(ieg(2,i)-1);
   nb = 2*(ieg(3,i)-1);

   kel = k(i)

   for m = 1:2
      for n = 1:2
         K(lb+m,lb+n) = K(lb+m,lb+n) + kel(m,n);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Hér þarf að bæta við til að búa til kerfisstífnifylkið
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
      end	%n
   end 	%m  
end	%i
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 for t = nn;
   K(:,t) = 0;		
   K(t,:) = 0;
   K(t,t) = 1;	
   F(t) = 0;	
 end
dis = inv(K)*F;
d = double(dis)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function ke = k(i)
global x y E t nu ieg dof
a = ieg(1,i); b = ieg(2,i); c = ieg(3,i);	
 x1 = x(a);
 x2 = x(b);
 x3 = x(c);
 y1 = y(a);
 y2 = y(b);
 y3 = y(c);
%
D = E/(1 - nu^2)*[1, nu, 0; nu, 1, 0; 0, 0, (1 - nu)/2];
beta1 = y2 - y3; beta2 = y3 - y1; beta3 = y1 - y2;
gamma1 = x3 - x2; gamma2 = x1 - x3; gamma3 = x2 - x1;
alpha1 = x2*y3 - x3*y2; alpha2 = x3*y1 - x1*y3; alpha3 = x1*y2 - x2*y1;
A = (alpha1 + alpha2 + alpha3)/2;
% shape functions
%N = [1/(2*A)*(alpha1+beta1*x+gamma1*y)  1/(2*A)*(alpha2 + beta2*x+gamma2*y)  1/(2*A)*(alpha3+beta3*x+gamma3*y)]
% the B-matrix
%
%B = [diff(N(1),x) 0 diff(N(2),x) 0 diff(N(3),x) 0;
%     0 diff(N(1),y) 0 diff(N(2),y)  0  diff(N(3),y);
%     diff(N(1),y) diff(N(1),x) diff(N(2),y) diff(N(2),x) diff(N(3),y) diff(N(3),x)];
%
%eða 
B = [beta1 0 beta2 0 beta3 0; 0 gamma1 0 gamma2 0 gamma3; 
  gamma1 beta1 gamma2 beta2 gamma3 beta3]/(2*A);
%
  ke=zeros(dof);
% Generate equations for each element 
    ke = t*A*(B'*D*B)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end

