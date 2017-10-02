function savenprime( n )
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
    rArray=findprime(n);
    strFileName=['prime',num2str(n),'.mat'];
    save(strFileName,'rArray');
    

end

