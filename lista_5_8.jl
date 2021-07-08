#lista 5 exercício 8
#recebe uma matriz A e um vetor v. gera uma matriz ortogonal Q a partir de A. calcula a norma de v e de Q*v
#possibilitando verificar que a norma não muda

function NAN(A,v)
    tm1=zeros()
    tm2=zeros()
     
    Q,R=qr(A)
    
    tm1=norm(Q*v)
    tm2=norm(v)
    
    return tm1, tm2
end