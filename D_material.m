function D_mat = D_material(E, poisson)
%D_material Makes the D_material array for a skifuelement

D_mat = (E/((1+poisson)*(1-2*poisson)))*[(1-poisson) poisson 0;
                 poisson (1-poisson) 0;
                 0 0 ((1-2*poisson)/2)];
end

