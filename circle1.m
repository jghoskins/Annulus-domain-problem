function [r,d,d2] = circle1(t,rad)

    x0=0;
    y0=0;
    
    ct=cos(t);
    st=sin(t);
    
    xs=x0+rad.*ct;
    ys=y0+rad.*st;
    dxs=-rad.*st;
    dys=rad.*ct;
    d2xs=rad.*ct;
    d2ys=-rad.*st;
    
    r = [(xs(:)).'; (ys(:)).'];
    d = [(dxs(:)).'; (dys(:)).'];
    d2 = [(d2xs(:)).'; (d2ys(:)).'];

end