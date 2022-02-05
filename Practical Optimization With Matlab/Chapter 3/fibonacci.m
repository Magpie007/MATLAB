a=1.41;
b=3.69;
eps=1e-3;
k=(b-a)/eps;
f1=1;
f2=1;
s=f1+f2;
n=2;

while (s<=k)
    s=f1+f2;
    f1=f2;
    f2=s;
    n=n+1;
end

fp=fopen('results.txt','a');
fprintf(fp,'Fibonacci method\n\n');
fprintf(fp,'a=%f  b=%f  n=%d  eps=%f\n',a,b,n,eps);
fprintf(fp,'\n');
fib=zeros(1,n);

fib(1)=1;
fib(2)=1;
for i=3:1:n
    fib(i)=fib(i-2)+fib(i-1);
end

x1=a+(fib(n-2)/fib(n))*(b-a);
x2=a+(fib(n-1)/fib(n))*(b-a);
initialLength=b-a;

k=0;

fprintf(fp,'Intermediary results\n');

while (n>2)
    f1=f(x1);
    f2=f(x2);
    if(f1<f2)
        b=x2;
        x2=x1;
        x1=a+(fib(n-2)/fib(n))*(b-a);
        n=n-1;
    elseif (f1>f2)
        a=x1;
        x1=x2;
        x2=a+(fib(n-1)/fib(n))*(b-a);
        n=n-1;
    end
    fprintf(fp,'iteration no.%2d  a=%f  b=%f  \n', (k+1),a,b);
    initiaLength=b-a;
    k=k+1;
end

xMin=(a+b)/2;
yMin=f(xMin);

fprintf(fp,'\n');
fprintf(fp,'Final results:\nxMin=%f  fMin=%f\n', xMin, yMin);
fclose(fp);

