%Main body of RTS Smooth
%Author Dijun Liao, Version 5.0

%Data in Ms_f matrix of flight
ms_xf=X(1,num_all);
ms_yf=X(2,num_all);
ms_zf=X(3,num_all);
vs_xf=xfx(num_all);
vs_yf=xfy(num_all);
vs_zf=xfz(num_all);

%Loading data in Ms_f and Ps_f
Ms_f=[ms_xf;vs_xf;ms_yf;vs_yf;ms_zf;vs_zf];
Ps_f=[p_mx0,0,0,0,0,0;
     0,p_vx0,0,0,0,0;
     0,0,p_my0,0,0,0;
     0,0,0,p_vy0,0,0;
     0,0,0,0,p_mz0,0;
     0,0,0,0,0,p_vz0];

%Initialize M and P
M_k=Ms_f;
P_k=Ps_f;

%RTS Smoother and iteration
for mbi=num_all-1:-1:1
	T=Y_TIME(mbi+1)-Y_TIME(mbi);
    A=[1,T,0,0,0,0;0,1,0,0,0,0;0,0,1,T,0,0;0,0,0,1,0,0;0,0,0,0,1,T;0,0,0,0,0,1];
    Q=[(T^3/3)*q_lat,(T^2/2)*q_lat,0,0,0,0;(T^2/2)*q_lat,T*q_lat,0,0,0,0;0,0,(T^3/3)*q_lon,(T^2/2)*q_lon,0,0;0,0,(T^2/2)*q_lon,T*q_lon,0,0;0,0,0,0,(T^3/3)*q_alt,(T^2/2)*q_alt;0,0,0,0,(T^2/2)*q_alt,T*q_alt];
    
    %Data Import Step
    M_ksp1=XA_1(1:6,mbi);
	P_ksp1=PP(1:6,(6*(mbi-1)+1):(6*(mbi-1)+6));
	
    %Backward Recursion Step
    M_kp1m=A*M_k;
    P_kp1m=A*P_k*A'+Q;
	G_k=P_k*A'*P_kp1m^-1;
	M_ks=M_k+G_k*((M_ksp1)-(M_kp1m));
	P_ks=P_k+G_k*((P_ksp1)-(P_kp1m))*G_k';

    %Data saving Step
	Xs(1:3,mbi)=[M_ks(1);M_ks(3);M_ks(5)];

	%Iteration Step
    M_k=M_ks;
	P_k=P_ks;
end
Xs(1:3,num_all)=[Ms_f(1);Ms_f(3);Ms_f(5)];