%3D Plot part, plot the X, Xs and Y in different figure
%Author Dijun Liao, Version 5.0

%3D Plot part, all plot in one Figure
figure;
plot3(X(1,:),X(2,:),X(3,:),'-og');
hold on;
plot3(Y(1,:),Y(2,:),Y(3,:),'-*c');
hold on;
plot3(Xs(1,:),Xs(2,:),Xs(3,:),'-+y');
hold on;
grid on;
title_str=['3D plot of flight ',num2str(Y_NO)];
title(title_str);
xlabel('latitude/degree');
ylabel('longitude/degree');
zlabel('Altitude/m');
legend('Real Location using KF', 'Measure Location','RTS Smoother Location');

%3D Plot part, plot of using KF
figure;
plot3(X(1,:),X(2,:),X(3,:),'-og');
hold on;
grid on;
title_str=['3D plot of KF filter of flight',num2str(Y_NO)];
title(title_str);
xlabel('latitude/degree');
ylabel('longitude/degree');
zlabel('Altitude/m');

%3D Plot part, plot of measurment
figure;
plot3(Y(1,:),Y(2,:),Y(3,:),'-*c');
hold on;
grid on;
title_str=['3D plot of measurement of flight',num2str(Y_NO)];
title(title_str);
xlabel('latitude/degree');
ylabel('longitude/degree');
zlabel('Altitude/m');

%3D Plot part, plot of RTS Smoother
figure;
plot3(Xs(1,:),Xs(2,:),Xs(3,:),'-+y');
hold on;
grid on;
title_str=['3D plot of usung RTS Smoother of flight ',num2str(Y_NO)];
title(title_str);
xlabel('latitude/degree');
ylabel('longitude/degree');
zlabel('Altitude/m');