close all;
clear all;
load("data.mat");

%% algorithm parameters
lr = 0.01; % learning rate. Test for: 0.1, 0.01, 1. Maybe also for 0.0001
w = [0;0;100];
b = 0;
r = max(abs(x(:)));
max_iter = 1000;
current_iter = 1;

error = countError(x,w,b,y);

%% plot parameters
X = linspace(-5, 5, 10);
Y = linspace(-5, 5, 10);
[X, Y] = meshgrid(X, Y);

xLimits = [-5 5];
yLimits = [-5 5];
zLimits = [-5 5];

figure;
axis([xLimits yLimits zLimits]);
% view(-2.915459232894082e+02,8.842990654205609);
% view(12.942965599480633,5.477102803738314);
view(-1.062348121782971e+02,3.072897196261678);
%% plotting and updating parameters
hold on;
showData(x)
hSurf = getSurface(X, Y, w(1), w(2), w(3), b);
fprintf('Iteration\tGood Classification\tPercentage Error\tw1\t\tw2\t\tw3\t\tb\n');
while error ~= 0 && current_iter <= max_iter
    for i =1:length(y)
        current_prediction = predict(x,w,b);
        if current_prediction(i) ~= y(i)
            w = w + lr*y(i)*x(i);
            b = b - lr * y(i) * r^2;
            error = countError(x,w,b,y);
        end

        % plot surface with new parameters every 50 iteration
        if mod(current_iter, 50) == 0
            delete(hSurf)
            hSurf = getSurface(X, Y, w(1), w(2), w(3), b);
            pause(0.01);
        end
    end
    fprintf('%d\t\t\t%d/%d\t\t\t\t%.2f%%\t\t\t\t%.2f\t%.2f\t%.2f\t%.2f\n', ...
        current_iter, 20-error, 20, (error / 20)*100, w(1), w(2),w(3),b);
    current_iter = current_iter + 1;
end

delete(hSurf)
hSurf = getSurface(X, Y, w(1), w(2), w(3), b);