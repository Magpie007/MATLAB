function [xOptim,fMinim]=goldenSectionFunc(a,b,eps,tau,rp)

intervalLength=b-a;
while (intervalLength>eps)
    x1=(1-tau)*a+tau*b;
    x2=tau*a+(1-tau)*b;
    if g1(x1)<=0
        f1=f(x1);
    else
        f1=f(x1)+rp*g1(x1)*g1(x1);
    end
    if g1(x1)<=0
        f2=f(x2);
    else
        f2=f(x2)+rp*g1(x2)*g1(x2);
    end
    if (f1<f2)
        b=x2;
    else
        a=x1;
    end
    intervalLength=b-a;
end
xOptim=(a+b)/2;
fMinim=f(xOptim);
return;
