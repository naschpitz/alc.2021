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