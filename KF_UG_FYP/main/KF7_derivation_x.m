%Solve the derivation of location (get the approximate velocity)
%Author Dijun Liao, Version 5.0

%derivate the three directions
xfx=differentiate(fxx,Y_TIME);
xfy=differentiate(fxy,Y_TIME);
xfz=differentiate(fxz,Y_TIME);
XA_1(2,1:1221)=xfx;
XA_1(4,1:1221)=xfy;
XA_1(6,1:1221)=xfz;