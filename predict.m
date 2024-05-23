function [result] = predict(x,w,b)
    result = sign(x*w - b);
end
