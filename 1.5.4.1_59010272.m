function [ y_out ] = laff_axpy( alpha, x, y )
%LAFF_AXPY Summary of this function goes here
%   Detailed explanation goes here
[ x_r, x_c ] = size( x );
[ y_r, y_c ] = size( y );

if ~isscalar(alpha)
    y_out = 'FAILED';
    return
end
if ~isvector(x)
    y_out = 'FAILED';
    return
end
if ~isvector(y)
    y_out = 'FAILED';
    return
end

if ( x_r ~= 1 && x_c ~= 1 ) || ( y_r ~= 1 && y_c ~= 1 )
    y_out = 'FAILED';
    return
end
if ( x_r * x_c ~= y_r * y_c )
    y_out = 'FAILED';
    return
end

if ( x_c == 1 )     
    if ( y_c == 1 )     
        for i=1:x_r   
            y( i,1 ) = alpha * x( i,1 ) + y(i,1);
        end
    else
        for i=1:x_r   
            y( 1,i ) = alpha * x( i,1 ) + y(i,1);
        end
    end
else
    if ( y_c == 1 )
        for i=1:x_c   
            y( i,1 ) = alpha * x( 1,i ) + y(i,1);
        end
    else
        for i=1:x_c   
            y( 1,i ) = alpha * x( 1,i ) + y(1,i);
        end
    end
end

y_out = y;

return
end