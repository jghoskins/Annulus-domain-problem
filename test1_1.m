smalleig=[];
values=[];
bzero0=besselzero(1,10,1)';
bzero1=[1.8412,5.3314,8.5363,11.7060,14.8636];
zks = 0.01:0.2:15;
for ii =1:numel(zks)
    zk=zks(ii);
    fkern = @(s,t) chnk.helm2d.kern(zk,s,t,'d');
    opts = [];
    start = tic; D = chunkermat(chnkr,fkern,opts);
    t1 = toc(start);
    
    %fprintf('%5.2e s : time to assemble matrix\n',t1)

    sys = 0.5*eye(chnkr.npt) + D;
    %find the eigenvalue with the smallest norm
    targeteig=eigs(sys,1,'smallestabs');
    smalleig=[smalleig,targeteig];


    x=chnkr.r(1,: );
    y=chnkr.r(2,: );
    f = sin(4*(x-y).^2 +x.^2)';
    g = cos(3.2*(x+y).^2 +y.^2);
    targetvalue=1/(g*(sys\f));
    values=[values,targetvalue];
end
display(smalleig);

figure
label1=["J01'","J02'","J03'","J04'"];
label2=["J11'","J12'","J13'","J14'"];
plot(zks,abs(smalleig))
L=plot(zks,abs(smalleig),bzero0(1,1:4),[0,0,0,0],".",bzero1(1,1:4),[0,0,0,0],".");
L(2).MarkerSize=20;
L(3).MarkerSize=15;
text(bzero0(1,1:4),[0,0,0,0],label1);
text(bzero1(1,1:4),[0,0,0,0],label2);

figure
plot(zks,abs(values));