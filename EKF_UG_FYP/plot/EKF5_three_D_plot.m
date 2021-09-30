%3D Plot part, plot the X, Xs and Y in different figure
%Author Dijun Liao, Version 5.0

%3D Plot part, all plot in one Figure
figure;
plot3(X_fin(1,:),X_fin(2,:),X_fin(3,:),'-om');
hold on;
plot3(Y_READ(1,2:num_all),Y_READ(2,2:num_all),Y_READ(3,2:num_all),'-*c');
hold on;
grid on;
title_str=['3D plot of flight ',num2str(Y_NO)];
title(title_str);
xlabel('latitude/degree');
ylabel('longitude/degree');
zlabel('Altitude/m');
legend('Real Location using EKF', 'Measure Location','RTS Smoother Location');

%3D Plot part, plot of using EKF
figure;
plot3(X_fin(1,:),X_fin(2,:),X_fin(3,:),'-om');
hold on;
grid on;
title_str=['3D plot of EKF filter of flight',num2str(Y_NO)];
title(title_str);
xlabel('latitude/degree');
ylabel('longitude/degree');
zlabel('Altitude/m');

%3D Plot part, plot of measurment
figure;
plot3(Y_READ(1,2:num_all),Y_READ(2,2:num_all),Y_READ(3,2:num_all),'-*c');
hold on;
grid on;
title_str=['3D plot of measurement of flight',num2str(Y_NO)];
title(title_str);
xlabel('latitude/degree');
ylabel('longitude/degree');
zlabel('Altitude/m');