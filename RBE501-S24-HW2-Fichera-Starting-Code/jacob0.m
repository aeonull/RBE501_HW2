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