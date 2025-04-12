
%Author: Hanzalah Bin Sohail
%BS 7th Geophysics (2020-2024)
% Date: 5 Nov, 2023


function han_hist(d);
data=d;

%Calculating class marks 
lower_cl = data(:,1);
upper_cl = data(:,2);
for i=1:length(upper_cl);
midp(i) = (upper_cl(i)+lower_cl(i))/2;
end 
disp(midp);

%Defining Frequency Vector from data 
f_temp = data(:,3);
f = f_temp';
disp(f);

%Defining plot
bar(midp,f,'FaceColor',[0 .5 .5],'EdgeColor',[0 .9 .9],'LineWidth',2)
xlabel('Class Interval');
ylabel('Frequency');
title('Histogram Representation');
grid on;

end 

