% The code below defines the screw axes of a 3DOF robot and its configuration q
S = [0 0 1 0 0 0;
     1 0 0 0 0.3 0;
     0 0 0 0 0 -1]';

q = [rand() * 2 * pi, rand() * 2 * pi, rand() * 0.3];

function J = jacob0(S,q)
    J = zeros(6,3);
    J(:,1) = S(:,1);
    T = eye(4);
    for i = 2:size(S,2)
        curr_T = twist2ht(S(:,i-1),q(i-1));
        T = T*curr_T;
        J(:,i) = adjoint(S(:,i), T);
    end
end

function Vtrans = adjoint(V,T)
    % your code here
    R = T(1:3,1:3);
    p = T(1:3,4);
    Ad = [R zeros(3); [0, -p(3), p(2); p(3), 0, -p(1); -p(2), p(1), 0]*R R];
    Vtrans = Ad*V;
end

function T = fkine(S,M,q)
    T = twist2ht(S(:,1),q(:,1))*twist2ht(S(:,2),q(:,2))*twist2ht(S(:,3),q(:,3))*M;
end


function T = twist2ht(S,theta)
    % your code here
    omega = [S(1); S(2); S(3)];
    v = [S(4); S(5); S(6)];
    
    % If needed, you can calculate a rotation matrix with:
    R = axisangle2rot(omega,theta);
    p = (eye(3)*theta + (1-cos(theta))*[0, -omega(3), omega(2); omega(3), 0, -omega(1); -omega(2), omega(1), 0] + (theta-sin(theta))*[0, -omega(3), omega(2); omega(3), 0, -omega(1); -omega(2), omega(1), 0]^2)*v;
    T = [R(1,1), R(1,2), R(1,3), p(1);
        R(2,1), R(2,2), R(2,3), p(2);
        R(3,1), R(3,2), R(3,3), p(3);
        0 0 0 1];
end

function R = axisangle2rot(omega,theta)
    % your code here
    R = eye(3)+sin(theta)*[0, -omega(3), omega(2); omega(3), 0, -omega(1); -omega(2), omega(1), 0] + (1-cos(theta))*[0, -omega(3), omega(2); omega(3), 0, -omega(1); -omega(2), omega(1), 0]^2;
end