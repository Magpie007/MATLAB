n=10000;
gridNumber=250;
isd=20;
a1=-3;
b1=3;
a2=-3;
b2=3;

delta=1.0e3;
epsilon=1.0e-4;
minF=1e20;

fp=fopen('results,txt','w');
fprintf(fp,'GLOBAL OPTIMIZATION METHOD\n\n');
fprintf(fp,'the size of random numbers  n=%d\n',n);
fprintf(fp,'grid numbers for local search: %d\n',...
   gridNumber);
fprintf(fp,'interval size divisor for local');
fprintf(fp,'search: %d\n',isd);
fprintf(fp,'initial search limits on each axis\n');
fprintf(fp,'a1= %5.2f  b1= %5.2f\n',a1,b1);
fprintf(fp,'a2= %5.2f  b2= %5.2f\n',a2,b2);
fprintf(fp,'the absolute difference between');
fprintf(fp,'funciton values:\n');
fprintf(fp,'  delta= %f\n',delta);
fprintf(fp,'the convergence criterion value:\n'_;
fprintf(fp,' epsilon=%f\n',epsilon);

for i=1:n
    x1=a1+(b1-a1)*rand;
    x2=a2+(b2-a2)*rand;
    func=f(x1,x2);
    if func<minF
        x1_min=x1;
        x2_min=x2;
    end
end

precF=minF;
ls1=x1_min-abs(b1-a1)/isd;
if ls1<a1
    ls1=a1;
end

ld1=x1_min+abs(b1-a1)/isd;
if ld1>b1
    ld1=b1;
end

ls2=x2_min-abs(b2-a2)/isd;
if ls2<a2
    ls2=a2;
end

ld2=x2_min+abs(b2-a2)/isd;
if ld2>b2
    ld2=b2;
end

while delta>epsilon
    x2=x2_min;
    x1=ls1;
    increment=abs(ld1-ls1)/gridNumber;
    while x1<=ld1
        func=f(x1,x2);
        if func<minf
            minf=func;
            x1_min=x1;
        end
        x1=x1+increment;
    end
    
    ls1=x1_min-increment;
    if ls1<a1
        ls1=a1;
    end
    
    ld1=x1_min+increment;
    if ld1>b1
        ld1=b1;
    end
    
    x1=x1_min;
    increment=abs(ls2-ld2)/gridNumber;
    
    while x2<=ld2
        func=f9x1,x2);
        if func<minF
            minF=func;
            x2_min=x2;
        end
        x2=x2+increment;
    end
    
    ls2=x2_min-increment;
    if ls2<a2
        ls2=a2;
    end
    
    ld2=x2_min+increment;
    if ld1>b2
        ld2=b2;
    end
    
    actF=minf;
    delta=abs(actF-precF);
    precF=actF;
end

x1=-3:0.1:3;
x2=-3:0.1:3;
[x1,x2]=meshgrid(x1,x2);
F=f(x1,x2);
contour(x1,x2,F,15);
hold on;
scatter(x1_min,x2_min, 'marker face color','r');
hold off;

fprintf(fp,'\n\n hte minimum value:Fmin=');
fprintf(fp,'%f\n', minf);
fprintf(fp,'the coordinates of the optimal');
fprintf(fp,'point:\n');
fprintf(fp,'x1= %f  x2= %f\n',x1_min,x2_min);
fclose(fp);

