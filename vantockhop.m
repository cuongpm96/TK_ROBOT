function [dq] = vantockhop(q,vE)
    q1 = q(1,:);
    q2 = q(2,:);
    q3 = q(3,:);
    JT11 = ones(1,31); JT12 = ones(1,31); JT13 = ones(1,31);
    JT21 = ones(1,31); JT22 = ones(1,31); JT23 = ones(1,31);
    JT31 = ones(1,31); JT32 = ones(1,31); JT33 = ones(1,31);
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
    end
    dq = ones(3,31);
    for i=1:31
        JT = [JT11(i) JT12(i) JT13(i);
              JT21(i) JT22(i) JT23(i);
              JT31(i) JT32(i) JT33(i)];
        dq(:,i) = JT\vE(:,i);
    end
end