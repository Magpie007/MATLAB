n=0;
nMax=5;
x1zero=3.0;
x2zero=3.5;
epsilon=1e-5;
alfa0=0.001;

a=-10.0;
b=10.0;

F0=f(x1zero,x2zero);
Fprecedent=F0;
f0=F0;

fp=fopen('randomPath.txt','w');

s1=rand;
s2=rand;
alfa=alfa0;
increment=alfa0;

x1one=x1zero+alfa*s1;
x2one=x2zero+alfa*s2;

F1=f(x1one,x2one);
Factual=F1;

i=1;

go=true;
while go
    while (Factual>=Fprecedent)
    s1=rand; s1=a+s1*(b-a);
    s2=rand; s2=a+s2*(b-a);
    
    x1one=x1zero+alfa*s1;
    x2one=x2zero+alfa*s2;
    
    F1=f(x1one,x2one);
    Factual=F1;
end
fprintf(fp,'i= %d x1 = %f x2= %f fmin= %f\n',i,x1one,x2one,F1);
i=i+1;
f1=F1;
while (Factual<Fprecedent)
    Fprecedent = Factual;
    alfa=alfa+increment;
    
    x1one=x1zero+alfa*s1;
    x2one=x2zero+alfa*s2;
    
    F1=f(x1one,x2one);
end

deltaF=abs(F1-Fprecedent);
F0=Factual;
x1zero=x1one;
x2zero=x2one;
alfa=alfa0;

if(abs(f0-f1)<=epsilon)
    n=n+1;
end
f0=f1;

if(n==nMax)
    go=false;
    break;
end
end


fprintf(fp,'\n  FINAL RESULT:\n\n');
fprintf(fp,'x1=%f x2=%f fMin=%f\n',x1one,x2one,f0);
fclose(fp);



