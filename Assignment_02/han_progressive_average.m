%Author: Hanzalah Bin Sohail
%BS 7th Geophysics (2020-2024)
%Date: 19 Nov, 2023


function han_progressive_average(d)
data = d(:,2); %Extracting rainfall column vector
years = d(:,1);

% Calculating Progressive Averages
n = length(data);
pa = zeros(size(data));

sum = 0; %Initializing summation 
for i=1:n;
    sum = sum + data(i); 
    pa(i) = sum/i;
end 
m = [years';data';pa']';
tbl = array2table(m);
disp(tbl);

%Plotting normal and progressive trend
figure;
plot(years,data,'c', 'Linewidth',2)
hold on;
plot(years,pa,'b','Linewidth',2)
xlabel('Years');
ylabel('Rainfall');
title('Rainfall Fluctuation');
legend('Rainfall-mm','Progressive Average Rainfall')
grid on;
hold off;
end 
    