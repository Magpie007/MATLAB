a1=-3;
b1=3;
a2=-3;
b2=3;
increment1=0.1;
increment2=0.1;
n1=(b1-a1)/increment1;
n2=(b2-a2)/increment2;
fGraph=zeros(n1,n2);

x1=a1;
for i1=1:n1
    x2=a2;
    for i2=1:n2
        fGraph(i1,i2)=f(x1,x2);
        x2=x2+increment2;
    end
    x1=x1+increment1;
end
mesh(fGraph);
