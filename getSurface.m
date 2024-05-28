function [hSurf] = getSurface(X,Y, A,B,C,D)
    Z = (-A*X - B*Y - D) / C;
    hSurf = surf(X,Y,Z, 'HandleVisibility', 'off', 'FaceColor', [0.5 0.7 0.5], 'FaceAlpha', 1, 'EdgeColor', 'none');
end
