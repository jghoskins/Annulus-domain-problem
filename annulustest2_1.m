%find eigenvalue on [5.15,5.2]
x=chnkr.r(1,: );
y=chnkr.r(2,: );
f = sin(4*(x-y).^2 +x.^2)';
g = cos(3.2*(x+y).^2 +y.^2);


n=50;
k=1:n;
x_cb=5.175+0.025*cos((2*k-1)/(2*n)*pi); %Chebyshev points
rhs=zeros(size(x_cb));


for i=1:n
    zk=x_cb(i);
    zk
    fkern = @(s,t) chnk.helm2d.kern(zk,s,t,'d');
    opts = [];
    smat = chunkermat(chnkr,fkern,opts);
    sys = 0.5*eye(chnkr.npt) + smat;
    rhs(i)=1/(g*(sys\f));
    rhs(i)
end
rhs=rhs';

xcheb = cos((2*k-1)/(2*n)*pi);
ncheb = 0:49;
[NN,XX] = meshgrid(ncheb,xcheb);
NN = NN;
XX = XX;
A = cos(NN.*acos(XX));

a=A\rhs                        
sol=colleagueeigs(49,a');
sol=sol/40+5.175