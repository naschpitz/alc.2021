using LinearAlgebra
include("plots.jl")

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

function transformações_RPQ(M, T)                           # Número 2 da Lista 5. (Fábio)
    if dot(M[:,1], M[:,2]) > 1e-8                           # Verifica se são ortogonais...
        println("Vetores não são ortogonais!!!")            # ...Senão for, imprime mensagem de erro e termina
    else                                                    # ...Se for continua...
        A1 = M * T                                          # Aplica a transformação na matriz
        vel1 = 0.02*(M-A1)                                  # Calibra velocidade da animação
        
        @gif for i in 1:51                                  # Anima a transformação...
            plano_cartesiano(M)
            annotate!(M[1,1], M[2,1]-1, text("r", 12))
            annotate!(M[1,2], M[2,2]-1, text("s", 12))
            M -= vel1
        end
    end
end

function matriz_transformação(x, b) # Número 3 da Lista 5. (Fábio)
    return b/x
end
