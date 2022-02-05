eps=0.001;
a=1.41;
b=3.69;
tau=0.381966;
intervalLength=b-a;
fp=fopen('results.txt','a');
fprintf(fp,'Golden Section Method\n\n');
fprintf(fp,'Input data:\n');
fprintf(fp,'Convergence criterion eps = %f\n',eps);
fprintf(fp,'a=%f   b=%f\n',a,b);
fprintf(fp,'tau=%f\n\n', tau);
fprintf(fp,'Intermediary results:\n');

i=1;
while (intervalLength>eps)
    x1=(1-tau)*a+tau*b;
    x2=tau*a+(1-tau)*b;
    f1=f(x1);
    f2=f(x2);
    if(f1<f2)
        b=x2;
    else
        a=x1;
    end
    
    fprintf(fp,'iteration no. %d: a= %f  b=%f\n', i, a, b);
    intervalLength=b-a;
    i=i+1;
end

xOptim=(a+b)/2;
fMinim=f(xOptim);

fprintf(fp,'\nFinal results:\n');
fprintf(fp,'xOptim=%f\n',xOptim);
fprintf(fp,'fMinim=%f\n',fMinim);
fclose(fp);


