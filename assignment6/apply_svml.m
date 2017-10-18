function [d] = apply_svml(x, w, b)
% input vector x, parameters w, bias b

if w'*x' + b >= 0
    d = 1;
else
    d = 0;
end

end