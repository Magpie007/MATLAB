j=1;
x1zero=3.0;
x2zero=3.5;

a1=-5.0;
b1=5.0;
a2=-4.0;
b2=4.0;

n=250.0;
delta=1.0e3;
epsilon=1.0e-6;

fp=fopen('mrelax.txt','w');
fprintf(fp,'\n\n The Relaxation Method (MULTI-GRID)\n');
fprintf(fp,'===========================================\n\n');

ls1=a1;
ld1=b1;
ls2=a2;
ld2=b2;

fprintf(fp,'the limits of the search interval:\n\n');
fprintf(fp,'ls1=%f  ld1=%f\n  ls2=%f  ld2=%f\n\n',...
    ls1,ld1,ls2,ld2);

fprintf(fp,'The coordinates of the start point');
fprintf(fp,'\n\n');
fprintf(fp,'x1zero=%f  x2zero=%f\n\n',...
    x1zero,x2zero);
f_precedent=f(x1zero,x2zero);
fprintf(fp,'F(X0)=%f\n\n', f_precedent);
fMin=f_precedent;

x2=x2zero;

while(delta>epsilon)
    x1=ls1;
    increment=abs(ld1-ls1)/n;
    
    while (x1<=ld1)
        func=f(x1,x2);
        if (func<fMin)
            fMin=func;
            x1Min=x1;
        end
        x1=x1+increment;
    end
    
    x1=x1Min;
    x2=ls2;
    increment=abs(ls2-ld2)/n;
    
    while (x2<=ld2)
        func=f(x1,x2);
        if (func<fMin)
            fMin=func;
            x2Min=x2;
        end
        x2=x2+increment;
    end
    
    f_actual=fMin;
    fprintf(fp,'i=%d x1=%f x2=%f fMin=%f\n',...
        j,x1Min,x2Min,f_actual);
    
    delta=abs(f_actual-f_precedent);
    j=j+1;
    f_precedent=f_actual;
    x2=x2Min;
end

fprintf(fp,'\n  FINAL RESULT:\n\n');
fprintf(fp,' x1Min=%f\n  x2Min=%f\n\n');
fprintf(fp,' fMin=%f\n\n, x1Min', x2Min, fMin);
fclose(fp);

        
        
        


