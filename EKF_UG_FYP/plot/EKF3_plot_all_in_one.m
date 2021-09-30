%EKF Plot part, plot the X and Y in one Figure
%Author Dijun Liao, Version 6.0

%the Longitude and Latitude plot
figure;
gx = geoaxes;
geoplot(gx, [Y_READ(1,:)], [Y_READ(2,:)], '-oc');
hold on;
geoplot(gx, [X_fin(1,:)], [X_fin(2,:)], '-*m');
title_str=['longitude and latitude of flight ',num2str(Y_NO)];
title(title_str);
legend('Measure Location', 'Real Location using EK');
geobasemap(gx, 'grayterrain');

%the Altitude plot
figure;
x=Y_TIME(1):1:num_all;
plot(Y_TIME(1,2:num_all),Y_READ(3,2:num_all),'-oc');
hold on;
plot(Y_TIME(1,2:num_all),X_fin(3,:),'-*m');

title_str=['Altitude of flight ',num2str(Y_NO)];
title(title_str);
legend('Measure Location', 'Real Location using EKF');
xlabel('time/s');
ylabel('height/m');