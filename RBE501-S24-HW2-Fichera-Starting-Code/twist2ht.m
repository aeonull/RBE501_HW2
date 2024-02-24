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