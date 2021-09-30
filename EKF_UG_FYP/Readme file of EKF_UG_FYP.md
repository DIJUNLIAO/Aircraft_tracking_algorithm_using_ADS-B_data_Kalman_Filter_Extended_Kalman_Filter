# Readme file of EKF_UG_FYP

This part use Extended Kalman filter to estimate and predict aircraft route according to secondary radar's RSSI data.

The following sequences is the sequences to execute this project.

***NOTE:*** For standard EKF procedure, a velocity is required, but here we simplified EKF matrices and can ignore it.

## MAIN FILE:

### EKF1_file_choose_and_insert.m

Insert the aircraft route data.

### EKF2_main_body.m

Use Extended Kalman Filter to estimate route (***X***).

## PLOT FILE:

### EKF3_plot_all_in_one.m

Plot three routes (GPS obtained route, KF estimated route, RTS modified route) in one figure (just show the latitudes and longitudes).

### EKF4_plot_division.m

Plot three routes (GPS obtained route, KF estimated route, RTS modified route) in three figure (just show the latitudes and longitudes).

### EKF5_three_D_plot.m

Plot three routes (GPS obtained route, KF estimated route, RTS modified route) in one figure (show the latitudes, longitudes and height).

