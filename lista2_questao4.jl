using LinearAlgebra

# Questão 4 - Lista 2 
# Seja P o plano gerado por [3;0;-1] e [8;5;6]


# (a) Determine uma normal para o P. 
# 
# Para fazer essa questão, utilizaremos produto vetorial: 
#     |  i  j  k  |  i  j  |
# D = |  3  0 -1  |  3  0  |
#     |  8  5 -6  |  8  5  |

function vetorNormalPlano(base)
    a = base[1,2] * base[2,3] - base[2,2] * base[1,3]
    b = base[1,3] * base[2,1] - base[2,3] * base[1,1]
    c = base[1,1] * base[2,2] - base[2,1] * base[1,2]
    vetorNormal = [a; b; c]
    return vetorNormal   
end

# (b) (d) Determinar vetor que é projeção ortogonal de um vetor ao plano
function normaVetor(vetor)
    return sqrt(vetor' * vetor)
end

function distanciaPontoPlano(base, ponto)
    vetorNormal = vetorNormalPlano(base)
    distancia = abs(vetorNormal' * ponto) / normaVetor(vetorNormal)
    return distancia
end


# (c) (e) Determinar a distância de um ponto a um plano
function projecao(a,b)
    return ((a'*b)/(b'*b))'*b
end