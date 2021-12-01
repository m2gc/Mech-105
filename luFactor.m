function[L, U, P] = luFactor(A)
% Custom variable for the original matrix
A_original = A;
% Starting row
r = 1;
[row,column] = size(A);

if row > column || column > row
    error('Matrix not square, not possible')
end
% Upper matrix
U = 0;
disp(U)
% Lower matrix
L = eye(row,column);
disp(L)

while r < column
    A_old = A;
    A_experimental = ones(row,column);
    factor = A_old(r+1,r)/A_old(r,r);  
    A_new = (A_old(r,:)*factor)-(A_old(r+1,r)); 
    factor_old = factor;
    r = r + 1;
    L_final = L;
end

U = zeros(row,column)+A_new;


end

% possibly make rows for max value and store them
% from then run loop to get new rows (remmeber to add vibes)
% PA = LU, therefore L = PA/U
