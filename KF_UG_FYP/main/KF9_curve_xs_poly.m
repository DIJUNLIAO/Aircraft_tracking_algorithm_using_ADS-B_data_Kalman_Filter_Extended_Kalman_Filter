%Curve the location using KF
%Author Dijun Liao, Version 5.0

%Find the coodration of each RTS loaction value
X_xsx=Xs(1,1:num_all);
X_xsy=Xs(2,1:num_all);
X_xsz=Xs(3,1:num_all);

%Calculate the regression function of each axis
fxsx=fit(Y_TIMET,X_xsx',str_XP);
fxsy=fit(Y_TIMET,X_xsy',str_YP);
fxsz=fit(Y_TIMET,X_xsz',str_ZP);


%Transfer the x and y into a array for further using
x=1:1:num_all;
F_xsx=fxsx(x);
F_xsy=fxsy(x);
F_xsz=fxsz(x);