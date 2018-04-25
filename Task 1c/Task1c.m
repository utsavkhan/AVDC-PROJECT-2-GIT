%% model-based estimator

clear Cf
clear Cr

Cf = 81000;
Cr = 90000;

% clear beta_integration
% clear beta_washout
% clear beta_modelbased            

new_ay_VBOX = [Time ay_VBOX];
new_yawRate_VBOX = [Time yawRate_VBOX];
new_vx_VBOX = [Time vx_VBOX];
new_SWA_VBOX = [Time SWA_VBOX];

for T = 0.01:0.01:1
    
    sim('TasksSimulink')
        
    [e_beta_mean,e_beta_max,time_at_max,error] = errorCalc(beta_washout.Data,Beta_VBOX);
    disp(' ');
    fprintf('The MSE of Beta estimation is: %d \n',e_beta_mean);
    fprintf('The Max error of Beta estimation is: %d \n',e_beta_max);
        
    plot(beta_washout.Time,beta_washout.Data,'-.');
    hold on
        
end

plot(Time,Beta_VBOX);

