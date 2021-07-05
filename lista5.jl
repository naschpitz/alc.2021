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

function transformações_RPQ(M, T1, T2=nothing)                  # Número 2 da Lista 5. (Fábio)
    v1 = M[:,1]                                                 # Pega o primeiro vetor e armazena em v1
    v2 = M[:,2]                                                 # Pega o segundo vetor e armazena em v2
    if dot(v1, v2) != 0                                         # Verifica se são ortogonais...
        println("Vetores não são ortogonais!!!")                # ...Senão for, imprime mensagem de erro e termina
    else                                                        # ...Se for continua...
        A1 = T1 * v1                                            # Aplica primeira transformação no primeiro vetor
        vel1 = 0.02*(v1-A1)                                     # Calibra velocidade da animação
        n = 51

        if  T2 !== nothing                                      # Se houver uma segunda transformação...
            A2 = T2 * v2                                        # Faz os cálculos pra ela também
            vel2 = 0.02*(v2-A2)
            n = 101
        end
        
        @gif for i in 1:n                                       # Anima a transformação...
            M = [v1 v2]
            if i < 52
                plano_cartesiano(M)
                annotate!(M[1,1], M[2,1]-1, text("r", 12))
                annotate!(M[1,2], M[2,2]-1, text("s", 12))
                v1 -= vel1
            else
                plano_cartesiano(M)
                annotate!(M[1,1], M[2,1]-1, text("r", 12))
                annotate!(M[1,2], M[2,2]-1, text("s", 12))
                v2 -= vel2
            end
        end
    end
end
