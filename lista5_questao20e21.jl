
# Escreva as matrizes das seguintes transformações lineares e calcule o volume do resultado 
# da aplicação de cada transformação ao cubo unitário

function normaVetor(vetor)
    return sqrt(vetor' * vetor)
end

function calculaVolume(vetores)
    linhas, colunas = size(vetores)
    norma = zeros(colunas,1)
    
    norma[1,1] = normaVetor(vetores[:,1])
    norma[2,1] = normaVetor(vetores[:,2])
    norma[3,1] = normaVetor(vetores[:,3])
    
    return norma[1,1]*norma[2,1]*norma[3,1]
end

function rotacaoEixoXR3(vetores, grau)
    linhas, colunas = size(vetores)
    vetoresTransformados = zeros(linhas, colunas)
    
    matrizTransformacao = [1 0 0; 0 cos(grau) -sin(grau); 0 sin(grau) cos(grau)]
    
    for i in 1:(colunas)
         vetoresTransformados[:,i] = matrizTransformacao * vetores[:,i]
    end
    return calculaVolume(vetores), calculaVolume(vetoresTransformados)
end 

function rotacaoEixoYR3(vetores, grau)
    linhas, colunas = size(vetores)
    vetoresTransformados = zeros(linhas, colunas)
    
    matrizTransformacao = [cos(grau) 0 -sin(grau); 0 1 0; sin(grau) 0 cos(grau)]
    
    for i in 1:(colunas)
         vetoresTransformados[:,i] = matrizTransformacao * vetores[:,i]
    end
    
   return calculaVolume(vetores), calculaVolume(vetoresTransformados)
end 

function rotacaoEixoZR3(vetores, grau)
    linhas, colunas = size(vetores)
    vetoresTransformados = zeros(linhas, colunas)
    
    matrizTransformacao = [cos(grau) -sin(grau) 0; sin(grau) cos(grau) 0; 0 0 1]
    
    for i in 1:(colunas)
         vetoresTransformados[:,i] = matrizTransformacao * vetores[:,i]
    end
    
   return calculaVolume(vetores), calculaVolume(vetoresTransformados)
end 

function letraA(vetores)
    linhas, colunas = size(vetores)
    vetoresTransformados = zeros(linhas, colunas)
    
    matrizTransformacao = [2 0 0; 0 1/4 0; 0 0 -4]
    
    for i in 1:(colunas)
         vetoresTransformados[:,i] = matrizTransformacao * vetores[:,i]
    end
    return calculaVolume(vetores), calculaVolume(vetoresTransformados)
end 

function letraB(vetores)
    linhas, colunas = size(vetores)
    vetoresTransformados = zeros(linhas, colunas)
    
    matrizTransformacao = [0 1 0; 1 0 0; 0 0 1]
    
    for i in 1:(colunas)
         vetoresTransformados[:,i] = matrizTransformacao * vetores[:,i]
    end
    return calculaVolume(vetores), calculaVolume(vetoresTransformados)
end 

function letraC(vetores)
    linhas, colunas = size(vetores)
    vetoresTransformados = zeros(linhas, colunas)
    
    matrizTransformacao = [0 0 0; 0 0 0; 0 0 vetores[3,3]]
    
    for i in 1:(colunas)
         vetoresTransformados[:,i] = matrizTransformacao * vetores[:,i]
    end
    return calculaVolume(vetores), calculaVolume(vetoresTransformados)
end 

# Exemplos de input:
# rotacaoEixoXR3([1 0 0;0 1 0;0 0 1], pi/4)
# rotacaoEixoYR3([1 0 0;0 1 0;0 0 1], pi/2)
# rotacaoEixoZR3([1 0 0;0 1 0;0 0 1], pi/6)
# letraA([1 0 0;0 1 0;0 0 1])
# letraB([1 0 0;0 1 0;0 0 1])
# letraC([1 0 0;0 1 0;0 0 4])