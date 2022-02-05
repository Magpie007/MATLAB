function [val]=pseudo_f(x1,x2,Rp)
val=f(x1,x2)+Rp*g(x1,x2)*g(x1,x2);
return;
end