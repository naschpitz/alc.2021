using LinearAlgebra
using Images # read and show images, more info here: https://github.com/JuliaImages/Images.jl
using JLD # used for File I/O, more info here: https://github.com/JuliaIO/JLD.jl
using Plots

function minQuad_retaH(V)
    m, n = size(V)
    
    A = ones(1, n)'
    b = V[m,:]

    M = A'*A
    c = A'*b

    x = M\c
    
    return x
end

# Como ja existe uma função que retorna o posto de qualquer matriz, fiz uma função que retorna uma bandeira dado o posto
function bandeira_de_posto(posto) # Funcao para solucionar a questão 8 para quaisquer valroes
    if posto == 1
        alemanha=[0 0 0 0 0 0 0 0 0 0 0 0 0 0;
          0 0 0 0 0 0 0 0 0 0 0 0 0 0;
          0 0 0 0 0 0 0 0 0 0 0 0 0 0;
          0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5;
          0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5;
          0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5 0.5;
          0.75 0.75 0.75 0.75 0.75 0.75 0.75 0.75 0.75 0.75 0.75 0.75 0.75 0.75;
          0.75 0.75 0.75 0.75 0.75 0.75 0.75 0.75 0.75 0.75 0.75 0.75 0.75 0.75;
          0.75 0.75 0.75 0.75 0.75 0.75 0.75 0.75 0.75 0.75 0.75 0.75 0.75 0.75]
        return alemanha
    elseif posto == 2
        dinamarca=[0 0 0 0 1 1 0 0 0 0 0 0 0 0;
           0 0 0 0 1 1 0 0 0 0 0 0 0 0;
           0 0 0 0 1 1 0 0 0 0 0 0 0 0;
           1 1 1 1 1 1 1 1 1 1 1 1 1 1;
           1 1 1 1 1 1 1 1 1 1 1 1 1 1;
           0 0 0 0 1 1 0 0 0 0 0 0 0 0;
           0 0 0 0 1 1 0 0 0 0 0 0 0 0;
           0 0 0 0 1 1 0 0 0 0 0 0 0 0;
           0 0 0 0 1 1 0 0 0 0 0 0 0 0]
        return dinamarca
    elseif posto == 3
        grecia=[0 0 1 0 0 0 0 0 0 0 0 0 0 0;
        0 0 1 0 0 1 1 1 1 1 1 1 1 1;
        1 1 1 1 1 0 0 0 0 0 0 0 0 0;
        0 0 1 0 0 1 1 1 1 1 1 1 1 1;
        0 0 1 0 0 0 0 0 0 0 0 0 0 0;
        1 1 1 1 1 1 1 1 1 1 1 1 1 1;
        0 0 0 0 0 0 0 0 0 0 0 0 0 0;
        1 1 1 1 1 1 1 1 1 1 1 1 1 1;
        0 0 0 0 0 0 0 0 0 0 0 0 0 0]
        return grecia
    elseif posto == 4
        japao=[1 1 1 1 1 1 1 1 1 1 1 1 1;
        1 1 1 1 1 0 0 0 1 1 1 1 1;
        1 1 1 1 0 0 0 0 0 1 1 1 1;
        1 1 1 0 0 0 0 0 0 0 1 1 1;
        1 1 1 0 0 0 0 0 0 0 1 1 1;
        1 1 1 0 0 0 0 0 0 0 1 1 1;
        1 1 1 1 0 0 0 0 0 1 1 1 1;
        1 1 1 1 1 0 0 0 1 1 1 1 1;
        1 1 1 1 1 1 1 1 1 1 1 1 1]
        return japao
    elseif posto == 5
        guatemala=[0.5 0.5 0.5 1 1 1 1 1 1 1 1 0 0 0;
        0.5 0.5 0.5 1 1 1 1 1 1 1 1 0 0 0;
        0.5 0.5 0.5 1 0 1 0 1 0 1 1 0 0 0;
        0.5 0.5 0.5 1 0 0 0 1 0 1 1 0 0 0;
        0.5 0.5 0.5 1 0 1 0 1 0 1 1 0 0 0;
        0.5 0.5 0.5 1 1 0 0 0 1 1 1 0 0 0;
        0.5 0.5 0.5 1 1 1 0 1 1 1 1 0 0 0;
        0.5 0.5 0.5 1 1 1 1 1 1 1 1 0 0 0;
        0.5 0.5 0.5 1 1 1 1 1 1 1 1 0 0 0]
        return guatemala
    elseif posto == 6
        mexico=[0.5 0.5 0.5 1 1 1 1 1 1 1 1 0 0 0;
        0.5 0.5 0.5 1 1 1 1 0 1 1 1 0 0 0;
        0.5 0.5 0.5 1 1 0 0 0 0 1 1 0 0 0;
        0.5 0.5 0.5 1 1 1 0 0 1 1 1 0 0 0;
        0.5 0.5 0.5 1 0 1 0 1 0 1 1 0 0 0;
        0.5 0.5 0.5 1 1 0 1 0 1 1 1 0 0 0;
        0.5 0.5 0.5 1 1 1 0 1 1 1 1 0 0 0;
        0.5 0.5 0.5 1 1 1 1 1 1 1 1 0 0 0;
        0.5 0.5 0.5 1 1 1 1 1 1 1 1 0 0 0]
        return mexico
    elseif posto == 7
        jamaica=[0.5 0.5 0.5 1 1 1 1 1 1 1 1 0.5 0.5 0.5;
        0 0 0.5 0.5 0.5 1 1 1 1 0.5 0.5 0.5 0 0;
        0 0 0 0 0.5 0.5 0.5 0.5 0.5 0.5 0 0 0 0;
        0 0 0 0 0 0.5 0.5 0.5 0.5 0 0 0 0 0;
        0 0 0 0.5 0.5 0.5 1 1 0.5 0.5 0.5 0 0 0;
        0 0.5 0.5 0.5 1 1 1 1 1 1 0.5 0.5 0.5 0;
        0.5 0.5 1 1 1 1 1 1 1 1 1 1 0.5 0.5;
        0.5 1 1 1 1 1 1 1 1 1 1 1 1 0.5;]
        return jamaica
    elseif posto == 8
        congo=[1 1 1 1 1 1 1 1 1 1 1 0.5 0.5 0.5;
        1 1 1 1 1 1 1 1 1 0.5 0.5 0.5 0 0;
        1 1 1 1 1 1 1 0.5 0.5 0.5 0 0 0 0;
        1 1 1 1 1 0.5 0.5 0.5 0 0 0 0 0 0;
        1 1 1 0.5 0.5 0.5 0 0 0 0 0 0 0 0;
        1 0.5 0.5 0.5 0 0 0 0 0 0 0 0 0 0;
        0.5 0.5 0 0 0 0 0 0 0 0 0 0 0 0;
        0.5 0 0 0 0 0 0 0 0 0 0 0 0 0;]
        return congo
    else
        return "O limite dessa função e 8."
    end
end

function plano(M) #Recebe uma matriz
    m,n=size(M)
        
    VImp=zeros(2,1)
            
    for i in 1:n
        VImp=M[:,i]
        println("$VImp")
        plano_cartesiano(VImp') #Envia um vetor (2,1)
    end
end