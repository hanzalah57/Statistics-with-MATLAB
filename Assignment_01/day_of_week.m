function day_of_week(n)
if n==1
    fprintf('Sunday.\n');
    day_type=2;
elseif n==2
     fprintf('Monday.\n');
    day_type=1;
elseif n==3
     fprintf('Tuesday.\n');
    day_type=1;  
elseif n==4
     fprintf('Wednesday.\n');
    day_type=1;
elseif n==5
     fprintf('Thursday.\n');
    day_type=1;    
elseif n==6
     fprintf('Friday.\n');
    day_type=1;
elseif n==7
     fprintf('Saturday.\n');
    day_type=2;
else 
    fprintf('Number must be from 1 to 7.\n');
    return 
end 
if day_type==1
    fprintf('Which is a week day.\n');
else 
    fprintf('Which is a weekend day.\n');
end
