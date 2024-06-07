
g = 9.81;

peak_pw = 150e3; %Pmax [W]
torque_max = 310;
rpm_max = 16e3;
rps_max = rpm_max/60;

tau_g = 10.5; % gear ratio
tau_d = 0.5;
pt_del = 20e-3;
tau_torque_del = 50e-3;
eta_t = .9; % efficiency of the electric motor and inverter 
            % in traction and generation
mech_eff = .95;
torsional_stiff = 9e3;
batt_cap = 58e3; % [Wh]
batt_V = 800;
f0 = 0.009;
f2 = 6.5e-6;

deadtime = 20e-3;
risetime = 25e-3;

kerb_w = 1812; %vehicle mass
wheelbase = 2.77; % L
cog = .55; % center of gravity height
a = wheelbase/2;
b = wheelbase/2;

FZF_st = kerb_w*g*b/wheelbase;
FZR_st = kerb_w*g*a/wheelbase;


Cx = .27;
Af = 2.36;

wheel_width = 215e-3; % h del cilindro
wheel_prof = 0.5*wheel_width; % dist of internal radius from external radius
rim_size = 19*(2.54e-2);% internal diameter 
wheel_mass = 9.4; %average passenger car mass

wheel_radius = wheel_prof+rim_size/2;

inertia = 1;

max_ang_vel = rpm_max / tau_g * (2*pi/60); % Velocità angolare in rad/s
tyre_circ = 2 * pi * wheel_radius; % Circonferenza in metri
max_lin_vel = max_ang_vel * tyre_circ; % Velocità lineare in m/s
max_lin_vel_kmh = max_lin_vel*3.6; % Velocità lineare in km/h

% Visualizzazione dei risultati
% disp(['Velocità lineare del veicolo: ' num2str(max_lin_vel_kmh) ' km/h']);

v_base = peak_pw/torque_max; % rad/s at the engine

% v = 0:1:(max_lin_vel*2);
% ris = arrayfun(@tractive_effort, v); % calls the function on 
                                     % each element of the array

% v1 = 0:1:v_base+1;
% v2 = v_base-1:1:(max_lin_vel*2);
% 
% p = peak_pw./v2;
% t = torque_max*ones(length(v1), 1);
% 
% hold on
% plot(v1, t)
% plot(v2, p)

%plot(ris)

%xlim([0, max_lin_vel*2]); 
%ylim([50, 600]);

velstart = 0.1;
rho = 1.2;

Je = 10e-4;

me = kerb_w+(Je*tau_g^2*tau_d^2)/wheel_radius^2+ ...
    + 4*inertia/wheel_radius^2;

%%rolling resistance cohefficients:

mu_dry = 0.9; 
mu_wet = 0.6; 

%% achievable range at different constant speeds

vel1 = 50;
vel2 = 100;
vel3 = 150;

p1 = 0.134e5;
p2 = 0.5e5;
p3 = 1.67e5;

s1 = batt_cap/p1*vel1
s2 = batt_cap/p2*vel2
s3 = batt_cap/p3*vel3




