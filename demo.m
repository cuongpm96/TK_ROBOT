clear all 
%A,B la diem dau va cuoi cua quy dao
A = [0.4;0;0.2];
B = [0.75;0;0.2];
%quydao(A,B,0) de chay quy dao bac 3
%quydao(A,B,1) de chay quy dao hinh thang
[E,vE,aE] = quydao(A,B,0);
q = robot_dhn(E);
dq = vantockhop(q,vE)
ddq = giatocgockhop(aE,dq,q);
u = momenkhop(ddq,dq,q)

% kiem tra nghiem cua dong hoc nguoc     
%        
%ve duong quy dao mong muon
q1 = q(1,:); q2 = q(2,:); q3 = q(3,:);
x0 = 0; y0 = 0; z0 = 0;
x1 = 0; y1= 0; z1 = 0.200;
figure(1)
plot3([x0,x1],[y0,y1],[z0,z1],'-o','linewidth',2); 
hold on;
for i=1:31
    xA = round((cos(q1(i))*cos(q2(i)))/2,3);
    yA = round((cos(q2(i))*sin(q1(i)))/2,3);
    zA = round(sin(q2(i))/2 + 1/5,3);
    xE = round((cos(q1(i))*(9*cos(q2(i) + q3(i)) + 10*cos(q2(i))))/20,3);
    yE = round((sin(q1(i))*(9*cos(q2(i) + q3(i)) + 10*cos(q2(i))))/20,3);
    zE = round((9*sin(q2(i) + q3(i)))/20 + sin(q2(i))/2 + 1/5,3);
    x_khau = [x1,xA,E(1,i)]; y_khau = [y1,yA,E(2,i)]; z_khau = [z1,zA,E(3,i)];
    plot3(x_khau,y_khau,z_khau,'-x','linewidth',2);    
end


figure(2)
hold on
plot(0:0.1:3,dq(1,:))
plot(0:0.1:3,dq(2,:))
plot(0:0.1:3,dq(3,:))
legend('dq1','dq2','dq3')


figure(3)
hold on
plot(0:0.1:3,u(1,:))
plot(0:0.1:3,u(2,:))
plot(0:0.1:3,u(3,:))
legend('u1','u2','u3')

