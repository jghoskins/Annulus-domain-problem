function val = besseltest(m,lambda)
% compute the absolute value of function g
    if m==0
        val=besselj(1,lambda).*bessely(1,0.5.*lambda)-bessely(1,lambda).*besselj(m,0.5.*lambda);
        val=abs(val);
    else
        lhs=0.25.*(besselj(m-1,lambda)-besselj(m+1,lambda)).*(bessely(m-1,0.5*lambda)-bessely(m+1,0.5.*lambda));
        rhs=0.25.*(besselj(m-1,0.5.*lambda)-besselj(m+1,0.5.*lambda)).*(bessely(m-1,lambda)-bessely(m+1,lambda));
        val=abs(lhs-rhs);
    end
end