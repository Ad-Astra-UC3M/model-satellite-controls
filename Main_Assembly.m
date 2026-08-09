% Simscape(TM) Multibody(TM) version: 26.1%%%%% Do not add code to this file. Do not edit the physical units shown in comments.

%%%VariableName:smiData

%============= RigidTransform%
%Initialize the RigidTransform structure array by filling in null values.
smiData.RigidTransform(9).translation = [0.0 0.0 0.0];
smiData.RigidTransform(9).angle = 0.0;
smiData.RigidTransform(9).axis = [0.0 0.0 0.0];
smiData.RigidTransform(9).ID = "";

%%Rotation Method - Arbitrary Axis
smiData.RigidTransform(1).translation = [0 251.79545454544723 0];  % mm
smiData.RigidTransform(1).angle = 2.0943951023931953;  % rad
smiData.RigidTransform(1).axis = [0.57735026918962584 -0.57735026918962584 0.57735026918962584];
smiData.RigidTransform(1).ID = "B[Container-1:-:SIGMA_Solid-1]";

%%Rotation Method - Arbitrary Axis
smiData.RigidTransform(2).translation = [0 253.2674873595393 0];  % mm
smiData.RigidTransform(2).angle = 2.0943951023931957;  % rad
smiData.RigidTransform(2).axis = [0.57735026918962584 -0.57735026918962584 0.57735026918962562];
smiData.RigidTransform(2).ID = "F[Container-1:-:SIGMA_Solid-1]";

%%Rotation Method - Arbitrary Axis
smiData.RigidTransform(3).translation = [-64.967594611256033 92.999999999999986 0];  % mm
smiData.RigidTransform(3).angle = 3.1415926535897931;  % rad
smiData.RigidTransform(3).axis = [1 0 0];
smiData.RigidTransform(3).ID = "B[SIGMA_Solid-1:-:Motor_arm-2]";

%%Rotation Method - Arbitrary Axis
smiData.RigidTransform(4).translation = [100.35584509455511 -48.840584643010061 247.65874233046446];  % mm
smiData.RigidTransform(4).angle = 3.1415926535897931;  % rad
smiData.RigidTransform(4).axis = [0.99800256994819869 0 0.06317333596376512];
smiData.RigidTransform(4).ID = "F[SIGMA_Solid-1:-:Motor_arm-2]";

%%Rotation Method - Arbitrary Axis
smiData.RigidTransform(5).translation = [16.161616161616156 -148.83698670078456 80.00000000000108];  % mm
smiData.RigidTransform(5).angle = 0.12643086207676249;  % rad
smiData.RigidTransform(5).axis = [0 -1 0];
smiData.RigidTransform(5).ID = "RootGround[SIGMA_Solid-1]";

%%Rotation Method - Arbitrary Axis
smiData.RigidTransform(6).translation = [16.161616161616156 -147.36495388669249 80.00000000000108];  % mm
smiData.RigidTransform(6).angle = 0;  % rad
smiData.RigidTransform(6).axis = [0 0 0];
smiData.RigidTransform(6).ID = "RootGround[Container-1]";

%%Rotation Method - Arbitrary Axis
smiData.RigidTransform(7).translation = [-239.68916974765631 -6.9964020577745201 244.8048852082423];  % mm
smiData.RigidTransform(7).angle = 1.5707963267949003;  % rad
smiData.RigidTransform(7).axis = [0 1 0];
smiData.RigidTransform(7).ID = "SixDofRigidTransform[Motor_arm-9]";

%%Rotation Method - Arbitrary Axis
smiData.RigidTransform(8).translation = [272.0124020708875 -6.9964020577745201 -84.804885208241927];  % mm
smiData.RigidTransform(8).angle = 1.5707963267948861;  % rad
smiData.RigidTransform(8).axis = [0 -1 0];
smiData.RigidTransform(8).ID = "SixDofRigidTransform[Motor_arm-11]";

%%Rotation Method - Arbitrary Axis
smiData.RigidTransform(9).translation = [180.96650136985826 -6.9964020577745201 335.85078590927299];  % mm
smiData.RigidTransform(9).angle = 3.1415926535897865;  % rad
smiData.RigidTransform(9).axis = [-0 -1 -0];
smiData.RigidTransform(9).ID = "SixDofRigidTransform[Motor_arm-10]";

%============= Solid%
%%%Product of Inertia (PoI)
%Initialize the Solid structure array by filling in null values.
smiData.Solid(3).mass = 0.0;
smiData.Solid(3).CoM = [0.0 0.0 0.0];
smiData.Solid(3).MoI = [0.0 0.0 0.0];
smiData.Solid(3).PoI = [0.0 0.0 0.0];
smiData.Solid(3).color = [0.0 0.0 0.0];
smiData.Solid(3).opacity = 0.0;
smiData.Solid(3).ID = "";

%%Visual Properties - Simple
smiData.Solid(1).mass = 4.5540556609776903;  % kg
smiData.Solid(1).CoM = [-2.6786026129813002e-05 154.05749210724173 4.9762005205062925e-09];  % mm
smiData.Solid(1).MoI = [35704.60400094802 12367.513660613537 35704.604002242311];  % kg*mm^2
smiData.Solid(1).PoI = [-1.964418597020426e-06 2.3690244048358481e-07 -0.0056319589436265886];  % kg*mm^2
smiData.Solid(1).color = [0.61960784313725492 0.40784313725490196 0.20000000000000001];
smiData.Solid(1).opacity = 1;
smiData.Solid(1).ID = "SIGMA_Solid*:*Predeterminado";

%%Visual Properties - Simple
smiData.Solid(2).mass = 0.57163344383532866;  % kg
smiData.Solid(2).CoM = [0 182.72306476070315 0];  % mm
smiData.Solid(2).MoI = [7010.3773324543308 3106.4393475354236 7010.3773324543308];  % kg*mm^2
smiData.Solid(2).PoI = [0 0 0];  % kg*mm^2
smiData.Solid(2).color = [0.59019607843137256 0.57098039215686269 0.52705882352941169];
smiData.Solid(2).opacity = 1;
smiData.Solid(2).ID = "Container*:*Predeterminado";

%%Visual Properties - Simple
smiData.Solid(3).mass = 0.060318707849162788;  % kg
smiData.Solid(3).CoM = [101.18300427133019 32.523793162354458 247.76387684875206];  % mm
smiData.Solid(3).MoI = [153.43490435938182 5.1257311981067062 152.55420881335505];  % kg*mm^2
smiData.Solid(3).PoI = [-0.40990327649050545 0.11378507758470856 -3.2248978199841178];  % kg*mm^2
smiData.Solid(3).color = [0.89411764705882346 0.89411764705882346 0.89411764705882346];
smiData.Solid(3).opacity = 1;
smiData.Solid(3).ID = "Motor_arm*:*Predeterminado";

%============= Joint%
%%%%%%%%%%Position Target (Pos)
%Initialize the CylindricalJoint structure array by filling in null values.
smiData.CylindricalJoint(1).Rz.Pos = 0.0;
smiData.CylindricalJoint(1).Pz.Pos = 0.0;
smiData.CylindricalJoint(1).ID = "";

smiData.CylindricalJoint(1).Rz.Pos = 7.2439547971991072;  % deg
smiData.CylindricalJoint(1).Pz.Pos = 0;  % mm
smiData.CylindricalJoint(1).ID = "[Container-1:-:SIGMA_Solid-1]";

%Initialize the RevoluteJoint structure array by filling in null values.
smiData.RevoluteJoint(1).Rz.Pos = 0.0;
smiData.RevoluteJoint(1).ID = "";

smiData.RevoluteJoint(1).Rz.Pos = 1.5902773407317574e-15;  % deg
smiData.RevoluteJoint(1).ID = "[SIGMA_Solid-1:-:Motor_arm-2]";

