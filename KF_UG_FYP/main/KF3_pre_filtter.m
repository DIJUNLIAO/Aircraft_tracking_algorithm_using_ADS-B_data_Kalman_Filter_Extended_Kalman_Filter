%Pre-filter
%Author Dijun Liao, Version 5.0

% Filter X
% fitting
[px,Sx]=polyfit(Y_TIMET,Y_x1,x_p);
[y_fitx,deltax]=polyval(px,Y_TIMET,Sx);

%Plot the X distrubuation before filt
figure;
plot(Y_TIMET,Y_x1,'b*');
hold on;
plot(Y_TIMET,y_fitx,'r-');
hold on;
plot(Y_TIMET,y_fitx+3*deltax,'m--',Y_TIMET,y_fitx-3*deltax,'m--');
legend('X point plot', 'X Fit','X 99% prediction interval');
title ('Fit of X');

%filtting boundary set
Y_fitx1=y_fitx-3*deltax;
Y_fitx2=y_fitx+3*deltax;
n1=1;
n2=1;

% filtting
for xffp=1:num_all
    y_fitxx=Y_fitx1(xffp);
    y_read=Y_READ(xffp,1);
    y_fitx2=Y_fitx2(xffp);
    
    if (y_fitxx<=y_read)&&(y_read<=y_fitx2)
       Y_READA(n1,1:3)=Y_READ(xffp,1:3);
       Y_TIMEA(n1)=Y_TIMET(xffp);
       n1=n1+1;
    else
       Y_READB(n2,1:3)=Y_READ(xffp,1:3);
       Y_TIMEB(n2)=Y_TIMET(xffp);
       n2=n2+1;
    end
end

% the plot of X distrubuation after filtting
figure;
if n1~=0
    Y_x11=Y_READA(1:n1-1,1);
    plot(Y_TIMEA,Y_x11,'b*');
    hold on;
else
end

if n2~=0
    Y_x12=Y_READB(1:n2-1,1);
    plot(Y_TIMEB,Y_x12,'g*');
    hold on;
else
end

plot(Y_TIMET,y_fitx,'r-');
hold on;
plot(Y_TIMET,y_fitx+3*deltax,'m--',Y_TIMET,y_fitx-3*deltax,'m--');
legend('X point plot', 'X Fit','X 99% prediction interval');
title ('Fit of X after filting');

%  value iteration
num_all=n1-1;
Y_READ=Y_READA;
Y_TIMET=Y_TIMEA;


% Filter Y
% fitting
Y_y1=Y_READ(1:num_all,2);
[py,Sy]=polyfit(Y_TIMET',Y_y1,y_p);
[y_fity,deltay]=polyval(py,Y_TIMET,Sy);

%Plot the Y distrubuation before filt
figure;
plot(Y_TIMET,Y_y1,'b*');
hold on;
plot(Y_TIMET,y_fity,'r-');
hold on;
plot(Y_TIMET,y_fity+3*deltay,'m--',Y_TIMET,y_fity-3*deltay,'m--');
legend('Y point plot', 'Y Fit','Y 99%prediction interval');
title ('Fit of Y');

%filtting boundary set
Y_fity1=y_fity-3*deltay;
Y_fity2=y_fity+3*deltay;
n1=1;
n2=1;

% filtting
for xffpy=1:num_all
    y_fityy=Y_fity1(xffpy);
    y_ready=Y_READ(xffpy,2);
    y_fity2=Y_fity2(xffpy);
    
    if (y_fityy<=y_ready)&&(y_ready<=y_fitx2)
       Y_READC(n1,1:3)=Y_READ(xffpy,1:3);
       Y_TIMEC(n1)=Y_TIMET(xffpy);
       n1=n1+1;
    else
       Y_READD(n2,1:3)=Y_READ(xffpy,1:3);
       Y_TIMED(n2)=Y_TIMET(xffpy);
       n2=n2+1;
    end
end

% the plot of Y distrubuation after filtting
figure;
if n1~=0
    Y_y11=Y_READC(1:n1-1,2);
    plot(Y_TIMEC,Y_y11','b*');
    hold on;
else
end
if n2~=0
    Y_y12=Y_READD(1:n2-1,2);
    plot(Y_TIMED,Y_y12','g*');
    hold on;
else
end

plot(Y_TIMET,y_fity,'r-');
hold on;
plot(Y_TIMET,y_fity+3*deltay,'m--',Y_TIMET,y_fity-3*deltay,'m--');
legend('Y point plot', 'Y Fit','Y 99% prediction interval');
title ('Fit of Y after filting');

%  value iteration
num_all=n1-1;
Y_READ=Y_READC;
Y_TIMET=Y_TIMEC;

% Filter z
% fitting
Y_z1=Y_READ(1:num_all,3);
[pz,Sz]=polyfit(Y_TIMET',Y_z1,z_p);
[y_fitz,deltaz]=polyval(pz,Y_TIMET,Sz);

%Plot the Z distrubuation before filt
figure;
plot(Y_TIMET,Y_z1,'b*');
hold on;
plot(Y_TIMET,y_fitz,'r-');
hold on;
plot(Y_TIMET,y_fitz+3*deltaz,'m--',Y_TIMET,y_fitz-3*deltaz,'m--');
legend('Z point plot', 'Z Fit','Z 99%prediction interval');
title ('Fit of Z');

%filtting boundary set
Y_fitz1=y_fitz-3*deltaz;
Y_fitz2=y_fitz+3*deltaz;
n1=1;
n2=1;

% filtting
for xffpz=1:num_all
    y_fitzz=Y_fitz1(xffpz);
    y_readz=Y_READ(xffpz,3);
    y_fitz2=Y_fitz2(xffpz);
    
    if (y_fitzz<=y_readz)&&(y_readz<=y_fitz2)
       Y_READE(n1,1:3)=Y_READ(xffpz,1:3);
       Y_TIMEE(n1)=Y_TIMET(xffpz);
       n1=n1+1;
    else
       Y_READF(n2,1:3)=Y_READ(xffpz,1:3);
       Y_TIMEF(n2)=Y_TIMET(xffpz);
       n2=n2+1;
    end
end

% the plot of Z distrubuation after filtting
figure;
if n1~=0
    Y_z11=Y_READE(1:n1-1,3);
    plot(Y_TIMEE,Y_z11','b*');
    hold on;
else
end
if n2~=0
    Y_z12=Y_READF(1:n2-1,3);
    plot(Y_TIMEF,Y_z12','g*');
    hold on;
else
end

plot(Y_TIMET,y_fitz,'r-');
hold on;
plot(Y_TIMET,y_fitz+3*deltaz,'m--',Y_TIMET,y_fitz-3*deltaz,'m--');
legend('Z point plot', 'Z Fit','Z 99%prediction interval');
title ('Fit of Z after filting');

%  value iteration
num_all=n1-1;
Y_READ=Y_READE;
Y_TIMET=Y_TIMEE;

%Matrix inverse
Y=Y_READ';
Y_TIME=Y_TIMET;
Y_TIMET=Y_TIME';