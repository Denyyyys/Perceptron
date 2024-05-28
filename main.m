close all;
clear all;
load("data.mat");

%% algorithm parameters
lr = 0.5; % learning rate. Test for: 0.1, 1, 0.5, 0.01
w = [0;0;100];
b = 0;
r = max(abs(x(:)));
% max_iter = 1000;
current_iter = 0;
errors = [];

error = countError(x,w,b,y);

%% plot parameters
X = linspace(-50, 50, 10);
Y = linspace(-50, 50, 10);
[X, Y] = meshgrid(X, Y);

xLimits = [-5 5];
yLimits = [-5 5];
zLimits = [-5 5];

figure;
axis([xLimits yLimits zLimits]);
% view(-2.915459232894082e+02,8.842990654205609);
% view(12.942965599480633,5.477102803738314);
view(65.987410043925109,11.247196261682246);
%% plotting and updating parameters
hold on;
showData(x)
% a=1000;
hSurf = getSurface(X, Y, w(1), w(2), w(3), b);
fprintf('Iteration\tGood Classification\tPercentage Error\tw1\t\tw2\t\tw3\t\tb\n');
while error ~= 0 
    
    for i =1:length(y)
        current_iter = current_iter + 1;
        fprintf('%d\t\t\t%d/%d\t\t\t\t%.2f%%\t\t\t\t%.2f\t%.2f\t%.2f\t%.2f\n', ...
        current_iter, 20-error, 20, (error / 20)*100, w(1), w(2),w(3),b);
        % current_prediction = predict(x,w,b);
        error = countError(x,w,b,y);
        errors = [errors; countError(x,w,b,y)];
        if sign(x(i,:)*w - b) ~= y(i)
            w = w + lr*y(i)*x(i);
            b = b - lr * y(i) * r^2;
            % errors = [errors; error];
        end

        % plot surface with new parameters every 50 iteration
        if mod(current_iter, 10) == 0
            delete(hSurf)
            title(sprintf("w1=%.2f, w2=%.2f, w3=%.2f, b=%.2f, error=%d/20", w(1), w(2), w(3), b, countError(x,w,b,y)));
            hSurf = getSurface(X, Y, w(1), w(2), w(3), b);
            % print(sprintf('images/00%d', a), '-dpng', '-r300');
            % a = a + 1;
            pause(0.01);
        end
    end

    current_iter = current_iter + 1;

end


delete(hSurf)
hSurf = getSurface(X, Y, w(1), w(2), w(3), b);
% print(sprintf('images/00%d', a), '-dpng', '-r300');

hold off;
figure;
plot(errors);
xlabel('Numer iteracji');
ylabel('Liczba błędów');
title(sprintf('Liczba złych klasyfikacji w trakcie uczenia się, learning rate = %f', lr));
% xticks(1:length(errors));
% yticks(0:20);

grid on;