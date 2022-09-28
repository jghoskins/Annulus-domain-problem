% find eigenvalues on [0,10] roughly
values=[];
zks = 0.01:0.2:10;
for ii =1:numel(zks)
    zk=zks(ii);
    fkern = @(s,t) chnk.helm2d.kern(zk,s,t,'d');
    opts = [];
    D = chunkermat(chnkr,fkern,opts);
    sys = 0.5*eye(chnkr.npt) + D;

    x=chnkr.r(1,: );
    y=chnkr.r(2,: );
    f = sin(4*(x-y).^2 +x.^2)';
    g = cos(3.2*(x+y).^2 +y.^2);
    targetvalue=1/(g*(sys\f));
    values=[values,targetvalue];
end


figure
plot(zks,abs(values));
