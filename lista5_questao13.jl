using LinearAlgebra
# Questão 13 da Lista 5 
# Escreva a matriz correspondente a cada uma das transformações lineares descritas abaixo:

# (a) a projeção no R³ sobre o plano x = 0
function projecaoR3PlanoX0(vetores)
    linhas, colunas = size(vetores)
    vetoresTransformados = zeros( linhas, colunas)
    
    matrizTransformacao = [0 0 0; 0 1 0; 0 0 1]
    
    for i in 1:(colunas)
         vetoresTransformados[:,i]= matrizTransformacao * vetores[:,i]
    end 
    
   return vetoresTransformados
end

# (b) a reflexão no R³ cujo espelho é o plano de equação x=y 
function reflexaoR3PlanoXY(vetores)
    linhas, colunas = size(vetores)
    vetoresTransformados = zeros( linhas, colunas)
    
    matrizTransformacao = [0 1 0; 1 0 0; 0 0 1]
    
    for i in 1:(colunas)
         vetoresTransformados[:,i]= matrizTransformacao * vetores[:,i]
    end 
    
   return vetoresTransformados
end

# (b) a reflexão no R³ de eixo (1,0,0) por um ângulo de pi/3 radianos, no sentido
#  definido pela regra da mão direito v no sentido do polegar 
function rotacaoEixoXR3(vetores, grau)
    linhas, colunas = size(vetores)
    vetoresTransformados = zeros( linhas, colunas)
    
    matrizTransformacao = [1 0 0; 0 cos(grau) -sin(grau); 0 sin(grau) cos(grau)]
    
    for i in 1:(colunas)
         vetoresTransformados[:,i]= matrizTransformacao * vetores[:,i]
    end 
    
   return vetoresTransformados
end

# Exemplos de input: 
# vetores = [1 2 3; 2 3 1; 3 1 2]
# projecaoR3PlanoX0(vetores)
# reflexaoR3PlanoXY(vetores)
# rotacaoEixoXR3(vetores,pi/3)