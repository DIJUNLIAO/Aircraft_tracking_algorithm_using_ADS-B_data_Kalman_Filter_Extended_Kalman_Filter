%Curve the location using KF
%Author Dijun Liao, Version 5.0

%Find the coodration of each KF loaction value
X_xx=X(1,1:num_all);
X_xy=X(2,1:num_all);
X_xz=X(3,1:num_all);

%Calculate the regression function of each axis
fxx=fit(Y_TIMET,X_xx',str_XP);
fxy=fit(Y_TIMET,X_xy',str_YP);
fxz=fit(Y_TIMET,X_xz',str_ZP);


%Transfer the x and y into a array for further using
x=1:1:num_all;
F_xx=fxx(x);
F_xy=fxy(x);
F_xz=fxz(x);