%Author: Hanzalah Bin Sohail
%BS 7th Geophysics (2020-2024)
% Date: 8 Nov, 2023

function han_SPLOG(insert_sp_log_data);
d = insert_sp_log_data;

for i=1:length(d);
    vsh(i) = (min(d) - d(i))./ (max(d) - min(d));
end 

plot(vsh, 'b', 'LInewidth',0.9);
xlabel('Depth');
ylabel('Shale Volume');
title('Calculation of Shale Volume from SPLOG');
grid on;
end 
    
