fp=fopen('constrRanSearch.txt','w');
fprintf(fp,'\nRandom search method with constraints:\n\n');

nVar=2;
n=100000;
epsilon=1e-3;
for i=1:nVar
    a=zeros(1,nVar);
    b=zeros(1,nVar);
end

for i=1:nVar
    a(i)=-3.5;
    b(i)=3.5;
end
fMin=1.0e6;
fPrecedent=fMin;

for i=1:n
    x1=rand;
    x1=a(1)+x1*(b(1)-a(1));
    
    x2=rand;
    x2=a(2)+x2*(b(2)-a(2));
    func=f(x1,x2);
    
    if (func<fMin && g1(x1,x2)<=0)
        fMin=func;
        x1Min=x1;
        x2Min=x2;
        
        fprintf(fp,'i=%d x1=%f x2=%f fmin=%f\n',...
            i,x1,x2,fMin);
        if abs(fMin-fPrecedent)<=epsilon
            break;
        else
            fPrecedent=fMin;
        end
    end
end

fprintf(fp,'\n  FINAL RESULT:\n\n');
fprintf(fp,'x1Min=%f\n  x2Min+%f\n\n  FMin=%f\n',...
    x1Min,x2Min,fMin);
fprintf(fp,' g(x1Min,x2Min)= %f\n',...
    g1(x1Min,x2Min));
fclose(fp);
