%Plot part, plot the X and Y in different figure
%Author Dijun Liao, Version 5.0

%the Longitude and Latitude plot using EKF
figure;
gx = geoaxes;
geoplot(gx, [X_fin(1,:)], [X_fin(2,:)], '-*m');
title_str=['Longitude and latitude of flight ',num2str(Y_NO),' using Extend Kalman Filter'];
title(title_str);
legend('Location using EKF');
geobasemap(gx, 'grayterrain');

%the measurement Longitude and Latitude plot
figure;
gx = geoaxes;
geoplot(gx, [Y_READ(1,2:num_all)], [Y_READ(2,2:num_all)], '-oc');
title_str=['Measurement longitude and latitude of flight ',num2str(Y_NO)];
title(title_str);
legend('Measure Location');
geobasemap(gx, 'grayterrain');

%the measurement altitude plot
figure;
plot(Y_TIME(1,2:num_all),X_fin(3,:),'-*m');
title_str=['Altitude of flight ',num2str(Y_NO),' using Extend Kalman Filter'];
title(title_str);
xlabel('time/s');
ylabel('height/m');

%the measurement plot using KF
figure;
plot(Y_TIME(1,2:num_all),Y_READ(3,2:num_all),'-oc');
title_str=['Measurement altitudee of flight ',num2str(Y_NO)];
title(title_str);
xlabel('time/s');
ylabel('height/m');