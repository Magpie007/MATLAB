
xInf=1.41;
xSup=3.69;
eps=0.001;
grids=20;
increment=(xSup-xInf)/grids;
fMin=f(xInf);
precedent_fMin=fMin;
fp=fopen('results.txt','a');
fprintf(fp, ' Grid Optimization Method\n\n');
delta_1=abs(xSup-xInf);
xMin=xInf;
fprintf(fp, 'Input data:\n');
fprintf(fp,'eps= %f\n',eps);
fprintf(fp,'grids= %d\n',grids);
fprintf(fp,'xInf=%f   xSup=%f   xMin=%f   fMin=%f\n', xInf,  xSup,  xMin,  fMin);
fprintf(fp,'\n');
fprintf(fp,'Interation:\n');
%

while delta_1>eps
x=xInf;
for i=0:grids
    func=f(x);
    if func<fMin
        xMin = x;
        fMin = func;
    end
    x = x+increment;
end

fprintf(fp, 'xInf=%f   xSup=%f   xMin=%f   fMin=%f\n', xInf, xSup, xMin, fMin);
actual_fMin=fMin;
delta_1 = abs(xSup-xInf);
xInf = xMin-increment;
xSup = xMin+increment;
increment=(xSup-xInf)/grids;
precedent_fMin=actual_fMin;

end

fprintf(fp,'nFinal result:\n');
fprintf(fp,'xInf=%f   xSup=%f   xMin=%f   fMin=%f\n', xInf,  xSup,  xMin,  fMin);
fMin = precedent_fMin;
fclose(fp);


