leftBound=-1.5;
rightBound=3.5;
increment=0.1;
incrementRp=4;
n=floor((rightBound-leftBound)/increment);
func=zeros(1,n);
j=1;
for i=leftBound:increment:rightBound
    func(1,j)=f(i);
    j=j+1;
end

plot(func,'color','black','linewidth',2);
hold on;

rp=1;
for m=1:3
    pseudoFunc=zeros(1,n);
    j=1;
    for i=leftBound:increment:rightBound
        if g1(i)<=0
            pseudoFunc(1,j)=f(i);
        else
            pseudoFunc(1,j)=f(i)+rp*(g1(i))^2;
        end
        j=j+1;
    end
    
    plot(pseudoFunc,'color','red');
    
    rp=rp+incrementRp;
end

line([0 60],[0 0],'color','black');
n=floor((rightbound-leftBound)/increment);
constraint_g=zeros(1,n);
j=1;
for i=leftBound:increment:rightBound
    constraint_g(1,j)=g1(i);
    j=j+1;
end

plot
hold off;