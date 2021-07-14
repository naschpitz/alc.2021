function jogo_vw(A)
    n,m=size(A)
    errow=0

    bv=randn(n,1)
    cv=randn(m,1)
    
    bw=randn(m,1)
    cw=randn(n,1)
       
    for i=1:100
        cv=melhores_coords(A,bv)
        bw=cv
        cw=melhores_coords(A',bw)
        bv=cw
        
        errow=norm(A'-bw*cw')
        #print(errow, "\n")
    end
    
    return bv,cv, errow
end