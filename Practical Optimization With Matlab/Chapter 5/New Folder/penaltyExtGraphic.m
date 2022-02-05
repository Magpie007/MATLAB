xstart=-10;
increment=0.5;
n=abs(2*xstart)/increment;

x1zero=xstart;
x2zero=xstart;

y1=zeros(n,n);
y2=zeros(n,n);
y3=zeros(n,n);
y4=zeros(n,n);
yg=zeros(n,n);

Rp=[0.1,1.5,5.0,19.0];

x1=x1zero;
for i=1:n
    x2=x2zero;
    for j=1:n
        if g(x1,x2)>=0
            y1(i,j)=pseudo_f(x1,x2,Rp(1));
            y2(i,j)=pseudo_f(x1,x2,Rp(2));
            y3(i,j)=pseudo_f(x1,x2,Rp(3));
            y4(i,j)=pseudo_f(x1,x2,Rp(4));
        elseif g(x1,x2)<0
            y1(i,j)=f(x1,x2);
            y2(i,j)=f(x1,x2);
            y2(i,j)=f(x1,x2);
            y4(i,j)=f(x1,x1);
        end
        yg(i,j)=g(x1,x2);
        x2=x2+increment;
    end
    x1=x1+increment;
end
    subplot(2,2,1);
    contour(y1,12,'color','k');
    hold on;
    [c]=contour(yg,'color','k');
    clabel(c);
    
    x1Min=-1.786502;
    x2Min=0.524388;
    
    scatter(x1Min+20,x2Min+20, 'marker face color','r');
    hold off;
    title('f(x1,x2) and g(x1,x2); case: Rp=0.1');
    xlabel('-10<x1<10');
    ylabel('-10<x2<10');
    
    subplot(2,2,2);
    contour(y2,20,'color','k');
    hold on;
    
    [c]=contour(yg,'color','k');
    clabel(c);
    
    x1Min=-2.163331;
    x2Min=0.565068;
    
    scatter(x1Min+20, x2Min+20,'marker face color','r');
    hold off;
    title('f(x1,x2) and g(x1,x2); case: Rp=1.5');
    xlabel('-10<x1<10');
    ylabel('-10<x2<10');
    
    subplot(2,2,3);
    contour(y3,20,'color','k');
    hold on;
    
    [c]=contour(yg,'color','k');
    clabel(c);
    x1Min=-2.186094;
    x2Min=0.569595;
    
    scatter(x1Min+20,x2Min+20, 'marker face color','r');
    hold off;
    title('f(x1,x2) and g(x1,x2); case: Rp=5.0');
    xlabel('-10<x1<10');
    ylabel('-10<x2<10');
    subplot(2,2,4);
    contour(y4,20,'color','k');
    hold on;
    
    [c]=contour(yg,'color','k');
    clabel(c);
    x1Min=-2.197439;
    x2Min=0.566585;
    scatter(x1Min+20, x2Min+20,'marker face color','r');
    hold off;
    
    title('f(x1,x2) and g(x1,x2); case: Rp=19.0');
    xlabel('-10<x1<10');
    ylabel('10<x2<10');
    
        