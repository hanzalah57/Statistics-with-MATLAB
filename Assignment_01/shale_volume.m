
%Author: Hanzalah Bin Sohail
%BS 7th Geophysics (2020-2024)
% Date: 5 Nov, 2023

function shale_volume(GR_index);

for i=1:length(GR_index);
    lari_sh(i)=0.083.*(2.^(3.7.*GR_index(i))-1);
    st_sh(i)=GR_index(i)./(3-(2.*GR_index(i)));
    cl_sh(i)=1.7-(3.38-(GR_index(i)+0.7).^2).^(1/2);
    lari2_sh(i)=0.33.*(2.^(2.*GR_index(i))-1);
end 

plot(GR_index,lari_sh, 'o-', 'LInewidth',2)
grid on;
hold on;
plot(GR_index,st_sh, 's-', 'LInewidth',2);
plot(GR_index,cl_sh, '-*', 'LInewidth',2);
plot(GR_index,lari2_sh, '-p', 'LInewidth',2);

xlabel('Gamma Ray Index');
ylabel('Shale Volume');
title('Calculation of Shale Volume');
legend('Larinov(1969)', 'Steiber(1970)','Clavier(1971)', 'Laronove(1969) for older rocks' ,'Location','northwest');
end 