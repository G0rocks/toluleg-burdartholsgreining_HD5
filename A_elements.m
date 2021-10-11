function A = A_elements(hnit)
%A_elements Skilar flatarmali 3 hnutpunkta skifuelementi fyrir gefin hnit a
%ollum hnutpunktum
    x_i = hnit(1,1);
    y_i = hnit(2,1);
    x_j = hnit(1,2);
    y_j = hnit(2,2);
    x_m = hnit(1,3);
    y_m = hnit(2,3);
    
    A = x_i*(y_j-y_m)+x_j*(y_m-y_i)+x_m*(y_i-y_j);
    A = A/2;
end

