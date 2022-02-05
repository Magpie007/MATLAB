x1zero=-3.0;
x2zero=3.0;
epsilon=1e-3;
alfa0=0.001;
incAlfa=0.001;
Rp=1.0;
incRp=0.5;
delta=0.00001;
deltaF=1e3;
deltaFp=1e3;

fp=fopen('penaltyExt.txt','w');

fprintf(fp,'The exterior penalty function method\n');
fprintf(fp,'based on a gradient method');
fprintf(fp,'implementation\n\n');
fprintf(fp,'the start point X0(x1zero,x2zero):\n');
fprintf(fp,'x1zero= %6.3f  x2zero= %6.3f\n',...
    x1zero,x2zero);
fprintf(fp,'convergence factor: epsilon= %f\n',...
    epsilon);
fprintf(fp,'initial leap factor alfa0= %f\n',...
    alfa0);
fprintf(fp,'leap factor increment incAlfa= %f\n',...
    incAlfa);
fprintf(fp,'the penalty factor Rp= %f\n',Rp);

fPrecedent = f(x1zero,x2zero);
fMin=fPrecedent;
fp1=fPrecedent;
while (deltaFp>=epsilon)
    x1=x1zero;
    x2=x2zero;
    if(g(x1,x2)>=0)
        fa=pseudo_f(x1,x2,Rp);
    else
        fa=f(x1,x2);
    end
    
    x1=x1+delta;
    if(g(x1,x2)>=0)
        fb=pseudo_f(x1,x2,rp);
    else
        fb=f(x1,x2);
    end
    diff=fa-fb;
    s1=-diff/(-delta);
    x2=x2+delta;
    if (g(x1,x2)>=0)
        fb=pseudo_f(x1,x2,Rp);
    else
        fb=f(x1,x2);
    end
    
    dif=fa-fb
    s2=-diff/(-delta);
    alfa=alfa0;
    x1one=x1zero+alfa*s1;
    x2one=x2zero+alfa*s2;
    if (g(x1one,x2one)>=0)
        fActual=pseudo_f(x1one,x2one,Rp);
    else
        fActual=f(x1one,x2one);
    end
    
    while(fActual<fPrecedent)
        fPrecedent=fActual;
        alfa=alfa+incAlfa;
        x1unu=x1zero+alfa*s1;
        x2unu=x2zero+alfa*s2;
        if(g1(x1one,x2one)>=0)
            fActual=pseudo_f(x1one,x2one,Rp);
        else
            fActual=f(x1one,x2one);
        end
    end
    
    fMin=fActual;
    x1Min=x1one;
    x2Min=x2one;
    deltaF=abs(fPrecedent -fActual);
    
    while(deltaF>=epsilon)
        func=fActual;
        x1p=x1Min;
        x2p=x2Min;
        
        x1=x1p;
        x2=x2p;
        if(g(x1,x2)>=0)
            fa=pseudo_f(x1,x2,Rp);
        else
            fa=f(x1,x2);
        end
        x1=x1+delta;
        if(g(x1,x2)>=0)
            fb=pseudo_f(x1,x2,Rp);
        else
            fb=f(x1,x2);
        end
        
        diff=fa-fb;
        s1=-diff/(-delta);
        x2=x2+delta;
        
        if(g(x1,x2)>=0)
            fb=pseudo_f(x1,x2,Rp);
        else
            fb=f(x1,x2);
        end
        diff=fa-fb;
        s2=-diff/(-delta);
        
        alfa=alfa0;
        x1one=x1p+alfa*s1;
        x2one=x2p+alfa*s2;
        if (g(x1one,x2one)>=0)
            fActual=pseudo_f(x1one,x2one,Rp);
        else
            fAtual=f(x1one,x2one);
        end
        
        while(fActual<fPrecedent)
            fPrecedent=fActual;
            alfa=alfa+incAlfa;
            x1unu=x1p+alfa*s1;
            x2unc=x2p+alfa*s2;
            if(g(x1one,x2one)>=0)
                fActual=pseudo_f(x1one,x2one,Rp);
            else
                fActual=f(x1one,x2one);
            end
        end
        fMin=fActual;
        x1Min=x1one;
        x2Min=x2one;
        deltaF=abs(func-fActual);
    end
    
    fp2=fMin;
    deltaFp=abs(fp1-fp2);
    fp1=fp2;
    Rp=Rp+incRp;
end

fprintf(fp,'\n  Final result:\n');
fprintf(fp,'x1Min= %f  x2Min= %f \n  fMin=%f\n', x1Min,x2Min,f(x1Min,x2Min));
fprintf(fp,'constraint g1= %f\n',g(x1Min,x2Min));
fclose(fp);