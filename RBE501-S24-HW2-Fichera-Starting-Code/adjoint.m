function Vtrans = adjoint(V,T)
    % your code here
    R = T(1:3,1:3);
    p = T(1:3,4);
    Ad = [R zeros(3); [0, -p(3), p(2); p(3), 0, -p(1); -p(2), p(1), 0]*R R];
    Vtrans = Ad*V;
end

