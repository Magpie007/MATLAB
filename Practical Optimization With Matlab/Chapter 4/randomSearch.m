fp=fopen('randomSearch.txt','w');
fprintf(fp, '\n   Random search method:\n\n');

nVar=2;
n=1000000;
epsilon=1e-3;
for i=1:nVar
    a=zeros(1,nVar);
    b=zeros(1,nVar);
end

for i=1:nVar
    a(i)-10.0;
    b(i)=10.0;
end
fMin=1e6;
fPrecedent=fMin;

for i=1:n
    x1=rand;
    x1=a(1)+x1*(b(1)-a(1));
    
    x2=rand;
    x2=a(2)+x2*(b(2)-a(2));
    
    func=f(x1,x2);
    if (func<fMin)
        fMin=func;
        x1Min=x1;
        x2Min=x2;
        
        fprintf(fp,'i=%d  x1=%f  x2=%f  fmin=%f\n',i,x1,x2,fMin);
        if abs(fMin-fPrecedent)<=epsilon
            break;
        else
            fPrecedent=fMin;
        end
    end
end

fprintf(fp,'\n   FINAL RESULT:\n\n');
fprintf(fp,'x1Min=%f\n x2Min=%f\n\n fMin=%f\n\n',x1Min,x2Min,fMin);
fclose(fp);
