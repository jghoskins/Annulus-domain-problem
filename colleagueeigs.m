function targets = colleagueeigs(inputval,coeflist)
%find eigenvalues for colleague matrix
n=inputval+1;
L=coeflist;
A=zeros(n);
for i=1:n
    for j=1:n
        if j-i==1 || i-j==1
            A(i,j)=1/2;
        end
    end
end
A(1,2)=1;
B=zeros(n);
for i=1:n
    B(n,i)=-L(1,i)/(2*L(1,n));
end
C=A+B;
targets=eig(C);

end