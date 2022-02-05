n=200;
y1=zeros(n,n);y2=zeros(n,n);
y3=zeros(n,n);y4=zeros(n,n);
yg=zeros(n,n);
increment=0.1;

Rp=[16.0,11.0,6.0,0.1];
x1=-10.0;
for i=1:n
    x2=-10;
    for j=1:n
        if g(x1,x2)>=0
            y1(i,j)=pseudo_f(x1,x2,Rp(1));
            y2(i,j)=pseudo_f(x1,x2,Rp(2));
            y3(i,j)=pseudo_f(x1,x2,Rp(3));
            y4(i,j)=pseudo_f(x1,x2,Rp(4));
        elseif g(x1,x2)<0
            y1(i,j)=f(x1,x2);y2(i,j)=f(x1,x2);
            y3(i,j)=f(x1,x2);y4(i,j)=f(x1,x2);
        end
        yg(i,j)=g(x1,x2);
        x2=x2+increment;
    end
    x1=x1+increment;
end
subplot(2,2,1);
contour(y1,6,'color','k');
hold on;
[c]=contour(yg,'color','k');
clabel(c);
hold off;
title('f(x1,x2) and g(x1,x2); case:Rp=16.0');
xlabel('-10<x1<10'); ylabel('-10<x2<10');
subplot(2,2,2);
contour(y2,6,'color','k');
hold on;
[c]=contour(yg,'color','k');
clabel(c);
hold off;
titel('f(x1,x2)and g(x1,x2); case:Rp=11.0')
xlabel('-10<x1<10');ylabel('10<x2<10');
subplot(2,2,3);
contour(y3,6,'color','k');
hold on;
[c]=contour(yg,'color','k');
clabel(c);
hold off;
title('f(x1,x2)and g(x1,x2);case:Rp=6.0');
xlabel('-10<x1<10'); ylabel('-10<x2<10');
subplot(2,2,4);
contour(y4,6,'color','k');
clabel(c);
hold off;
title('f(x1,x2) and g(x1,x2); case:Rp=0.1');
xlabel('-10<x1<10');
ylabel('-10<x2<10');

            