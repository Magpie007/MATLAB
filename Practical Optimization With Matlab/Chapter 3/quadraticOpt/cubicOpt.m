fp=fopen('results.txt','a');
fprintf(fp,'Cubic Optimization\n');
fprintf(fp,'the approximation of a non-linear function\n');
fprintf(fp,'with a third degree polynomial and the\n');
fprintf(fp,'determination of the optimal point\n\n');
fprintf(fp,'Input data:\n');

x1=-3.5;
x2=0.5;
x3=-2.0;
fprintf(fp,'x1= %6.3f\n x2= %6.3f\n x3= %6.3f\n', x1,x2,x3);
f1=f(x1);
f2=f(x2);
f3=f(x3);
fprintf(fp,'f1= %6.3f\n f2= %6.3f\n f3= %6.3f\n',f1,f2,f3);

f1prim=fprim(x1);

fnc=zeros(1,40);
i=1;
for x=x1:0.1:x2
    fnc(1,i)=f(x);
    i=i+1;
end

a=(f3-f1)/((x3-x1)^2*(x3-x2))-(f2-f1)/((x2-x1)^2*(x3-x2))+f1prim/((x2-x1)*(x3-x1));
b=(f2-f1)/(x2-x1)^2-f1prim/(x2-x1)-a*(2*x1+x2);
c=f1prim-x*a*x1^2-2*b*x1;
d=f1-a*x1^3-b*x1^2-c*x1;

fnc3=zeros(1,40);
i=1;
for x=x1:0.1:x2
    fnc3(1,i)=a*x^3+b*x^2+c*x+d;
    i=i+1;
end

discrim=4*b^2-12*a*c;
switch discrim 
    case 0
        x1prim=-b/(3*a);
        x2prim=x1prim;
    otherwise
        x1prim=(-2*b-sqrt(discrim))/(6*a);
        x2prim=(-2*b-sqrt(discrim))/(6*a);
end

if(x1<x1prim&&x1prim<x2)
    xExtrem=x1prim;
end
if(x1<x2prim&&x2prim<x2)
    xExtrem=x2prim;
end

if(6*a*xExtrem+2*b)>0
    optim=('xExtrem is the minimum point');
else
    optim=('xExtrem is the maximum point');
end

xMin=xExtrem;
fMin=f(xMin);
fprintf(fp,'xMin= %9.6f\n fMin= %9.6f\n', xMin, fMin);
plot(fnc,'LineWidth',2);
hold on;
plot(fnc3,'color','red','LineWidth',2);
hold off;
fclose(fp);

