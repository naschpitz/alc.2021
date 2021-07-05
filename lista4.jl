function minQuad_retaH(V)
    m, n = size(V)
    
    A = ones(1, n)'
    b = V[m,:]

    M = A'*A
    c = A'*b

    x = M\c
    
    return x
end