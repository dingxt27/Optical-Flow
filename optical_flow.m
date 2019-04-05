function [u,v] = optical_flow(I1,I2,windowsize)

%gradient of x and y direction 
dx = conv2(I1,double([-1 1;-1 1]), 'valid');
dy = conv2(I1,double([-1 -1;1 1]), 'valid');
%It
dt = conv2(I2,double([1 1;1 1]), 'valid') + conv2(I1, double(-1*[1 1;1 1]), 'valid');

u = zeros(size(I1));
v = zeros(size(I1));

m = round(windowsize/2);
n = size(dx,1);

for i = m:n-m
    for j = m:n-m%j = m:n-m+1
         s = windowsize^2;
         %reshape Ix,Iy,It to s^2*1
        Ix = reshape(dx(i-m+1:i+m-1,j-m+1:j+m-1),s,1);
        Iy = reshape(dy(i-m+1:i+m-1,j-m+1:j+m-1),s,1);
        It = reshape(dt(i-m+1:i+m-1,j-m+1:j+m-1),s,1);
        
        A = [Ix Iy];
        b = -It;
        %threshold checking
        e = min (eig (transpose(A)*A));
%         rank (A'*A)
        T = 0.01;
        if T <= e 
            uv = pinv(A)*b;
            u(i,j) = uv(1);
            v(i,j) = uv(2);
        end
    end
end



        
        
        
        
        
        
        
