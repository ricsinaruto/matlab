sv_1_jmkpqwe20iinyo45dirb1w3p
sv_2_jmkpqwe20iinyo45dirb1w3p
sv_3_jmkpqwe20iinyo45dirb1w3p
sv_4_jmkpqwe20iinyo45dirb1w3p


 

titlu='Kaszkád szabályozás, Ppos=1.5, Pvel=2.3, Ivel=50';
time=time/1000;
plot(time,position);
set(gca, 'fontsize', [12]);
xlabel('Time [sec]');
ylabel('Position [rad]');
title(titlu);
% you can adjust your axis
grid
print -djpeg open_pos


plot(time,velocity);
set(gca, 'fontsize', [12]);
xlabel('Time [sec]');
ylabel('Velocity [rad/s]');
title(titlu);
% you can adjust your axis
grid
print -djpeg open_vel

plot(time,torque);
set(gca, 'fontsize', [12]);
xlabel('Time [sec]');
ylabel('Torque [mNm]');
title(titlu);
% you can adjust your axis
grid
print -djpeg open_tor




 
 


