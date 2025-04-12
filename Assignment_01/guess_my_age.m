function guess_my_age(n)
if n==21
    fprintf('Congrates ! you guess the correct age.\n');
elseif n<21
    fprintf('Too Small ! Try again. \n');
else
    fprintf('Too Big ! Try again. \n');
end 