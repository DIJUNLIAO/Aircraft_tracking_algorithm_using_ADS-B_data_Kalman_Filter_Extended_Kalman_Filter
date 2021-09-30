%Plot part, plot the X, Xs and Y in one Figure
%Author Dijun Liao, Version 5.0

%the Longitude and Latitude plot
figure;
gx = geoaxes;
geoplot(gx, [Y(1,:)], [Y(2,:)], '-oc');
hold on;
geoplot(gx, [X(1,:)], [X(2,:)], '-*g');
hold on;
geoplot(gx, [Xs(1,:)], [Xs(2,:)], '-+y');
title_str=['longitude and latitude of flight ',num2str(Y_NO)];
title(title_str);
legend('Real Location using KF', 'Measure Location','RTS Smoother Location');
geobasemap(gx, 'grayterrain');

%the Altitude plot
figure;
x=Y_TIME(1):1:num_all;
plot(Y_TIME(1,:),Y(3,:),'-oc');
hold on;
plot(Y_TIME(1,:),X(3,:),'-*g');
hold on;
plot(Y_TIME(1,:),Xs(3,:),'-+y');

title_str=['Altitude of flight ',num2str(Y_NO)];
title(title_str);
legend('Real Location using KF', 'Measure Location','RTS Smoother Location');
xlabel('time/s');
ylabel('height/m');