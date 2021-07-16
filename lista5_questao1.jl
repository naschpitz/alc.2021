using LinearAlgebra
using Pkg
Pkg.add("Plots")

using Plots
gr()

function pegarPontos()
    return [2 2 3 4 4 4 4 4 4 2 3 5 6; 0 1 0 0 1 2 3 4 5 5 5 5 5]
 end 

function exibirTransformacaoR2(pontos ,pontosTransformados)
    imagem1 = scatter(pontos[1,:],pontos[2,:], title = "Antes da transformação")
    imagem2 = scatter(pontosTransformados[1,:],pontosTransformados[2,:], title = "Após a transformação")
    scatter(imagem1, imagem2, layout = (1, 2), label = "")
end

function cisalhamentoR2()
    pontos = pegarPontos()
    linhas, colunas = size(pontos)
    pontosTransformados = zeros(linhas, colunas)
    
    matrizTransformacao =[1 1; 0 1]
    
    for i in 1:(colunas)
        pontosTransformados[:,i] = matrizTransformacao * pontos[:,i]
    end
    
    exibirTransformacaoR2(pontos, pontosTransformados)
end

function esticamentoR2()
    pontos = pegarPontos()
    linhas, colunas = size(pontos)
    pontosTransformados = zeros(linhas, colunas)
    
    matrizTransformacao = [2 0; 0 2]
    
    for i in 1:(colunas)
        pontosTransformados[:,i] = matrizTransformacao * pontos[:,i]
    end
    
    exibirTransformacaoR2(pontos, pontosTransformados)
end

function encolhimentoR2()
    pontos = pegarPontos()
    linhas, colunas = size(pontos)
    pontosTransformados = zeros(linhas, colunas)
    
    matrizTransformacao = [0.5 0; 0 0.5]
    
    for i in 1:(colunas)
        pontosTransformados[:,i] = matrizTransformacao * pontos[:,i]
    end
    
    exibirTransformacaoR2(pontos, pontosTransformados)
end

function reflexaoR2()
    pontos = pegarPontos()
    linhas, colunas = size(pontos)
    pontosTransformados = zeros(linhas, colunas)
    
    matrizTransformacao = [0 1; 1 0]
    
    for i in 1:(colunas)
        pontosTransformados[:,i] = matrizTransformacao * pontos[:,i]
    end
    
    exibirTransformacaoR2(pontos, pontosTransformados)
end

function rotacaoR2(graus)
    pontos = pegarPontos()
    linhas, colunas = size(pontos)
    pontosTransformados = zeros(linhas, colunas)
    
    matrizTransformacao = [cos(graus) -sin(graus); sin(graus) cos(graus)]
    
    for i in 1:(colunas)
        pontosTransformados[:,i] = matrizTransformacao * pontos[:,i]
    end
    
    exibirTransformacaoR2(pontos, pontosTransformados)
end

function projecaoEixoXR2()
    pontos = pegarPontos()
    linhas, colunas = size(pontos)
    pontosTransformados = zeros(linhas, colunas)
    
    matrizTransformacao = [1 0; 0 0]
    
    for i in 1:(colunas)
        pontosTransformados[:,i] = matrizTransformacao * pontos[:,i]
    end
    
    exibirTransformacaoR2(pontos, pontosTransformados)
end

function projecaoEixoYR2()
    pontos = pegarPontos()
    linhas, colunas = size(pontos)
    pontosTransformados = zeros(linhas, colunas)
    
    matrizTransformacao = [0 0; 0 1]
    
    for i in 1:(colunas)
        pontosTransformados[:,i] = matrizTransformacao * pontos[:,i]
    end
    
    exibirTransformacaoR2(pontos, pontosTransformados)
end

# Exemplos de input: 
# cisalhamentoR2()
# esticamentoR2()
# encolhimentoR2()
# reflexaoR2()
# rotacaoR2(pi/6)
# rotacaoR2(pi/4)
# rotacaoR2(pi/3)
# rotacaoR2(pi/2)
# projecaoEixoXR2()
# projecaoEixoYR2()