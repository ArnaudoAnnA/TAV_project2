close all;
clear all;
clc;

Load_Tyre_Data

% override
% velstart = 150/3.6; % [m/s]

open("Tyre_Pac96_braking.slx")
sim("Tyre_Pac96_braking.slx")