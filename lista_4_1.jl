#lista_4, exercicío 1

function lu_2(A)
    m,n = size(A) 
    l = zeros(m,m) 
    u = zeros(m,n) 
    k = min(m,n) 
    for i=1:k #o for irá executar até o menor número seja ele da linha ou da coluna de entrada
        l[:,i]=A[:,i]/A[i,i] #colunas de l recebendo a divisão da coluna i 
        u[i,:]=A[i,:]
        A=A-l[:,i]*u[i,:]'
    end
    return l,u
end 