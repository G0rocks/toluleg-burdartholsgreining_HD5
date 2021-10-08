disp("HD 5");
disp("");

% Daemi 1 - Plane strain
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp("Daemi 1");
disp("");
H = 10;         % [m]
t = 1;          % [m] - Thickness
E = 10*10^9;    % [Pa]
poisson = 10000; %[N/m^3]
hnutpunktar1 = [0 1 0;
               0 0 H];
hnutp_in_element = [1
                    2
                    3];
hnutp_per_element = 3;
D1_mat = D_material(E, poisson);  %Material D fylki fyrir elementid
nr_element = 1;
nnodes = nr_element*hnutp_per_element;
N1 = formfallafylki(hnutp_per_element, nr_element, hnutpunktar1);
B1 = diff(N1);

% Finna alagsvigur
disp("a) Alagsvigur");
disp("");


% Finna faerslur
disp("b) Faerslur");
disp("");

% Bradabirgda B
B1 = [1 2 3;
     4 5 6];
 B1 = B1';

k1 = zeros(nnodes*2);
A1 = A_elements(hnutpunktar1);
k1 = t*A1*B1'*D1_mat*B1;
% Rangt k1 - Sja frelsisgradur og staerd fylkis
% Faerslur eru F=KD svo D = K^-1 F svo

% Bradabirgdaalag
bradabirgda_alag = [10 0 5;
                    0 0 0];
alag = bradabirgda_alag;
alag = k1;
D1 = inv(k1).*alag;
disp("Faerslur eru:");
D1

% Daemi 2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp("Daemi 2");
disp("");

% Breytur og fastar
b = 0.03;   % [m] - Breidd
h = 0.02;   % [m] - Haed
t = 0.01;   % [m] - Thickness
hnutpunktar2 = [0 b 0;
                0 0 h];
nodes_per_element2 = 3;


% Lidur a - Finna formfoll og B-fylki fyrir elementid
disp("a) Formfoll og B-fylki");
disp("");
N2 = formfallafylki(nodes_per_element2,1, hnutpunktar2);
N2


% Lidur b - Setja upp jofnuhneppi og finna faerslur i hnutpunktum
disp("b) Jofnuhneppi og faerslur i hnutpunktum");
disp("");


% Lidur c - Finna spennuthaetti
disp("c) Spennuthaettir");
disp("");






% Daemi 3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp("Daemi 3");
disp("");


% Daemi 4
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp("Daemi 4");
disp("");
