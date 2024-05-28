function showData(x)
    plot3(x(1:10, 1), x(1:10, 2), x(1:10, 3), '_', 'MarkerSize', 10, 'LineWidth',3)
    hold on;
    plot3(x(11:20, 1), x(11:20, 2), x(11:20, 3), '+', 'MarkerSize', 10, 'LineWidth',3)
    xlabel('X1');
    ylabel('X2');
    zlabel('X3');
    % title('Zbiór treningowy');
    grid on;
    % legend();
end
