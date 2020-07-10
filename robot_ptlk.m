function f = robot_ptlk(q1,q2,q3,xE,yE,zE)
f1 = (cos(q1)*(9*cos(q2 + q3) + 10*cos(q2)))/20 - xE;
f2 = (sin(q1)*(9*cos(q2 + q3) + 10*cos(q2)))/20 - yE;
f3 = (9*sin(q2 + q3))/20 + sin(q2)/2 + 1/5 - zE;
f = [f1;f2;f3];
end