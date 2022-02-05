[x1,x2]=meshgrid(-3:0.1:3,-3:0.1:3);
f=2*x1+x2+(x1.^2-x2.^2)+(x1-x2.^2).^2;
g=8*x1-6*x2+21;
subplot(2,1,1);
surf(x1,x2,f);
hold on;

surf(x1,x2,g);
hold off;
title('The 3D display of f(x1,x2) and g(x1,x2)');
xlabel('-3<x1<3');
ylabel('-3<x1<3');

subplot(2,1,2);
[c]=contour(x1,x2,f,'-','color','k');
clabel(c);
hold off;
title('The contours of f(x1,x2) and g(x1,x2)');
xlabel('-3<x1<3');
ylabel('-3<x1<3');
