function R = axisangle2rot(omega,theta)
    % your code here
    R = eye(3)+sin(theta)*[0, -omega(3), omega(2); omega(3), 0, -omega(1); -omega(2), omega(1), 0] + (1-cos(theta))*[0, -omega(3), omega(2); omega(3), 0, -omega(1); -omega(2), omega(1), 0]^2;
end