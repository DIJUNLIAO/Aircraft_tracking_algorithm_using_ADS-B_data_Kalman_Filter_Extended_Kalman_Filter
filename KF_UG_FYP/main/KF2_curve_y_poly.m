%Curve the measurement location
%Author Dijun Liao, Version 5.0

%Use for finding the parameter (the degree of the polynomial)
%Find the suitable one and input in above
cftool

%Input the parameter for each direction
x_p=input('Please input the parameter in X: ');
str_XP=['poly',num2str(x_p)];
y_p=input('Please input the parameter in Y: ');
str_YP=['poly',num2str(y_p)];
z_p=input('Please input the parameter in Z: ');
str_ZP=['poly',num2str(z_p)];

%Calculate the regression function of each axis
fyx=fit(Y_TIMET,Y_x1,str_XP);
fyy=fit(Y_TIMET,Y_y1,str_YP);
fyz=fit(Y_TIMET,Y_z1,str_ZP);

%Transfer the x and y into a array for further using
x=1:1:num_all;
F_yx=fyx(x);
F_yy=fyy(x);
F_yz=fyz(x);