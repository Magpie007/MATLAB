fp=fopen('results.txt','a');
fprintf(fp,'The approximation of a nonlinear function\n');
fprintf(fp,'with a second degree parabola\n\n');

fprintf(fp,'the function to be approximated is:\n');
fprintf(fp,'f(x) = x+5*sin(x);\n');
fprintf(fp,'\n Input data:\n');
x1=-3.5;
x2=0.5;
fprintf(fp,'x1 = %6.3f\n x2 = %6.3f\n',x1,x2);
f1=f(x1);
f2=f(x2);
fprintf(fp,'f(x2)= %6.3f\nf(x2) = %6.3f\n',f1,f2);
f1prim=fprim(x1);

fprintf(fp,'\nthe parabola that approximate f(x);\n');
fprintf(fp,'f(x) =a*x^2+b*x+c;\n\n');
a=(f1prim*(x1+x2)-(f1-f2))/((x1+x2)^2);
b=f1prim-2*a*x1;
c=f2-a*x2^2-b*x2;
fprintf(fp,'a= %6.3f\nb= %6.3f\nc= %6.3f\n',a,b,c);

fnc=zeros(1,40);
i=1;
for x=x1:0.1:x2
    fnc(1,i)=f(x);
    i=i+1;
end

plot(fnc,'LineWidth',2);

fnc2=zeros(1,40);

 i=1
 for   x=x1:0.1:x2
    fnc2(1,i)=a*x^2+b*x+c;
    i=i+1;
end

hold on
plot(fnc2,'color','black','LineWidth',2);
xMin=-b/(2*a);
delta=b^2-4*a*c;
yMin=-delta/(4*a);
fprintf(fp,'\n the minimum of the parabola is:\n');
fprintf(fp,'xMin= %6.3f\n',xMin);
fprintf(fp,'fMin= %6.3f\n',yMin);
fclose(fp);

