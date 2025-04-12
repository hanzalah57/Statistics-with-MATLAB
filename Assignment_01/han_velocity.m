
%Author: Hanzalah Bin Sohail
%BS 7th Geophysics (2020-2024)
% Date: 5 Nov, 2023

function han_velocity(n)
t1 = zeros(1,n);
for i=1:n;
    s = input('Enter the value of s: ');
    t1(i)=s;
end 
t2 = zeros(1,n);
for i=1:n;
    t = input('Enter the value of t: ');
    t2(i)=t;
end 
v = t1./t2;
m = [t1;t2;v]'
disp(m);
end 