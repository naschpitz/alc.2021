using LinearAlgebra

function getEF(B, C)
    E = convert(Array{Float64}, B)
    F = convert(Array{Float64}, C)
    E[:, 1] = B[:, 1] / 2
    F[1, :] = C[1, :] * 2
    return E, F
end

function getBase(V)
    F = qr(V)
    return F.Q
end

function getAnotherBase(B)
    m,n = size(B)
    newB = zeros(m,n)

    for i in 1:m
        newB[:,i] = B[:,i] * rand()
    end

    return newB
end

function geraMatriz(A) #funciona para qualquer matriz quadrada
    m,n=size(A)
    p=rank(A) #Posto de A a fim de garantir o menor p possível
    B=rand(m,p)
    C=B\A #Encontrar a matriz de coordenadas
    return B, C
end