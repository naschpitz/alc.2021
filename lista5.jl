function getMatrix(eigVecs, eigVals)
    n = length(eigVals)
    
    V = eigVecs
    D = zeros(n,n)
    
    for i in 1:n
        D[i,i] = eigVals[i]
    end
    
    M = V*D*inv(V)
    
    return M
end