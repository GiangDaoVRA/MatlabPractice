function m = isprime( n )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
    count = 0;
    for i =1:n
        if(mod(n,i)==0)
            count = count+1;
        end
    end
    m=(count==2);
end

