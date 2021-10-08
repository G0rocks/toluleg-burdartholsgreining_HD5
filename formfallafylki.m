function N = formfallafylki(hnutpkt_per_element,nr_elements, coordinates)
%FORMFALLAFYLKI Gerir formfoll fyrir tveggja eda thriggja hnutpunkta
%element i tveimur viddum (x-stefnu og y-stefnu).
%   Fyrir gefinn fjolda hnutpunkta a elementi asamt hnitum hnutpunkta. Skilar NaN ef fjoldi hnutpunkta er ekki 2 eda 3.

    % Athuga hvort vid hofum fjolda hnutpunkta per element sem vid getum
    % hondlad
    N = NaN;
    if (hnutpkt_per_element ~= 2 && hnutpkt_per_element ~= 3)
        disp("No formfall for u my friend");
        N = NaN;
        return
    end

    % Symbolic variables
    syms x;
    syms y;

    % Get dimensions, initialize N
    [viddir, nnodes] = size(coordinates);
    N = sym('N', [viddir viddir*hnutpkt_per_element]);
    
    % Ef adeins 1 vidd (x-stefna)
    if viddir == 1
        if hnutpkt_per_element == 2
            x_coord = zeros(2);
            x_coord(1) = coordinates(nr_elements);
            x_coord(2) = coordinates(nr_elements+1);
            N_1 = (x-x_coord(2))/(x_coord(1)-x_coord(2));
            N_2 = (x-x_coord(1))/(x_coord(2)-x_coord(1));

            N = [N_1 N_2];
            return;
        end
        if hnutpkt_per_element == 3
            x_coord = zeros(3);
            x_coord(1) = coordinates(nr_elements*2-1);
            x_coord(2) = coordinates(nr_elements*2);
            x_coord(3) = coordinates(nr_elements*2+1);
            N_1 = (x-x_coord(2))/(x_coord(1)-x_coord(2))*(x-x_coord(3))/(x_coord(1)-x_coord(3));
            N_2 = (x-x_coord(1))/(x_coord(2)-x_coord(1))*(x-x_coord(3))/(x_coord(2)-x_coord(3));
            N_3 = (x-x_coord(1))/(x_coord(3)-x_coord(1))*(x-x_coord(2))/(x_coord(3)-x_coord(2));

            N = [N_1 N_2 N_3];
            return;
        end % if hnutpkt_per_element
    end % if viddir == 1
    
    % Ef 2 viddir (x og y stefnur)
    if viddir == 2
        i = 1;
        j = 2;
        m = 3;
        x_coord = coordinates(1,:);   % Oll x-hnit
        y_coord = coordinates(2,:);   % Oll y-hnit

        % 2 hnutpkt_per_element
        if hnutpkt_per_element == 2
            %Ma koda sidar
            disp("Formfallafylki fyrir 2 vidda element med 2 hnutpunktum per element hefur ekki verid forritad. Vinsamlegast forritadu thatd. Takk :)");
            N = NaN;
            return;
        end
        
        % 3 hnutpkt_per_element
        if hnutpkt_per_element == 3
            
            % Gera alpha, beta og gamma
            alpha = zeros(1,3);
            beta = alpha;
            gamma = beta;
            for index = 0:2
                i = index+1;
                j = mod(index+1,3)+1;
                m = mod(index+2,3)+1;
                alpha(i) = x_coord(j)*y_coord(m)-y_coord(j)*x_coord(m)
                beta(i) = y_coord(j)-y_coord(m)
                gamma(i) = x_coord(m)-x_coord(j)
            end % for
            
            % Finna tvofalt flatarmal
            A_times_2 = x_coord(i)*(y_coord(j)-y_coord(m)) + x_coord(j)*(y_coord(m)-y_coord(i)) + x_coord(m)*(y_coord(i)-y_coord(j));
            
            % Utbua formfoll
            syms Ni;
            syms Nj;
            syms Nm;
            syms x;
            syms y;
            Nm = (alpha(i)+beta(i)*x+gamma(i)*y)/A_times_2
            Ni = (alpha(j)+beta(j)*x+gamma(j)*y)/A_times_2
            Nj = (alpha(m)+beta(m)*x+gamma(m)*y)/A_times_2

            % Rada i formfallafylki
            %{
            This is a failed attempt
            for row = 1:size(N,1)
                for col = 1:size(N,2)
                    if mod(row+col,2) == 0
                        if col < 3
                            N(i,j) = Ni;
                        elseif col < 5
                            N(i,j) = Nj;
                        else
                            N(i,j) = Nm;
                        end % if col <
                    end % if mod(row+col,2)
                end % for col
            end % for row
            return;
        end
            %}
            N(1,1) = Ni;
            N(2,1) = 0;
            N(1,2) = 0;
            N(2,2) = Ni;
            N(1,3) = Nj;
            N(2,3) = 0;
            N(1,4) = 0;
            N(2,4) = Nj;
            N(1,5) = Nm;
            N(2,5) = 0;
            N(1,6) = 0;
            N(2,6) = Nm;
            
            
        
    end % if viddir == 2
end

