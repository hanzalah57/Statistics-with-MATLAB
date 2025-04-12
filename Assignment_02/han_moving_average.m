%Author: Hanzalah Bin Sohail
%BS 7th Geophysics (2020-2024)
%Date: 19 Nov, 2023


% Insert data having two columns i.e, years and annual rainfall
function han_moving_average(d)
data = d(:,2); %Using the second column of the provided data
years = d(:,1);

% 3-Years Moving Average
n = length(data);
size3 = 3 ;
mv3 = zeros(1,n-size3+1);

i=1;
while i<= n-size3+1;
    window = data(i:i+size3-1); %Selecting Window for Average Calculation
    avg = sum(window)./size3;
    mv3(1)= NaN;
    mv3(i+1) = avg;
    i = i+1;
end 
mv3(end+1) = NaN;
disp(mv3');


%5-Years Moving average
size5 = 5 ;
mv5 = zeros(1,n-size5+1);

i=1;
while i<= n-size5+1;
    window = data(i:i+size5-1);
    avg = sum(window)./size5;
    mv5(1:2)=NaN;
    mv5(i+2) = avg;
    i = i+1;
end 
mv5(end+1:end+2) = NaN;
disp(mv5');

%7-Years Moving average
size7 = 7 ;
mv7 = zeros(1,n-size7+1);

i=1;
while i<= n-size7+1;
    window = data(i:i+size7-1);
    avg = sum(window)./size7;
    mv7(1:3)=NaN;
    mv7(i+3) = avg;
    i = i+1;
end 
mv7(end+1:end+3) = NaN;
disp(mv7');


%Data Display in Table Formate
v = [years';data';mv3;mv5;mv7];
m = v';
disp(m);

tbl = array2table(m);
tbl.Properties.VariableNames = {'years','data','mv3','mv5','mv7'};
disp(tbl);

% Creating Subplots of Moving Averages
figure;

%First Plot
subplot(2,2,1);
plot(years,data, 'b','LineWidth',2); 
title('Rainfall-mm');
xlabel('Years');
ylabel('Rainfall');
legend('Rainfall-mm');
grid on;

%Second Plot
subplot(2,2,2);
plot(years,mv3, 'g','LineWidth',2); 
title('3-Years Moving Average');
xlabel('Years');
ylabel('Rainfall');
legend('3-Years Moving Average');
grid on;

%Third Plot
subplot(2,2,3);
plot(years,mv5, 'c','LineWidth',2); 
title('5-Years Moving Average');
xlabel('Years');
ylabel('Rainfall');
legend('5-Years Moving Average');
grid on;

%Fourth Plot
subplot(2,2,4);
plot(years,mv7, 'r','LineWidth',2); 
title('7-Years Moving Average');
xlabel('Years');
ylabel('Rainfall');
legend('7-Years Moving Average');
grid on;

end 