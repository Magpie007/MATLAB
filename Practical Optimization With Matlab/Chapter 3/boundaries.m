fp=fopen('results.txt','a');
fprintf(fp, ' \n');
fprintf(fp, ' \n');
fprintf(fp,'Boundaries\n');
xa=0.0;
tau=0.381966;
xb=tau;
fa=f(xa);
fb=f(xb);
fprintf(fp,'xa=%f   xb=%f   fa=%f   fb=%f\n', xa, xb, fa, fb);
if fa < fb
    left_bound = xa;
    righ_bound = xb;
end
while fa>fb
    x1=xb;
    f1=fb;
    xb=(1+tau)*x1+tau*xa;
    fb=f(xb);
    fprintf(fp,'xa=%f   xb=%f   fa=%f   fb=%f\n', xa, xb, fa, fb);
    if f1>fb
        xa=x1;
        fa=f1;
    elseif f1<fb
        left_bound=xa;
        right_bound=xb;
    end
end
fprintf(fp,'\n   Final result:\n');
fprintf(fp, 'leftBound=%f   rightBound=%f\n', left_bound,right_bound);
fclose(fp);

