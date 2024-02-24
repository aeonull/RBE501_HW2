function T = fkine(S,M,q)
    T = twist2ht(S(:,1),q(:,1))*twist2ht(S(:,2),q(:,2))*twist2ht(S(:,3),q(:,3))*M;
end