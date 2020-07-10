clear all
syms  q1t(t) q2t(t) q3t(t) d1 a2 d3 a4 q d a alpha...
      dq1t(t) dq2t(t) dq3t(t)...
      ddq1t(t) ddq2t(t) ddq3t(t)...
      q1 q2 q3 dq1 dq2 dq3 ddq1 ddq2 ddq3
    d1 = 0.2; a2=0.5; a3=0.45; m1=5.14; m2=7.52; m3=4.76; g = 9.81;
    %ma tran thuan nhat tong quat
    T = [cos(q) -sin(q)*cos(alpha) sin(q)*sin(alpha) a*cos(q);
         sin(q) cos(q)*cos(alpha) -cos(q)*sin(alpha) a*sin(q);
         0 sin(alpha) cos(alpha) d;
         0 0 0 1];
    % cac ma tran than nhat cua cac khau theo t
    T01t = subs(T,{q,d,a,alpha},{q1t,d1,0,pi/2});
    T12t = subs(T,{q,d,a,alpha},{q2t,0,a2,0});
    T23t = subs(T,{q,d,a,alpha},{q3t,0,a3,0});
    T02t = simplify(T01t*T12t);
    T03t = simplify(T01t*T12t*T23t);
    % ma tran dinh huong cac khau theo t
    R01t = T01t(1:3,1:3);
    R02t = T02t(1:3,1:3);
    R03t = T03t(1:3,1:3);
    %tao do diem cuoi theo t
    rEt = simplify(T03t(1:3,4));
    % van toc diem cuoi theo t
    vEt = diff(rEt,t);
    vEt = simplify(subs(vEt,{diff(q1t(t),t),diff(q2t(t),t),diff(q3t(t),t)},{dq1t(t),dq2t(t),dq3t(t)}));
    % gia toc diem cuoi theo t
    aEt = diff(vEt,t);
    aEt = simplify(subs(aEt,{diff(q1t(t),t),diff(q2t(t),t),diff(q3t(t),t),...
                            diff(dq1t(t),t),diff(dq2t(t),t),diff(dq3t(t),t)}...
                            ,{dq1t(t),dq2t(t),dq3t(t),ddq1t(t),ddq2t(t),ddq3t(t)}));
    % van toc goc cac diem goc toa do theo t
    omega01t_ = simplify(diff(R01t,t))*transpose(R01t);
    omega01t_ = simplify(subs(omega01t_,{diff(q1t(t),t),diff(q2t(t),t),diff(q3t(t),t)},{dq1t(t),dq2t(t),dq3t(t)}));
    omega02t_ = simplify(diff(R02t,t))*transpose(R02t);
    omega02t_ = simplify(subs(omega02t_,{diff(q1t(t),t),diff(q2t(t),t),diff(q3t(t),t)},{dq1t(t),dq2t(t),dq3t(t)}));
    omega03t_ = simplify(diff(R03t,t))*transpose(R03t);
    omega03t_ = simplify(subs(omega03t_,{diff(q1t(t),t),diff(q2t(t),t),diff(q3t(t),t)},{dq1t(t),dq2t(t),dq3t(t)}));
    % toa do trong tam cac khau trong he toa do goc theo t
    rC1t = T01t*[0;-0.1;-0.02;1];
    rC1t = rC1t(1:3);
    rC2t = T02t*[-0.25;0;-0.01;1];
    rC2t = rC2t(1:3);
    rC3t = simplify(T03t*[-0.25;0;0.03;1]);
    rC3t = rC3t(1:3);
%     %toa do trong tam cac khau trong he toa do goc theo t l?y s?p x?
%     rC1t = T01t*[0;-d1/2;0;1];
%     rC1t = rC1t(1:3);
%     rC2t = T02t*[-a2/2;0;0;1];
%     rC2t = rC2t(1:3);
%     rC3t = simplify(T03t*[-a3/2;0;0;1]);
%     rC3t = rC3t(1:3);
% %     
% %     
% %     
    % tao do diem cuoi theo q
    rE = subs(rEt,{q1t,q2t,q3t},{q1,q2,q3});
    % ma tran jacobi tinh tien tai diem thao tac theo q
    JT = jacobian(rE,[q1,q2,q3])
    % van toc goc cac diem goc toa do theo q
    omega01_ = subs(omega01t_,{q1t,q2t,q3t,dq1t,dq2t,dq3t},{q1,q2,q3,dq1,dq2,dq3});
    omega01 = [omega01_(3,2);omega01_(1,3);omega01_(2,1)];
    omega02_ = subs(omega02t_,{q1t,q2t,q3t,dq1t,dq2t,dq3t},{q1,q2,q3,dq1,dq2,dq3});
    omega02 = [omega02_(3,2);omega02_(1,3);omega02_(2,1)];
    omega03_ = subs(omega03t_,{q1t,q2t,q3t,dq1t,dq2t,dq3t},{q1,q2,q3,dq1,dq2,dq3});
    omega03 = [omega03_(3,2);omega03_(1,3);omega03_(2,1)];
    % ma tran jacobi xoay cac khau theo q
    JR1 = jacobian(omega01,[dq1,dq2,dq3]);
    JR2 = jacobian(omega02,[dq1,dq2,dq3]);
    JR = jacobian(omega03,[dq1,dq2,dq3]);
    % toa do trong tam cac khau trong he toa do goc theo q
    rC1 = subs(rC1t,{q1t,q2t,q3t},{q1,q2,q3});
    rC2 = subs(rC2t,{q1t,q2t,q3t},{q1,q2,q3});
    rC3 = subs(rC3t,{q1t,q2t,q3t},{q1,q2,q3});
    %ma tran jacobi tinh tien cua khoi tam tung khau theo q
    JTC1 = jacobian(rC1,[q1,q2,q3]);
    JTC2 = jacobian(rC2,[q1,q2,q3]);
    JTC3 = jacobian(rC3,[q1,q2,q3]);
    %ma tran xoay ung voi cac khau theo q
    R01 = subs(R01t,{q1t,q2t,q3t},{q1,q2,q3});
    R02 = subs(R02t,{q1t,q2t,q3t},{q1,q2,q3});
    R03 = subs(R03t,{q1t,q2t,q3t},{q1,q2,q3});
    %ma tran quan tinh khoi theo q
    IC1 = [0.09 0 0; 
           0 0.02 0;
           0 0 0.09 ];
    IC2 = [0.03 0 -0.03; 
           0 0.72 0;
           -0.02 0 0.72];
    IC3 = [0.02 0 -0.04;
           0 0.36 0;
           -0.04 0 0.36];
    
    
    
    %Tinh ma tran khoi luong 
    M = transpose(JTC1)*m1*JTC1+transpose(JR1)*R01*IC1*transpose(R01)*JR1+...
        transpose(JTC2)*m2*JTC2+transpose(JR2)*R02*IC2*transpose(R02)*JR2+...
        transpose(JTC3)*m3*JTC3+transpose(JR)*R03*IC3*transpose(R03)*JR;
    M = simplify(M)
    
    %tinh ma tran c 
    q = [q1;q2;q3];
    dq = [dq1;dq2;dq3];
    ddq = [ddq1;ddq2;ddq3];
    c = sym(ones(3,3));
    for i=1:3
        for j=1:3
            for k=1:3
                c(i,j) = simplify(c(i,j) + (1/2)*(diff(M(i,j),q(k))+diff(M(i,k),q(j))-diff(M(j,k),q(i))));
            end
        end
    end
    C = simplify(c)
    
    %Tinh ma tran th? n?ng
    G = [0;
         m2*g*0.5*a2*cos(q2) + m3*g*(0.5*a3*cos(q2+q3) + a2*cos(q2));
         m3*g*0.5*a3*cos(q2+q3)]
    u = M*ddq + C*dq + G;
    
    %ma tran jacobi tinh tien theo t
    JTt = subs(JT,{q1,q2,q3},{q1t,q2t,q3t});
    %dao ham ma tran jacobi tinh tien theo t
    dJTt = diff(JTt,t);
    dJTt = simplify(subs(dJTt,{diff(q1t(t),t),diff(q2t(t),t),diff(q3t(t),t)},{dq1t(t),dq2t(t),dq3t(t)}));
    
    %dao ham ma tran jacobi tinh tien theo viet theo bien q
    dJT = subs(dJTt,{q1t,q2t,q3t,dq1t,dq2t,dq3t},{q1,q2,q3,dq1,dq2,dq3})