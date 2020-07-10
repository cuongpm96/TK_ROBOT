function [E,vE,aE] = quydao(A,B,type)
    syms t;
    if type == 0 
        L = norm(A-B);
        %cac thong so cua quy dao bac 3
        ti = 0;
        tf = 3;
        qi = 0;
        qf = L;
        dqi = 0;
        dqf = 0;
        %tinh cac he so trong quy dao bac 3
        a0 = qi;
        a1 = dqi;
        a2 = (3*(qf-qi)-(2*dqi+dqf)*(tf-ti))/(tf-ti)^2;
        a3 = (2*(qi-qf)+(dqf+dqi)*(tf-ti))/(tf-ti)^3;
        %phuong trinh quy dao bac 3
        st = a3*t.^3 + a2*t.^2 + a1*t + a0;
        dst = 3*a3*t.^2 + 2*a2*t + a1;
        ddst = 6*a3*t + 2*a2;
        %cac diem tren quy dao
        t1 = 0:0.1:3;
        E = A + (B-A)/qf*st;
        vE = (B-A)/qf*dst;
        aE = (B-A)/qf*ddst;
        E = subs(E,t,t1);
        vE = subs(vE,t,t1);
        aE = subs(aE,t,t1);
    else
        L = norm(A-B);
        %các thông so cua quy dao
        vmax = 0.16; % don vi mm/s
        ta = 0.5; 
        ti = 0;
        tf = 3;
        qi = 0;
        qf = L; % don vi mm
        
        t1 = 0:0.1:0.5;
        t2 = 0.6:0.1:2.4;
        t3 = 2.5:0.1:3;
        %phuong trinh quy dao 
        q1 = qi + (vmax/(2*ta))*((t-ti)^2);
        q2 = qi + vmax*(t-ti-ta/2);
        q3 = qf - (vmax/(2*ta))*(tf-t)^2;
        %phuong trinnh van toc
        dq1 = (vmax/ta)*t;
        dq2 = vmax;
        dq3 = vmax*tf/ta - (vmax/ta)*t;
        ddq1 = vmax/ta;
        ddq2 = 0;
        ddq3 = -(vmax/ta);
%         dq1 = subs(dq1,t1);
%         dq2 = subs(dq2,t2);
%         dq3 = subs(dq3,t3);
%         dq = [dq1 dq2 dq3];
%         plot([t1 t2 t3],dq)
        %diem tren doan tang toc
        E1 = A + (B-A)/qf*q1;
        %diem tren doan toc do deu
        E2 = A + (B-A)/qf*q2;
        %diem tren doan giam toc
        E3 = A + (B-A)/qf*q3;
        %van toc
        vE1 = (B-A)/qf*dq1;
        vE2 = (B-A)/qf*dq2;
        vE3 = (B-A)/qf*dq3;
        aE1 = (B-A)/qf*ddq1;
        aE2 = (B-A)/qf*ddq2;
        aE3 = (B-A)/qf*ddq3;        
        E1 = subs(E1,t1);
        E2 = subs(E2,t2);
        E3 = subs(E3,t3);
        vE1 = subs(vE1,t1);
        vE2 = subs(vE2,t2);
        vE3 = subs(vE3,t3);
        aE1 = subs(aE1,t1);
        aE2 = subs(aE2,t2);
        aE3 = subs(aE3,t3);        
        E = [E1 E2 E3];
%         figure(1)
%         plot3(E(1,:),E(2,:),E(3,:))
        vE = [vE1 vE2 vE3];
        aE = [aE1 aE2 aE3];
    end
end

% xE = subs(E(1),t,0:0.1:3);
% yE = subs(E(2),t,0:0.1:3);
% zE = subs(E(3),t,0:0.1:3);
% 
% st = subs(st,t,0:0.1:3);
% dst = subs(dst,t,0:0.1:3);
% t = 0:0.1:3;
% plot(t,st) % do th? qu? ??o ?i?m cu?i theo ???ng b?c 3 theo th?i gian
% figure(2)
% plot(t,dst) % do th? v?n t?c c?a qu? ??o ?i?m cu?i
% figure(3)
% plot3(xE,yE,zE) % ?? th? các t?a ?? ?i?m cu?i trên qu? ??o 

% %
% %
% %
% % quy dao hinh thang
% clear all
% syms t
% A = [0;0;400]; B = [400; 0; 400]; L = norm(A-B);
% %các thông s? c?a qu? ??o
% vmax = 160; % don vi mm/s
% ta = 0.5; 
% ti = 0;
% tf = 3;
% qi = 0;
% qf = L; % don vi mm
% 
% q1 = qi + (vmax/(2*ta))*((t-ti)^2);
% q2 = qi + vmax*(t-ti-ta/2);
% q3 = qf - (vmax/(2*ta))*(tf-t)^2;
% dq1 = (vmax/ta)*t;
% dq2 = vmax;
% dq3 = vmax*tf/ta - (vmax/ta)*t;
% 
% E1 = A + (B-A)/qf*q1;
% E2 = A + (B-A)/qf*q2;
% E3 = A + (B-A)/qf*q3;
% 
% 
% t1=ti:0.01:ta;
% t2=ta:0.01:tf-ta;
% t3=tf-ta:0.01:tf;
% q1 = subs(q1,t,t1);
% q2 = subs(q2,t,t2);
% q3 = subs(q3,t,t3);
% dq1 = subs(dq1,t,t1);
% dq2 = subs(dq2,t,t2);
% dq3 = subs(dq3,t,t3);
% xE1 = subs(E1(1),t,t1);
% yE1 = subs(E1(2),t,t1);
% zE1 = subs(E1(3),t,t1);
% xE2 = subs(E2(1),t,t2);
% yE2 = subs(E2(2),t,t2);
% zE2 = subs(E2(3),t,t2);
% xE3 = subs(E3(1),t,t3);
% yE3 = subs(E3(2),t,t3);
% zE3 = subs(E3(3),t,t3);
% figure(4)
% plot(t1,q1,t2,q2,t3,q3); %?? th? ??uòng qu? ??o theo v?n t?c hình thag
% figure(5)
% plot(t1,dq1,t2,dq2,t3,dq3); % ?? th? v?n t?c hình thang
% figure(6)
% %?? th? các ?i?m cu?i trên qu? ??o theo v?n t?c hình thang
% hold on
% plot3(xE1,yE1,zE1)
% plot3(xE2,yE2,zE2)
% plot3(xE3,yE3,zE3)


% subplot(2,2,1)
% plot(t1,q1)
% subplot(2,2,2)
% plot(t2,q2)
% subplot(2,2,3)
% plot(t3,q3)

