%Solve the derivation of location (get the approximate velocity)
%Author Dijun Liao, Version 5.0

%derivate the three directions
yfx=differentiate(fyx,Y_TIME);
yfy=differentiate(fyy,Y_TIME);
yfz=differentiate(fyz,Y_TIME);