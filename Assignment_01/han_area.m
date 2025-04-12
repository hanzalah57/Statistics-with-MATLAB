
%Author: Hanzalah Bin Sohail
%BS 7th Geophysics (2020-2024)
% Date: 5 Nov, 2023

function area = han_area(n);
g = zeros(1,n);
for i=1:n
    g2 = input('Enter value of r: ');
    g(i) = g2;
end 

a = pi*(g.^2);
area1 = [g;a];
area = area1'
end 
    