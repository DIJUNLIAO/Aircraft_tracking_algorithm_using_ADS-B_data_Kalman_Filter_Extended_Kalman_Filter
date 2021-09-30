# Readme file of KF_UG_FYP

This part use Kalman filter and RTS Smoother to estimate and predict aircraft route according to their GPS data directly.

The following sequences is the sequences to execute this project.

***NOTE:*** For standard KF and RTS Smoother procedure, KF6 and KF9 will no longer execute.

## MAIN FILE:

### KF1_file_insert.m

Insert the aircraft route data.

### KF2_curve_y_poly.m

Using polynomial regression to curve the GPS obtained route (***Y***) and get a function expression.

### KF3_pre_filtter.m

Excluding some points that significant false and have large error. (Set a confident interval according to the regression function above).

### KF4_derivation_y.m

Use the gradient of the regression function above in KF2 to calculate the velocities of aircraft (simulate the velocity data obtained from Pitot tube).

### KF5_KF_main_body.m

Use Kalman Filter to estimate route (***X***).

### KF6_curve_x_poly.m

Using polynomial regression to curve the KF estimated route (***X***) and get a function expression.

### KF7_derivation_x.m

Use the gradient of the regression function above in KF6 to calculate the velocities of aircraft (simulate the velocity data obtained from Pitot tube and after KF).

### KF8_RTS_smoother_body.m

Use RTS Smoother to inverse estimate route (***Xs***).

### KF9_curve_xs_poly.m

Get final exact velocity of aircraft.

## PLOT FILE:

### KF10_plot_all_in_one.m

Plot three routes (GPS obtained route, KF estimated route, RTS modified route) in one figure (just show the latitudes and longitudes).

### KF11_plot_division.m

Plot three routes (GPS obtained route, KF estimated route, RTS modified route) in three figure (just show the latitudes and longitudes).

### KF12_three_D_plot.m

Plot three routes (GPS obtained route, KF estimated route, RTS modified route) in one figure (show the latitudes, longitudes and height).

