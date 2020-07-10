function Jq = robot_Jacob(q1,q2,q3)
    Jq = [ -(sin(q1)*(9*cos(q2 + q3) + 10*cos(q2)))/20, -(cos(q1)*(9*sin(q2 + q3) + 10*sin(q2)))/20, -(9*sin(q2 + q3)*cos(q1))/20;
           (cos(q1)*(9*cos(q2 + q3) + 10*cos(q2)))/20, -(sin(q1)*(9*sin(q2 + q3) + 10*sin(q2)))/20, -(9*sin(q2 + q3)*sin(q1))/20;
                                                   0,             (9*cos(q2 + q3))/20 + cos(q2)/2,          (9*cos(q2 + q3))/20];
end