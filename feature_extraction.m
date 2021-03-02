%%This code extract features from kinematics; please follow the example_kinematics.mat file for data preparation
%%Created by Xianghao 03/02/2021

Dir_code = ''; %Please fill in the code directory with: extract_fft.m
Dir_kinematics = ''; %Please fill in the directory of kinematics.

dataset = ''; %Name the output file prefix
file = Dir_kinematics;
cd(Dir_kinematics);
load example_kinematics.mat; %Please prepare a MATLAB data file according to this example and change the name according to your files

SR = round(1/(impact(1).t(10)-impact(1).t(9)));
delta_t =impact(1).t(10)-impact(1).t(9);
[~,num_impact] = size(impact);
feature_matrix  = zeros(num_impact,96);


for id = 1:1:num_impact
    cd(Dir_code);
    vel = impact(id).ang_vel;
    vel_mag = extract_magnitude(impact(id).ang_vel); 

    lin = impact(id).lin_acc_CG;
    lin(isnan(lin))=0;
    lin_mag = extract_magnitude(lin); 
    
    %Angular Velocity features
    feature_matrix(id,1:12) = extract_fft(vel(:,1),SR);
    feature_matrix(id,13:24) = extract_fft(vel(:,2),SR);
    feature_matrix(id,25:36) = extract_fft(vel(:,3),SR);
    feature_matrix(id,37:48) = extract_fft(vel_mag,SR);
    
    %Linear Acceleration features
    feature_matrix(id,49:60) = extract_fft(lin(:,1),SR);
    feature_matrix(id,61:72) = extract_fft(lin(:,2),SR);
    feature_matrix(id,73:84) = extract_fft(lin(:,3),SR);
    feature_matrix(id,85:96) = extract_fft(lin_mag,SR);
end

feature_matrix = round(feature_matrix,4);

save(strcat(dataset,'_class_features_96.mat'),'feature_matrix');