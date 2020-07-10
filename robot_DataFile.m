% Simscape(TM) Multibody(TM) version: 6.0

% This is a model data file derived from a Simscape Multibody Import XML file using the smimport function.
% The data in this file sets the block parameter values in an imported Simscape Multibody model.
% For more information on this file, see the smimport function help page in the Simscape Multibody documentation.
% You can modify numerical values, but avoid any other changes to this file.
% Do not add code to this file. Do not edit the physical units shown in comments.

%%%VariableName:smiData


%============= RigidTransform =============%

%Initialize the RigidTransform structure array by filling in null values.
smiData.RigidTransform(7).translation = [0.0 0.0 0.0];
smiData.RigidTransform(7).angle = 0.0;
smiData.RigidTransform(7).axis = [0.0 0.0 0.0];
smiData.RigidTransform(7).ID = '';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(1).translation = [-3.3306690738754696e-16 -7.1054273576010019e-15 2.7755575615628914e-16];  % m
smiData.RigidTransform(1).angle = 7.0888285813937224e-13;  % rad
smiData.RigidTransform(1).axis = [0.99999254326149067 -0.0038617899238181396 -1.3687681327428618e-15];
smiData.RigidTransform(1).ID = 'B[khau2_new-1:-:khau3_new-1]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(2).translation = [-0.39999999999999963 6.6613381477509392e-16 -1.5543122344752192e-15];  % m
smiData.RigidTransform(2).angle = 1.0274777545416818e-15;  % rad
smiData.RigidTransform(2).axis = [-0.99376402848875067 0.11150361286437979 -5.692652110837487e-17];
smiData.RigidTransform(2).ID = 'F[khau2_new-1:-:khau3_new-1]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(3).translation = [0 0 5.0959236830294736e-14];  % m
smiData.RigidTransform(3).angle = 7.7965411904301628e-13;  % rad
smiData.RigidTransform(3).axis = [1 0 0];
smiData.RigidTransform(3).ID = 'B[khau1-1:-:khau2_new-1]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(4).translation = [-0.50000000000000022 7.2164496600635175e-15 -0.019999999999998463];  % m
smiData.RigidTransform(4).angle = 7.0759881788691605e-13;  % rad
smiData.RigidTransform(4).axis = [0.99999910441618978 -0.0013383448054031207 -4.7350517705022105e-16];
smiData.RigidTransform(4).ID = 'F[khau1-1:-:khau2_new-1]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(5).translation = [0 0 0];  % m
smiData.RigidTransform(5).angle = 0;  % rad
smiData.RigidTransform(5).axis = [0 0 0];
smiData.RigidTransform(5).ID = 'B[khau_de-1:-:khau1-1]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(6).translation = [3.1607132322627641e-17 -0.20000000000000009 -1.0497158697830855e-13];  % m
smiData.RigidTransform(6).angle = 2.0943951023927454;  % rad
smiData.RigidTransform(6).axis = [-0.57735026918947574 -0.57735026918947574 -0.57735026918992582];
smiData.RigidTransform(6).ID = 'F[khau_de-1:-:khau1-1]';

%Translation Method - Cartesian
%Rotation Method - Arbitrary Axis
smiData.RigidTransform(7).translation = [0 0 0];  % m
smiData.RigidTransform(7).angle = 0;  % rad
smiData.RigidTransform(7).axis = [0 0 0];
smiData.RigidTransform(7).ID = 'RootGround[khau_de-1]';


%============= Solid =============%
%Center of Mass (CoM) %Moments of Inertia (MoI) %Product of Inertia (PoI)

%Initialize the Solid structure array by filling in null values.
smiData.Solid(4).mass = 0.0;
smiData.Solid(4).CoM = [0.0 0.0 0.0];
smiData.Solid(4).MoI = [0.0 0.0 0.0];
smiData.Solid(4).PoI = [0.0 0.0 0.0];
smiData.Solid(4).color = [0.0 0.0 0.0];
smiData.Solid(4).opacity = 0.0;
smiData.Solid(4).ID = '';

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(1).mass = 6.2863268998331767;  % kg
smiData.Solid(1).CoM = [0 0 -0.099947526236881565];  % m
smiData.Solid(1).MoI = [0.036686637761267064 0.036686637761267057 0.031416083615530624];  % kg*m^2
smiData.Solid(1).PoI = [0 0 0];  % kg*m^2
smiData.Solid(1).color = [0.792156862745098 0.81960784313725488 0.93333333333333335];
smiData.Solid(1).opacity = 1;
smiData.Solid(1).ID = 'khau_de*:*Default';

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(2).mass = 5.1411133540166265;  % kg
smiData.Solid(2).CoM = [-7.9919508993160139e-08 -0.099940009356660531 -0.018031722195724912];  % m
smiData.Solid(2).MoI = [0.039029449490219546 0.022584075326031964 0.037738988656437267];  % kg*m^2
smiData.Solid(2).PoI = [0.0073313877824806176 -3.742643915238325e-08 5.4894081528123075e-08];  % kg*m^2
smiData.Solid(2).color = [0.72941176470588232 0.35686274509803922 0.023529411764705882];
smiData.Solid(2).opacity = 1;
smiData.Solid(2).ID = 'khau1*:*Default';

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(3).mass = 4.7614149436475737;  % kg
smiData.Solid(3).CoM = [-0.24622708484605141 0 0.029471435197420539];  % m
smiData.Solid(3).MoI = [0.011251249973278208 0.071301435024578724 0.07458491580531762];  % kg*m^2
smiData.Solid(3).PoI = [0 0.0073050047474241065 0];  % kg*m^2
smiData.Solid(3).color = [0 0.75294117647058822 0.75294117647058822];
smiData.Solid(3).opacity = 1;
smiData.Solid(3).ID = 'khau3_new*:*Default';

%Inertia Type - Custom
%Visual Properties - Simple
smiData.Solid(4).mass = 7.5167989374524842;  % kg
smiData.Solid(4).CoM = [-0.24999999999999994 0 -0.0099999999999998007];  % m
smiData.Solid(4).MoI = [0.026002404109561495 0.24807161167256947 0.24534671251906981];  % kg*m^2
smiData.Solid(4).PoI = [1.9301710771609667e-15 0.041186520103144442 -2.9198440280928932e-14];  % kg*m^2
smiData.Solid(4).color = [0.50196078431372548 1 0.50196078431372548];
smiData.Solid(4).opacity = 1;
smiData.Solid(4).ID = 'khau2_new*:*Default';


%============= Joint =============%
%X Revolute Primitive (Rx) %Y Revolute Primitive (Ry) %Z Revolute Primitive (Rz)
%X Prismatic Primitive (Px) %Y Prismatic Primitive (Py) %Z Prismatic Primitive (Pz) %Spherical Primitive (S)
%Constant Velocity Primitive (CV) %Lead Screw Primitive (LS)
%Position Target (Pos)

%Initialize the RevoluteJoint structure array by filling in null values.
smiData.RevoluteJoint(3).Rz.Pos = 0.0;
smiData.RevoluteJoint(3).ID = '';

smiData.RevoluteJoint(1).Rz.Pos = -140.2496847337386;  % deg
smiData.RevoluteJoint(1).ID = '[khau2_new-1:-:khau3_new-1]';

smiData.RevoluteJoint(2).Rz.Pos = 48.196087967229495;  % deg
smiData.RevoluteJoint(2).ID = '[khau1-1:-:khau2_new-1]';

smiData.RevoluteJoint(3).Rz.Pos = -48.017171824822931;  % deg
smiData.RevoluteJoint(3).ID = '[khau_de-1:-:khau1-1]';

