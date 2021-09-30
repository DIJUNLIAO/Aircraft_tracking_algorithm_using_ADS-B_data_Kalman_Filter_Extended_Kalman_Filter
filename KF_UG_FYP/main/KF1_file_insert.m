%File insert
%Author Dijun Liao, Version 5.0

%Choose file
str_in=input('please input the file position:','s');

num_all=num_arr;

%Measure File length
Y_FILE=csvread(str_in,0,0);             %length of csv file

%File insert
num_all=num_arr;
Y_READ=csvread(str_in,0,2,[0 2 num_all-1 4]);
Y_TIMET=csvread(str_in,0,0,[0 0 num_all-1 0]);
Y_NO=csvread(str_in,0,1,[0 1 0 1]);

%Find the coodration of each measurement value
Y_x1=Y_READ(1:num_all,1);
Y_y1=Y_READ(1:num_all,2);
Y_z1=Y_READ(1:num_all,3);

%Matrix inverse
Y=Y_READ';
Y_TIME=Y_TIMET';