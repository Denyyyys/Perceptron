function showData(x)
    plot3(x(1:10, 1), x(1:10, 2), x(1:10, 3), 'o', 'DisplayName', 'dane z klasą -1')
    hold on;
    plot3(x(11:20, 1), x(11:20, 2), x(11:20, 3), '+', 'DisplayName', 'dane z klasą 1')
    xlabel('X1');
    ylabel('X2');
    zlabel('X3');
    title('Zbiór treningowy');
    grid on;
    legend();
end
