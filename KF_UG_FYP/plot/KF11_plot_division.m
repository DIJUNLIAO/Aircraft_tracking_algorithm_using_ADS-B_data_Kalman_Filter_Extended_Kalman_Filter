%Plot part, plot the X and Y in different figure
%Author Dijun Liao, Version 5.0

%the Longitude and Latitude plot using RTS
figure;
gx = geoaxes;
geoplot(gx, [Xs(1,:)], [Xs(2,:)], '-+y');
hold on;
geoplot(gx,[F_xsx(:,1)],[F_xsy(:,1)],'-r');
title_str=['Longitude and latitude of flight ',num2str(Y_NO),' using RTS Smoother'];
title(title_str);
legend('Location using RTS', 'Fitted curve');
geobasemap(gx, 'grayterrain');

%the Longitude and Latitude plot using KF
figure;
gx = geoaxes;
geoplot(gx, [X(1,:)], [X(2,:)], '-*g');
hold on;
geoplot(gx,[F_xx(:,1)],[F_xy(:,1)],'-r');
title_str=['Longitude and latitude of flight ',num2str(Y_NO),' using Kalman Filter'];
title(title_str);
legend('Location using KF', 'Fitted curve');
geobasemap(gx, 'grayterrain');

%the measurement Longitude and Latitude plot
figure;
gx = geoaxes;
geoplot(gx, [Y(1,:)], [Y(2,:)], '-oc');
hold on;
geoplot(gx,[F_yx(:,1)],[F_yy(:,1)],'-r');
title_str=['Measurement longitude and latitude of flight ',num2str(Y_NO)];
title(title_str);
legend('Measure Location', 'Fitted curve');
geobasemap(gx, 'grayterrain');

%the measurement altitude plot
figure;
plot(fxsz,Y_TIME(1,:),Xs(3,:),'-+y');
title_str=['Altitude of flight ',num2str(Y_NO),' using RTS Smoother'];
title(title_str);
xlabel('time/s');
ylabel('height/m');

%the measurement altitude plot
figure;
plot(fxz,Y_TIME(1,:),X(3,:),'-*g');
title_str=['Altitude of flight ',num2str(Y_NO),' using Kalman Filter'];
title(title_str);
xlabel('time/s');
ylabel('height/m');

%the measurement plot using KF
figure;
plot(fyz,Y_TIME(1,:),Y(3,:),'-oc');
title_str=['Measurement altitudee of flight ',num2str(Y_NO)];
title(title_str);
xlabel('time/s');
ylabel('height/m');