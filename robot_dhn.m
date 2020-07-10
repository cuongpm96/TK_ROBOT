    %quydao(A,B,0) de chay quy dao bac 2
    %quydao(A,B,1) de chay quy dao hinh thang
    function [q] = robot_dhn(E)
%         [E, vE] = quydao(A,B,type);
        q1 = ones(1,31);
        q2 = ones(1,31);
        q3 = ones(1,31);
        for i = 1:31
            a(1) = 0.1; b(1) = 0.1; c(1) = 0.1;
            f = robot_ptlk(a(1),b(1),c(1),E(1,i),E(2,i),E(3,i));
            k = 1;
            while (norm(f,2)>1.0e-10 && k <100)
                Jq = robot_Jacob(a(1),b(1),c(1));
                w = (Jq)\(-f);
                a(2) = a(1) + w(1);
                b(2) = b(1) + w(2);
                c(2) = c(1) + w(3);
                a(1) = a(2); b(1) = b(2); c(1) = c(2);
                f = robot_ptlk(a(1),b(1),c(1),E(1,i),E(2,i),E(3,i));
                k = k+1;
            end
            q1(i) = a(1); q2(i) = b(1); q3(i) = c(1);
        end

        for i=1:31
            %hieu chinh goc q1
            q1(i)  = hieuchinh(q1(i),E(1,i),E(2,i));
            %hieu chinh goc q2(i)
            %tren quy dao lam sach mat may q2(i) luon o goc phan tu thu 1
            %dua q2(i) ve goc phan tu thu 1 de phu hop voi quy dao
            if q2(i) < 0 
                q2(i) = mod(q2(i),-2*pi);
                %neu q2(i) o goc phan tu thu 1 nhung quay goc lon
                if cos(q2(i)) > 0 && sin(q2(i)) >0
                    q2(i) = q2(i) + 2*pi;
                %neu q2(i) o goc phan tu thu 2
                elseif cos(q2(i)) < 0 && sin(q2(i)) > 0
                    q2(i) = -(q2(i) + pi);
                %neu q2(i) o goc phan tu thu 3
                elseif cos(q2(i)) < 0 && sin(q2(i)) <0
                    q2(i) = q2(i) + pi;
                %neu q2(i) o goc phan tu thu 4
                elseif cos(q2(i)) > 0 && sin(q2(i)) <0
                    q2(i) = -q2(i);
                end
            else
                q2(i) = mod(q2(i),2*pi);
                %neu q2(i) o goc phan tu thu 1
                if cos(q2(i)) > 0 && sin(q2(i)) >0
                    q2(i) = q2(i);
                %neu q2(i) o goc phan tu thu 2
                elseif cos(q2(i)) < 0 && sin(q2(i)) > 0
                    q2(i) = -(q2(i) - pi);
                %neu q2(i) o goc phan tu thu 3
                elseif cos(q2(i)) < 0 && sin(q2(i)) <0
                    q2(i) = q2(i) - pi;
                %neu q2(i) o goc phan tu thu 4
                elseif cos(q2(i)) > 0 && sin(q2(i)) <0
                    q2(i) = 2*pi - q2(i);
                end
            end
            %hieu chinh goc q3(i)
            %tren quy dao lam viec cua may q3(i) luon o goc phan tu thu 4
            %dua q3(i) ve goc phan tu thu 4
            if q3(i) <0
                q3(i) = mod(q3(i),-2*pi);
                if q3(i) < -pi
                    q3(i) = -(2*pi+q3(i));
                end
            else
                q3(i) = mod(q3(i),2*pi);
                if q3(i) > pi
                    q3(i) = -2*pi + q3(i);
                else
                    q3(i) = -q3(i);
                end
            end
        end
        q = [q1; q2; q3];
    end
    
    
    
%     JT11 = ones(1,31); JT12 = ones(1,31); JT13 = ones(1,31);
%     JT21 = ones(1,31); JT22 = ones(1,31); JT23 = ones(1,31);
%     JT31 = ones(1,31); JT32 = ones(1,31); JT33 = ones(1,31);
%     for i = 1:31
%         JT11(i) = -(sin(q1(i))*(9*cos(q2(i) + q3(i)) + 10*cos(q2(i))))/20;
%         JT12(i) = -(cos(q1(i))*(9*sin(q2(i) + q3(i)) + 10*sin(q2(i))))/20;
%         JT13(i) = -(9*sin(q2(i) + q3(i))*cos(q1(i)))/20;
%         JT21(i) = (cos(q1(i))*(9*cos(q2(i) + q3(i)) + 10*cos(q2(i))))/20;
%         JT22(i) = -(sin(q1(i))*(9*sin(q2(i) + q3(i)) + 10*sin(q2(i))))/20;
%         JT23(i) = -(9*sin(q2(i) + q3(i))*sin(q1(i)))/20;
%         JT31(i) = 0;
%         JT32(i) = (9*cos(q2(i) + q3(i)))/20 + cos(q2(i))/2;
%         JT33(i) = (9*cos(q2(i) + q3(i)))/20;
%     end
%     dq = ones(3,31);
%     for i=1:31
%         JT = [JT11(i) JT12(i) JT13(i);
%               JT21(i) JT22(i) JT23(i);
%               JT31(i) JT32(i) JT33(i)];
%         dq(:,i) = JT\vE(:,i);
%     end
%     figure(1)
%     hold on
%     plot(0:0.1:3,dq(1,:))
%     plot(0:0.1:3,dq(2,:))
%     plot(0:0.1:3,dq(3,:))
%     legend('dq1','dq2','dq3')

% % % % % %     q1 = round(a(1),3);
% % % % % %     q2(i) = round(b(1),3);
% % % % % %     q3(i) = round(c(1),3);
% % % % % %     %hieu chinh goc q1
% % % % % %     q1  = hieuchinh(q1,xE,yE);
% % % % % %     %
% % % % % %     %hieu chinh goc q2(i)
% % % % % %     %tren quy dao lam sach mat may q2(i) luon o goc phan tu thu 1
% % % % % %     %dua q2(i) ve goc phan tu thu 1 de phu hop voi quy dao
% % % % % %     if q2(i) < 0 
% % % % % %         q2(i) = mod(q2(i),-2*pi);
% % % % % %         %neu q2(i) o goc phan tu thu 1 nhung quay goc lon
% % % % % %         if cos(q2(i)) > 0 && sin(q2(i)) >0
% % % % % %             q2(i) = q2(i) + 2*pi;
% % % % % %         %neu q2(i) o goc phan tu thu 2
% % % % % %         elseif cos(q2(i)) < 0 && sin(q2(i)) > 0
% % % % % %             q2(i) = -(q2(i) + pi);
% % % % % %         %neu q2(i) o goc phan tu thu 3
% % % % % %         elseif cos(q2(i)) < 0 && sin(q2(i)) <0
% % % % % %             q2(i) = q2(i) + pi;
% % % % % %         %neu q2(i) o goc phan tu thu 4
% % % % % %         elseif cos(q2(i)) > 0 && sin(q2(i)) <0
% % % % % %             q2(i) = -q2(i);
% % % % % %         end
% % % % % %     else
% % % % % %         q2(i) = mod(q2(i),2*pi);
% % % % % %         %neu q2(i) o goc phan tu thu 1
% % % % % %         if cos(q2(i)) > 0 && sin(q2(i)) >0
% % % % % %             q2(i) = q2(i);
% % % % % %         %neu q2(i) o goc phan tu thu 2
% % % % % %         elseif cos(q2(i)) < 0 && sin(q2(i)) > 0
% % % % % %             q2(i) = -(q2(i) - pi);
% % % % % %         %neu q2(i) o goc phan tu thu 3
% % % % % %         elseif cos(q2(i)) < 0 && sin(q2(i)) <0
% % % % % %             q2(i) = q2(i) - pi;
% % % % % %         %neu q2(i) o goc phan tu thu 4
% % % % % %         elseif cos(q2(i)) > 0 && sin(q2(i)) <0
% % % % % %             q2(i) = 2*pi - q2(i);
% % % % % %         end
% % % % % %     end
% % % % % %     % 
% % % % % %     %
% % % % % %     %
% % % % % %     %hieu chinh goc q3(i)
% % % % % %     %tren quy dao lam viec cua may q3(i) luon o goc phan tu thu 4
% % % % % %     %dua q3(i) ve goc phan tu thu 4
% % % % % %     if q3(i) <0
% % % % % %         q3(i) = mod(q3(i),-2*pi);
% % % % % %         if q3(i) < -pi
% % % % % %             q3(i) = -(2*pi+q3(i));
% % % % % %         end
% % % % % %     else
% % % % % %         q3(i) = mod(q3(i),2*pi);
% % % % % %         if q3(i) > pi
% % % % % %             q3(i) = -2*pi + q3(i);
% % % % % %         else
% % % % % %             q3(i) = -q3(i);
% % % % % %         end
% % % % % %     end
% % % % % %     %
% % % % % %     %
% % % % % %     %
% % % % % %     q1
% % % % % %     q2(i)
% % % % % %     q3(i)
% % % % % %     rad2deg(q1)
% % % % % %     rad2deg(q2(i))
% % % % % %     rad2deg(q3(i))
% % % % % % %     q1 = round(a(1),3)
% % % % % % %     q2(i) = round(b(1),3)
% % % % % % %     q3(i) = round(c(1),3)
% % % % % %     %
% % % % % %     %
% % % % % %     %
% % % % % %     %
% % % % % %     %
% % % % % %     x0 = 0; y0 = 0; z0 = 0;
% % % % % %     x1 = 0; y1= 0; z1 = 0.200;  plot3([x0,x1],[y0,y1],[z0,z1],'-o','linewidth',2); hold on;
% % % % % %     xA = round((cos(q1)*cos(q2(i)))/2,3);
% % % % % %     yA = round((cos(q2(i))*sin(q1))/2,3);
% % % % % %     zA = round(sin(q2(i))/2 + 1/5,3);
% % % % % %     xE = round((cos(q1)*(9*cos(q2(i) + q3(i)) + 10*cos(q2(i))))/20,3);
% % % % % %     yE = round((sin(q1)*(9*cos(q2(i) + q3(i)) + 10*cos(q2(i))))/20,3);
% % % % % %     zE = round((9*sin(q2(i) + q3(i)))/20 + sin(q2(i))/2 + 1/5,3);
% % % % % %     x_khau = [x1,xA,xE]; y_khau = [y1,yA,yE]; z_khau = [z1,zA,zE];
% % % % % %     plot3(x_khau,y_khau,z_khau,'-x','linewidth',2);
    

%     % kiem tra nghiem cua dong hoc nguoc     
%     %        
%     %ve duong quy dao mong muon
%     x0 = 0; y0 = 0; z0 = 0;
%     x1 = 0; y1= 0; z1 = 0.200;
%     figure(2)
%     plot3([x0,x1],[y0,y1],[z0,z1],'-o','linewidth',2); 
%     hold on;
%     for i=1:31
%         xA = round((cos(q1(i))*cos(q2(i)))/2,3);
%         yA = round((cos(q2(i))*sin(q1(i)))/2,3);
%         zA = round(sin(q2(i))/2 + 1/5,3);
%         xE = round((cos(q1(i))*(9*cos(q2(i) + q3(i)) + 10*cos(q2(i))))/20,3);
%         yE = round((sin(q1(i))*(9*cos(q2(i) + q3(i)) + 10*cos(q2(i))))/20,3);
%         zE = round((9*sin(q2(i) + q3(i)))/20 + sin(q2(i))/2 + 1/5,3);
%         x_khau = [x1,xA,E(1,i)]; y_khau = [y1,yA,E(2,i)]; z_khau = [z1,zA,E(3,i)];
%         plot3(x_khau,y_khau,z_khau,'-x','linewidth',2);    
%     end