function B = geraB(N)
%geraB Byr til B fykid ut fra gefnu N fylki fyrir 1 thriggja hnutpunkta
%skifuelement.
    symvars = symvar(N)
    x = symvars(1);
    y = symvars(2);
    B = sym('B', [3 6]);
    B(1,1) = diff(N(1,1),x);
    B(2,1) = 0;
    B(3,1) = diff(N(1,1),y);
    B(1,2) = 0;
    B(2,2) = diff(N(1,1),y);
    B(3,2) = diff(N(1,1),x);
    B(1,3) = diff(N(1,3),x);
    B(2,3) = 0;
    B(3,3) = diff(N(1,3),y);
    B(1,4) = 0;
    B(2,4) = diff(N(1,3),y);
    B(3,4) = diff(N(1,3),x);
    B(1,5) = diff(N(1,5),x);
    B(2,5) = 0;
    B(3,5) = diff(N(1,5),y);
    B(1,6) = 0;
    B(2,6) = diff(N(1,5),y);
    B(3,6) = diff(N(1,5),x);
end

