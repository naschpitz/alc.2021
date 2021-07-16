# Questão 13 - Lista 2

# Determine em graus, o valor do ângulo formado entre a diagonal de um cubo e um dos extremos
# laterais do cubo (tanto a diagonal quanto o extremo da lateral considerados iniciam no mesmo
# ponto extremo).
# O ângulo entre dois vetores no R² e R³, pode ser calculado através da seguinte fórmula:
# <u,v> = |v|·|u|·cos φ

function normaVetor(vetor)
    return sqrt(vetor' * vetor)
end

function anguloEntreVetores(u,v)
    linhas, colunas = size(u)
    produtoInterno = 0
    
    for i in 1:(colunas)
        produtoInterno += u[linhas,i] * v[linhas,i]
    end
    
    cosseno = produtoInterno / (normaVetor(u') * normaVetor(v'))
    angulo = acos(cosseno)
    
   return rad2deg(angulo)
end

function diagonalCubo(cubo)
    return (cubo[:,1] + cubo[:,2] + cubo[:,3])
end

# Exemplos de input: 
# cubo = [ 1 0 0; 0 1 0; 0 0 1]
# anguloEntreVetores(cubo[:,1]', diagonalCubo(cubo)')