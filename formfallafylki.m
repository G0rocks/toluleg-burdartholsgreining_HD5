function N = formfallafylki(hnutpkt_per_element,nr_elements, x_coordinates)
%FORMFALLAFYLKI Gerir formfoll fyrir tveggja eda thriggja hnutpunkta
%element i einni vidd (x-stefnu).
%   Fyrir gefinn fjolda hnutpunkta a elementi asamt x-hnitum hnutpunkta. Skilar NaN ef fjoldi hnutpunkta er ekki 2 eda 3.
    syms x;
    if hnutpkt_per_element == 2
        x_coord = zeros(2);
        x_coord(1) = x_coordinates(nr_elements);
        x_coord(2) = x_coordinates(nr_elements+1);
        N_1 = (x-x_coord(2))/(x_coord(1)-x_coord(2));
        N_2 = (x-x_coord(1))/(x_coord(2)-x_coord(1));
        
        N = [N_1 N_2];
    elseif hnutpkt_per_element == 3
        x_coord = zeros(3);
        x_coord(1) = x_coordinates(nr_elements*2-1);
        x_coord(2) = x_coordinates(nr_elements*2);
        x_coord(3) = x_coordinates(nr_elements*2+1);
        N_1 = (x-x_coord(2))/(x_coord(1)-x_coord(2))*(x-x_coord(3))/(x_coord(1)-x_coord(3));
        N_2 = (x-x_coord(1))/(x_coord(2)-x_coord(1))*(x-x_coord(3))/(x_coord(2)-x_coord(3));
        N_3 = (x-x_coord(1))/(x_coord(3)-x_coord(1))*(x-x_coord(2))/(x_coord(3)-x_coord(2));
        
        N = [N_1 N_2 N_3];        
    else
        N = NaN;
    end
end

