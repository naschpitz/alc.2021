using LinearAlgebra

function getEF(B, C)
    E = convert(Array{Float64}, B)
    F = convert(Array{Float64}, C)
    E[:, 1] = B[:, 1] / 2
    F[1, :] = C[1, :] * 2
    return E, F
end