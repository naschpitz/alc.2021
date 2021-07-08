#lista_2, exercício 1
#generalização do qr para matriz quadrada de outras dimensões

function qr_2(A)
    m, n=size(A) 
    Q=zeros(m,n) 
    for i in 1:(m) 
        Q[:,i]=A[:,i] 
        
        for j in 1:(i-1) 
            pij=projecao(A[:,i], Q[:,j]) #projeção de A[:,i] em Q[:,j], atribuindo em pij (vetor)
            Q[:,i]=Q[:,i]-pij # ortogonalizando
        end
        Q[:,i]=normalizar(Q[:,i]) #normaliza a coluna Q[:,i]
    end
    
    R=Q'*A #obtendo uma matriz triangular superior pela multiplicação da matriz ortogonal Q e a matriz de entrada A
    return Q, R 
end
