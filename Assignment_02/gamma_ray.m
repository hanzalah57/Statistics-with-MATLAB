
%Author: Hanzalah Bin Sohail
%BS 7th Geophysics (2020-2024)
% Date: 8 Nov, 2023

function gamma_ray(insert_gamma_ray_log_data);
d = insert_gamma_ray_log_data;

%Gamma Ray Index Calculations
for i=1:length(d);
    GR_index(i) = (d(i) - min(d))./(max(d) - min(d));
end 

% Calculating Shale Volume from an Obtained Gamma Ray index
for i=1:length(GR_index);
    lari_sh(i)=0.083.*(2.^(3.7.*GR_index(i))-1);
    st_sh(i)=GR_index(i)./(3-(2.*GR_index(i)));
    cl_sh(i)=1.7-(3.38-(GR_index(i)+0.7).^2).^(1/2);
    lari2_sh(i)=0.33.*(2.^(2.*GR_index(i))-1);
end 

plot(GR_index,lari_sh, 'k', 'LInewidth',0.8)
grid on;
hold on;
plot(GR_index,st_sh, 'g', 'LInewidth',0.8);
plot(GR_index,cl_sh, 'b', 'LInewidth',0.8);
plot(GR_index,lari2_sh, 'c', 'LInewidth',0.8);

xlabel('Gamma Ray Index');
ylabel('Shale Volume');
title('Calculation of Shale Volume');
legend('Larinov(1969)', 'Steiber(1970)','Clavier(1971)', 'Laronove(1969) for older rocks' ,'Location','northwest');
end 