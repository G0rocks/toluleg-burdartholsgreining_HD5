disp("HD 5");
disp("");

% Daemi 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp("Daemi 1");
disp("");
H = 10;
hnutpunktar1 = [0 1 0;
               0 0 H];
hnutp_per_element = 3;
nr_element = 1;
N1 = formfallafylki(hnutp_per_element, nr_element, hnutpunktar1);
B1 = diff(N1);

% Finna alagsvigur
disp("a)");
disp("");
p1 = alag(hnutpunktar1)
% setja inn fyrir p
% setja a = 0


%{
% Finna faerslur
disp("b)");
disp("");

lausn1 = leysa_skifu(hnutpunktar1)



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

}%
