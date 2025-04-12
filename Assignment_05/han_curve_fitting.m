%Author: Hanzalah Bin Sohail
%Roll no. 04112013014
%BS 7th Geophysics (2020-2024)
%Date: 6th Jan, 2024

function han_curve_fitting(X,Y)

%Logarithmic transformation of data 
n = length(X);
V = log10(X);
VS = sum(V);
VM = mean(V);

U = log10(Y);
US = sum(U);
UM = mean(U);


%Calculating slope (b)
for i=1:n
    UV(i) = U(i).*V(i);
end 
b1 = sum(UV) - (n*VM*UM);
b2 = sum(V.^2) - (n.*(VM.^2));
b = b1./b2;
fprintf('\n Slope (b) = %5.4f\n',b)

%Calculating intercept (a) loga=c == a = antilog(c)
c = UM - (b*VM);
a = 10^c; %Antilog of c
fprintf('\n Intercept (a) = %5.4f\n',a)

%Fitted curve
for i=1:n
    y(i) = (a).*(X(i).^(b));
end 

%Generating table 
tbl = table(X,Y,V,U,UV',y');
tbl.Properties.VariableNames = {'X','Y','V','U','UV','Fitted_Curve'};
disp(tbl); 

%Generating plot 
figure
hold on 
scatter(X,Y,'b','filled','Marker','o','SizeData',75)
plot(X,y,'Color',[0.8500 0.3250 0.0980],'Linewidth',2)
xlabel('X')
ylabel('Y')
title('Curve Fitting')
legend('Data Points','Fitted curve')
set(gca,'YScale','log')
grid on 
hold off 
end 
