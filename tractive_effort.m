function [engine_speed, effort] = tractive_effort(w)
% v vel veicolo
% vel ang ruota


eta_t = 0.9;
tau_g = 10.5; % gear ratio

engine_speed = w*tau_g;


peak_pw = 150e3; 
torque_max = 310;


v_base = peak_pw/torque_max; % vel ang motore

if engine_speed > v_base
    effort = peak_pw/engine_speed;
else
    effort = torque_max;
end

end