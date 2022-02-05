function [val]=pseudo_f(x,y,Rp)
val=f(x,y)+Rp*(-log(-g1(x,y)));
return
end