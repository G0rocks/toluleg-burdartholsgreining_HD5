disp("HD 5");
disp("");

% Daemi 1 - Plane strain
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp("Daemi 1");
disp("");
H = 10;
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
disp("a)");
disp("");


% Finna faerslur
disp("b)");
disp("");
k1 = zeros(nnodes*2);
A1 = A_elements(hnutpunktar1);
k1 = t*A1*B1'.*D1_mat.*B1;
% Rangt k1 - Sja frelsisgradur og staerd fylkis
% Faerslur eru F=KD svo D = FK^-1 svo
D1 = alag.*inv(k1);
disp("Faerslur eru:");
D1

% Daemi 2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp("Daemi 2");
disp("");


% Daemi 3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp("Daemi 3");
disp("");


% Daemi 4
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp("Daemi 4");
disp("");
