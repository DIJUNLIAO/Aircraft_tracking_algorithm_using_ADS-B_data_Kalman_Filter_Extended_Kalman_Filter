%EKF Main part, the main body of EKF
%Author Dijun Liao, Version 6.0

%Initial value of x
m_km1=Y_READ(1:3,1);

%Sensor initial value
P_0=250;
gama=2;

%Parameters in P matrix
p_mx=10;
p_my=10;
p_mz=10;

%Parameters in R matrix
sigma_lat=4;
sigma_lon=4;
sigma_alt=10;

%Parameters in Q matrix
q_lat=2;
q_lon=2;
q_alt=10;

%P Matrix
P_km1=[p_mx,0,0;
     0,p_my,0;
     0,0,p_mz];

%R Matrix
R=[sigma_lat,0,0;
   0,sigma_lon,0;
   0,0,sigma_alt];

%Main EKF
for mtt=1:num_all-1
    %Sensor information
    sensor_no=cell2mat(Y_POSITION(mtt,6));
    sensor_info=jsondecode(char(Y_POSITION(mtt,7)));
    
    sum=0;
    
    %Flight Position
    p_x=Y_READ(1,n);
    p_y=Y_READ(2,n);
    p_z=Y_READ(3,n);
    
    %Sensor data and RSSI function find
    for sen_number=1:sensor_no
        %Sensor series
        seneor_series=sensor_info(sen_number,1);
        
        %Sensor position
        xs_x=sensor_data(seneor_series,1);
        xs_y=sensor_data(seneor_series,2);
        xs_z=sensor_data(seneor_series,3);
        
        %RSSI function
        un_qulity = [x_x x_y x_z];
        %f = [P_0-10*gama*log10((sqrt((x_x-xs_x)^2+(x_y-xs_y)^2+(x_z-xs_z)^2)))];
        f=[P_0-10*gama*log10(sqrt(((63171000+x_z)^2)+((63171000+xs_z)^2)-2*(6371000+x_z)*(6371000+xs_z)*(cos((x_y/360)*pi)*cos((xs_y/360)*pi)*cos(((x_x-xs_x)/360)*pi)+sin((x_y/360)*pi)*sin((xs_y/360)*pi))))];
        ff = matlabFunction(f);
        
        %Find jacobian matrix of it
        hh(sen_number)=ff(p_x,p_y,p_z);
        H = jacobian(f,un_qulity);
        
        %Transform the form of jacobian matrix
        H1=H(1);
        H2=H(2);
        H3=H(3);
        H_x=matlabFunction(H1);
        H_y=matlabFunction(H2);
        H_z=matlabFunction(H3);
        
        %Find the real value of the jacobian matrix
        H_xv=H_x(p_x,p_y,p_z);
        H_yv=H_y(p_x,p_y,p_z);
        H_zv=H_z(p_x,p_y,p_z);
        HH(mtt,1:3)=[H_xv, H_yv, H_zv];
        
        sum=sum+hh(sen_number);
    end
    
    %Find the value of h
    hf=sum/sen_number;

    %Find A and Q
    T=Y_TIME(mtt+1)-Y_TIME(mtt);
    A=[1,0,0;0,1,0;0,0,1];
    Q=[(T^3/3)*q_lat,0,0;0,(T^3/3)*q_lon,0;0,0,(T^3/3)*q_alt];
    
    %Predict Step
    m_km=Y_READ(1:3,mtt+1);
    P_km=A*P_km1*A'+Q;
    
    %Update Step
    y_k=Y_READ(1:3,mtt+1);
    v_k=y_k-hf;
    S_k=HH(mtt+1)*P_km*HH(mtt+1)'+R;
    K_k=P_km*HH(mtt+1)'*(S_k^-1);
    m_k=m_km+K_k*v_k;
    P_k=P_km-K_k*S_k*K_k';
    
    %Iterate Step
    X_fin(1:3,mtt)=m_k;
    m_km1=m_k;
    P_km1=P_k;
end