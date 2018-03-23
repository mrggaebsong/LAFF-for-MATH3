function [ alpha ] = laff_dot( x, y )
%LAFF_DOT Summary of this function goes here
%   Detailed explanation goes here

[x_r, x_c] = size(x);
[y_r, y_c] = size(y);

if ~isvector(x)
    alpha = 'FAILED';
    return
end

if ~isvector(y)
    alpha = 'FAILED';
    return
end

if ( x_r ~= 1 && x_c ~= 1 ) || ( y_r ~= 1 && y_c ~= 1 )
    alpha = 'FAILED';
    return
end
if ( x_r * x_c ~= y_r * y_c )
    alpha = 'FAILED';
    return
end

alpha = 0;

if ( x_c == 1 )     
    if ( y_c == 1 )     
        for i=1:x_r
            alpha = alpha + x(i,1) * y(i,1);
        end
    else
        for i=1:x_r   
            alpha = alpha + x(i,1) * y(1,i);
        end
    end
else
    if ( y_c == 1 )
        for i=1:x_c   
            alpha = alpha + x(1,i) * y(i,1);
        end
    else
        for i=1:x_c   
            alpha = alpha + x(1,i) * y(1,i);
        end
    end
end

return
end