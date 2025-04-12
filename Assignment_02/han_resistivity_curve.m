%Author: Hanzalah Bin Sohail
%BS 7th Geophysics (2020-2024)
% Date: 5 Nov, 2023


% Mode of Acquisition: Vertical Electrical Sounding (VES)
% Survey Design: Wenner Array 
% Requirements: Insert data having meaured potential difference (V),
% Current and Electrode spacing in meters. 

function han_resistivity_curve(d);
data = d;
a = data(:,1); %Electrode Spacing
V = data(:,2);
I = data(:,3);

%Calculating geometric factor
i = 1;
while i <= length(a);
    g(i) = 2*pi*a(i);
    i=i+1;
end 

%Calculating Apparent Resistivity
i=1;
while i<=length(V);
    pa(i) = g(i)*(V(i)./I(i));
    i = i+1;
end 

%Data Display in table format 
m = [a';V';I';g;pa]';
tbl = array2table(m);
disp(tbl);

%Generating Apparent Resistivity Curve
figure;
plot(a,pa,'k-o', 'Linewidth',3)
set(gca, 'XScale', 'log', 'YScale', 'log');
xlabel('Electrode Spacing (a=AB/3)');
ylabel('Apparent Resistivity');
title('Wenner Sounding');
legend('Apparent Resistivity Curve');
grid on; 
end 
