fp=fopen('conjugatedGrad.txt','w');

x1zero=3.0;
x2zero=3.5;
fprintf(fp,'The Conjugated Gradient Method\n\n');
fprintf(fp,'the start point:\n');
fprintf(fp,'x1zero= %f\n x2zero= %f\n\n',...
    x1zero,x2zero);

epsilon=1.0e-6;
delta=0.00001;
alfa0=0.001;
incAlfa=0.001;
f_prcedent=f(x1zero,x2zero);

x1=x1zero;
x2=x2zero;
fa=f(x1,x2);
x1=x1+delta;
fb=f(x1,x2);
diff=fa-fb;
s1=-diff/(-delta);

x2=x2+delta;
fb=f(x1,x2);
diff=fa-fb;
s2=-diff/(-delta);

alfa=alfa0;
x1unc=x1zero+alfa*s1;
x2unc=x2zero+alfa*s2;
f_actual=f(x1one,x2one);

while(f_actual<f_precedent)
    f_precedent=f_actual;
    alfa=alfa+incAlfa;
    x1unc=x1zero+alfa*s1;
    x2unc=x2zero+alfa*s2;
    f_actual=f(x1one,x2one);
end
fMin=f_actual;
x1Min=x1one;
x2Min=x2one;
deltaF=abs(f_precedent-f_actual);

s1p=s1;
s2p=s2;

i=0;
while(deltaF>=epsilon)
    func=f_actual;
    x1p=x1Min;
    x2p=x2Min;
    beta=...
        ((sqrt(s1*s1+s2*s2))*(sqrt(s1*s1+s2*s2)))...
        /((sqrt(s1p*s1p+...
        s2p*s2p))*(sqrt(s1p*s1p+s2p*s2p)));
    x1=x1p;
    x2=x2p;
    fa=f(x1,x2);
    x1=x1+delta;
    fb=f(x1,x2);
    diff=fa-fb;
    s1=-diff/(-delta);
    x2=x2+delta;
    fb=f(x1,x2);
    diff=fa-fb;
    s2=-diff/(-delta);
    
    alfa=alfa0;
    x1one=x1p+alfa*(s1+beta*s1p);
    x2one=x2p+alfa*(s2+beta*s2p);
    f_actual=f(x1one,x2one);
    while(f_actual<f_precedent)
        f_precedent=f_actual;
        alfa=alfa+incAlfa;
        x1unu=x1p+alfa*(s1+beta*s1p);
        x2unc=x2p+alfa*(s2+beta*s2p);
        f_actual=f(x1one,x2one);
    end
    fMin=f_actual;
    x1Min=x1one;
    x2Min=x2one;
    deltaF=abs(func-f_actual);
    s1p=s1;
    s2p=s2;
    i=i+1;
    fprintf(fp,'i=%d',i);
    fprintf(fp,'s1=%f s2=%f x1=%f x2=%f fMin=%f\n',...
        s1,s2,x1Min,x2Min,f_actual);
end

fprintf(fp,'\n   FINAL RESULT:\n\n');
fprintf(fp,'x1=%f\n  x2=%f\n\n  fMin=%f\n\n',...
    x1Min,x1Min,fMin);
fclose(fp);
