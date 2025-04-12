
%Author: Hanzalah Bin Sohail
%BS 7th Geophysics (2020-2024)
% Date: 5 Nov, 2023


function han_disc
a = input('Enter the value of a: ');
b = input('Enter the value of b: ');
c = input('Enter the value of c: ');

d = (b.^2)-4*a*c;
s = ['Discriminant=',num2str(d)];
disp(s)

if d>0
    disp('Discriminant is positive')
elseif d<0
    disp('Discriminant is negative')
else 
    disp('Discriminant is zero')
end 
    

