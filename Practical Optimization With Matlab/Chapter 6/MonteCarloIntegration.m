fp=fopen('results.txt','w');
fprintf(fp,'Integration by Monte Carlo method\n\n');
nSteps=100;
intVal=zeros(1,nSteps);
i=1;
N=100000;
for k=1:nSteps
    n=0;
    for j=1:N
        x=rand();
        y=rand();
        if y <=sqrt(1-x^2)
            n=n+1;
        end
    end
    intVal(1,i)=n/N;
    i=i+1;
end
theMean=mean(intVal);
theStd=std(intVal);
fprintf(fp,'the number of points generated in the');
fprintf(fp,'square area\n  N= %f\n',N);
fprintf(fp,'the number of points under the circle');
fprintf(fp,'arc\n  n=%f\n',n);
fprintf(fp,'\nthe mean value of the');
fprintf(fp,'integral = %f\n', theMean);
fprintf(fp,'standard deviation %f\n',theStd);
fclose(fp);
