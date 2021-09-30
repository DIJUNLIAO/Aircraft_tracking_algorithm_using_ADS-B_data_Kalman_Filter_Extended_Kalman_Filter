%EKF file choose and insert
%Author Dijun Liao, Version 6.0

%Appoint the different symbols
syms x_x x_y x_z;

%Choose file
str_in=input('please input the file position:','s');
sensor_data=csvread('F:\FYP\testing data\sensors.csv');

%Measure File length
Y_POSITION=readcell(str_in);
num_all=length(Y_POSITION);             %length of csv file

%file data insert
for n=1:num_all
    Y_TIME(n)=cell2mat(Y_POSITION(n,1));
    Y_READ(1,n)=cell2mat(Y_POSITION(n,3));
    Y_READ(2,n)=cell2mat(Y_POSITION(n,4));
    Y_READ(3,n)=cell2mat(Y_POSITION(n,5));
end

Y_NO=cell2mat(Y_POSITION(1,2));