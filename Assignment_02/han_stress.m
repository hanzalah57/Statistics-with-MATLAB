%Author: Hanzalah Bin Sohail
%BS 7th Geophysics (2020-2024)
%Date: 10th Nov, 2023

function han_stress(insert_stress_magnitude,insert_angle_range);

mag = insert_stress_magnitude;
angle = insert_angle_range;

temp_1 = zeros(1,angle);
temp_2 = zeros(1,angle);
temp_3 = zeros(1,angle);
temp_4 = zeros(1,angle);

for i=1:angle;
   n_stress = mag.*(sin(deg2rad(i))) ;
   temp_1(i) = n_stress;
   s_stress = mag.*(cos(deg2rad(i)));
   temp_2(i) = s_stress;
   temp_3(i) = mag;
   temp_4(i) = i;
end 

stress_magnitude = temp_3;
angles = temp_4;
shear_stress = temp_2;
normal_stress = temp_1; 

m = [stress_magnitude;angles;shear_stress;normal_stress]'
disp(m);

figure;
subplot(2,1,1);
plot(angles,shear_stress,'c','Linewidth',3)
xlabel('Angles');
ylabel('Shear Stress');
title('Shear Stress Variation with angle')
legend('Shear Stress Curve');
grid on;
subplot(2,1,2);
plot(angles,normal_stress,'r','Linewidth',3)
xlabel('Angles');
ylabel('Normal Stress');
title('Normal Stress Variation with angle')
legend('Normal Stress Curve');
grid on;
end 



