function [dem] = DemSoLuong(array,sizeArray,n)
    % Dem so phan tu trong 1 array
    dem=0;
    for i = 1:sizeArray
        if n==array(i) dem=dem+1;
        end
    end
end

