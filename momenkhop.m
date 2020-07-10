function [u] = momenkhop(ddq,dq,q)
    q2 = q(2,:); q3 = q(3,:);
    m11 = ones(1,31); m12 = ones(1,31); m13 = ones(1,31);
    m21 = ones(1,31); m22 = ones(1,31); m23 = ones(1,31);
    m31 = ones(1,31); m32 = ones(1,31); m33 = ones(1,31);
    
    c11 =ones(1,31); c12 =ones(1,31); c13 =ones(1,31);
    c21 =ones(1,31); c22 =ones(1,31); c23 =ones(1,31);
    c31 =ones(1,31); c32 =ones(1,31); c33 =ones(1,31);
    
    g1 = ones(1,31); g2 = ones(1,31); g3 = ones(1,31); 
    for i=1:31
        m11(i) = (119*cos(2*q2(i) + q3(i)))/250 + (47*cos(2*q2(i)))/40 + (663*cos(2*q2(i) + 2*q3(i)))/2500 + (119*cos(q3(i)))/250 + 379323/250000;
        m12(i) = -(857*sin(q2(i) + q3(i)))/12500 - (413*sin(q2(i)))/5000;
        m13(i) = -(857*sin(q2(i) + q3(i)))/12500;
        m21(i) =  -(857*sin(q2(i) + q3(i)))/12500 - (363*sin(q2(i)))/5000;
        m22(i) = (119*cos(q3(i)))/125 + 3663/1250;
        m23(i) = (119*cos(q3(i)))/250 + 344/625;
        m31(i) = -(857*sin(q2(i) + q3(i)))/12500;
        m32(i) = (119*cos(q3(i)))/250 + 344/625;
        m33(i) = 344/625;
        g1(i) = 0;
        g2(i) = 7.52*9.81*0.5*0.5*cos(q2(i)) + 4.76*9.81*(0.5*0.45*cos(q2(i)+q3(i)) + 0.5*cos(q2(i)));
        g3(i) = 4.76*9.81*0.5*0.45*cos(q2(i)+q3(i));
        c11(i) = 1 - (47*sin(2*q2(i)))/40 - (663*sin(2*q2(i) + 2*q3(i)))/1250 - (119*sin(q3(i)))/500 - (357*sin(2*q2(i) + q3(i)))/500;
        c12(i) = 1 - (47*sin(2*q2(i)))/40 - (663*sin(2*q2(i) + 2*q3(i)))/2500 - (857*cos(q2(i) + q3(i)))/6250 - (413*cos(q2(i)))/5000 - (119*sin(2*q2(i) + q3(i)))/250;
        c13(i) = 1 - (663*sin(2*q2(i) + 2*q3(i)))/2500 - (857*cos(q2(i) + q3(i)))/6250 - (119*sin(q3(i)))/500 - (119*sin(2*q2(i) + q3(i)))/500;
        c21(i) = (119*sin(2*q2(i) + q3(i)))/250 + (47*sin(2*q2(i)))/40 + (663*sin(2*q2(i) + 2*q3(i)))/2500 + cos(q2(i))/200 + 1;
        c22(i) = 1 - (119*sin(q3(i)))/250;
        c23(i) = 1 - (119*sin(q3(i)))/125;
        c31(i) = (119*sin(2*q2(i) + q3(i)))/500 + (663*sin(2*q2(i) + 2*q3(i)))/2500 + (119*sin(q3(i)))/500 + 1;
        c32(i) = (119*sin(q3(i)))/250 + 1;
        c33(i) = 1;
    end
    u = ones(3,31);
    for i=1:31
        M = [m11(i) m12(i)  m13(i);
             m21(i) m22(i) m23(i);
             m31(i) m32(i) m33(i)];
        C = [c11(i) c12(i)  c13(i);
             c21(i) c22(i) c23(i);
             c31(i) c32(i) c33(i)];
        G = [g1(i); g2(i); g3(i)];
        u(:,i) = M*ddq(:,i) + C*dq(:,i) + G;
    end
end