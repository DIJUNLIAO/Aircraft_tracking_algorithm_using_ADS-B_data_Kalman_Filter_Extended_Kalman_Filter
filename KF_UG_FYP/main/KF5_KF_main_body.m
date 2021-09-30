%Main body of Kalman Filter
%Author Dijun Liao, Version 5.0

%Initialization 
X=[];                               %the real location matrix using KF

%Data in M_0 matrix of flight
m_x0=Y(1,1);                                        %Location (lat, lon, geoalt)
m_y0=Y(2,1);
m_z0=Y(3,1);
v_x0=yfx(1);                                        %Velocity in each direction 
v_y0=yfy(1);
v_z0=yfz(1);

%Data in P_0 matrix of flight
p_mx0=10;
p_vx0=0.2;
p_my0=10;
p_vy0=0.2;
p_mz0=10;
p_vz0=10;

%Loading data in M_0 and P_0
M_0=[m_x0;v_x0;m_y0;v_y0;m_z0;v_z0];
P_0=[p_mx0,0,0,0,0,0;
     0,p_vx0,0,0,0,0;
     0,0,p_my0,0,0,0;
     0,0,0,p_vy0,0,0;
     0,0,0,0,p_mz0,0;
     0,0,0,0,0,p_vz0];

%Parameters in R matrix
sigma_lat=4;
sigma_lon=4;
sigma_alt=10;

%Parameters in Q matrix
q_lat=2;
q_lon=2;
q_alt=10;

%Matrix A, H, R and Q


H=[1,0,0,0,0,0;
   0,0,1,0,0,0;
   0,0,0,0,1,0];

R=[sigma_lat,0,0;
   0,sigma_lon,0;
   0,0,sigma_alt];



%Initialize M and P
M_mp1=M_0;
P_mp1=P_0;

%Kalman Filter and iteration
for mxi=2:num_all
	T=Y_TIME(mxi)-Y_TIME(mxi-1);
    A=[1,T,0,0,0,0;0,1,0,0,0,0;0,0,1,T,0,0;0,0,0,1,0,0;0,0,0,0,1,T;0,0,0,0,0,1];
    Q=[(T^3/3)*q_lat,(T^2/2)*q_lat,0,0,0,0;(T^2/2)*q_lat,T*q_lat,0,0,0,0;0,0,(T^3/3)*q_lon,(T^2/2)*q_lon,0,0;0,0,(T^2/2)*q_lon,T*q_lon,0,0;0,0,0,0,(T^3/3)*q_alt,(T^2/2)*q_alt;0,0,0,0,(T^2/2)*q_alt,T*q_alt];
    %Prediction Step
    M_kpm=A*(M_mp1);
	P_kpm=A*(P_mp1)*(A^-1)+Q;

	%Upload Step
    S=H*(P_kpm)*H'+R;
	K=(P_kpm)*H'*(S^-1);
	Y_k=Y(1:3,mxi);
    M_k=M_kpm+K*(Y_k-H*M_kpm);
    P_k=P_kpm-K*S*K';
   	
	%Data saving Step
    X(1:3,mxi)=[M_k(1);M_k(3);M_k(5)];
    XA(1:6,mxi)=M_k;
    PP(1:6,6*(mxi-1)+1:6*(mxi-1)+6)=P_k;
    
    %Iteration Step
   	M_mp1=M_k;
	P_mp1=P_k;
end
X(1:3,1)=[M_0(1);M_0(3);M_0(5)];
XA(1:6,1)=M_0;
PP(1:6,1:6)=P_0;