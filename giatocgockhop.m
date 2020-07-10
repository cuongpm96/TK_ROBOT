function [ddq] = giatocgockhop(aE,dq,q)
    q1 = q(1,:); q2 = q(2,:); q3 = q(3,:);
    dq1 = dq(1,:); dq2 = dq(2,:); dq3 = dq(3,:);
    JT11 = ones(1,31); JT12 = ones(1,31); JT13 = ones(1,31);
    JT21 = ones(1,31); JT22 = ones(1,31); JT23 = ones(1,31);
    JT31 = ones(1,31); JT32 = ones(1,31); JT33 = ones(1,31);
    
    dJT11 = ones(1,31); dJT12 = ones(1,31); dJT13 = ones(1,31);
    dJT21 = ones(1,31); dJT22 = ones(1,31); dJT23 = ones(1,31);
    dJT31 = ones(1,31); dJT32 = ones(1,31); dJT33 = ones(1,31);
    for i = 1:31
        JT11(i) = -(sin(q1(i))*(9*cos(q2(i) + q3(i)) + 10*cos(q2(i))))/20;
        JT12(i) = -(cos(q1(i))*(9*sin(q2(i) + q3(i)) + 10*sin(q2(i))))/20;
        JT13(i) = -(9*sin(q2(i) + q3(i))*cos(q1(i)))/20;
        JT21(i) = (cos(q1(i))*(9*cos(q2(i) + q3(i)) + 10*cos(q2(i))))/20;
        JT22(i) = -(sin(q1(i))*(9*sin(q2(i) + q3(i)) + 10*sin(q2(i))))/20;
        JT23(i) = -(9*sin(q2(i) + q3(i))*sin(q1(i)))/20;
        JT31(i) = 0;
        JT32(i) = (9*cos(q2(i) + q3(i)))/20 + cos(q2(i))/2;
        JT33(i) = (9*cos(q2(i) + q3(i)))/20;
        dJT11(i) = (sin(q1(i))*(9*sin(q2(i) + q3(i))*(dq2(i) + dq3(i)) + 10*dq2(i)*sin(q2(i))))/20 - (dq1(i)*cos(q1(i))*(9*cos(q2(i) + q3(i)) + 10*cos(q2(i))))/20;
        dJT12(i) = (dq1(i)*sin(q1(i))*(9*sin(q2(i) + q3(i)) + 10*sin(q2(i))))/20 - (cos(q1(i))*(9*cos(q2(i) + q3(i))*(dq2(i) + dq3(i)) + 10*dq2(i)*cos(q2(i))))/20;
        dJT13(i) = (9*dq1(i)*sin(q2(i) + q3(i))*sin(q1(i)))/20 - (9*cos(q2(i) + q3(i))*cos(q1(i))*(dq2(i) + dq3(i)))/20;
        dJT21(i) = -(cos(q1(i))*(9*sin(q2(i) + q3(i))*(dq2(i) + dq3(i)) + 10*dq2(i)*sin(q2(i))))/20 - (dq1(i)*sin(q1(i))*(9*cos(q2(i) + q3(i)) + 10*cos(q2(i))))/20;
        dJT22(i) = -(sin(q1(i))*(9*cos(q2(i) + q3(i))*(dq2(i) + dq3(i)) + 10*dq2(i)*cos(q2(i))))/20 - (dq1(i)*cos(q1(i))*(9*sin(q2(i) + q3(i)) + 10*sin(q2(i))))/20;
        dJT23(i) = -(9*cos(q2(i) + q3(i))*sin(q1(i))*(dq2(i) + dq3(i)))/20 - (9*dq1(i)*sin(q2(i) + q3(i))*cos(q1(i)))/20;
        dJT31(i) = 0;
        dJT32(i) =  -(9*sin(q2(i) + q3(i))*(dq2(i) + dq3(i)))/20 - (dq2(i)*sin(q2(i)))/2;
        dJT33(i) = -(9*sin(q2(i) + q3(i))*(dq2(i) + dq3(i)))/20;
    end
    ddq = ones(3,31);
    for i=1:31
        JT = [JT11(i) JT12(i) JT13(i);
              JT21(i) JT22(i) JT23(i);
              JT31(i) JT32(i) JT33(i)];
        dJT = [dJT11(i) dJT12(i) dJT13(i);
               dJT21(i) dJT22(i) dJT23(i);
               dJT31(i) dJT32(i) dJT33(i)];
        ddq(:,i) = JT\(aE(:,i) - dJT*dq(:,i));
    end
end