function [e] = countError(x, w, b, y)
    prediction = predict(x,w,b);
    notEqual = prediction ~= y;
    e = sum(notEqual);
end
