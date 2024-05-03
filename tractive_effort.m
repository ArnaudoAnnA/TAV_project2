function effort = tractive_effort(v)

peak_pw = 150e3; 
torque_max = 310;

v_base = peak_pw/torque_max;

if v > v_base
    effort = peak_pw/v;
else
    effort = torque_max;
end

end