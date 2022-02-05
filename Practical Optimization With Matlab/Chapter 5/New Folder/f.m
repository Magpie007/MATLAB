function [val]=f(x1,x2)
val=2*x1+x2+(x1.^2-x2.^2)+(x1-x2.^2).^2;
return;
end