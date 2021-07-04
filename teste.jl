using Plots: print
using LinearAlgebra
using Base: func_for_method_checked

include("lista1.jl")
include("lista2.jl")
include("lista3.jl")

# (Fábio) Testando a Função da Lista 2 Número 9:
# v1 = [5;5]
# v2 = [5;0]
# produtoInterno_Angulo(v1, v2)
################################################

# (Fábio) Testando a Função da Lista 3 Número 8:
# temp_bordas  = [25; 20; 20; 30]
# quant_pontos = 25
# lago_fabio(Int(sqrt(quant_pontos)), temp_bordas)
################################################

# (Fábio) Testando a Função da Lista 3 Número 4:
#idade_dos_amigos()
################################################

################################################
# (Bruno) Testando a Função da Lista 1 Número 2

#Testando com valores B e C de questões anteriores.
B = [1 3 5; 4 5 9; 3 5 8]
C = [1 0 0 0 1; 0 1 0 0 10; 0 0 1 1000 0]

E, F = getEF(B, C)

println(B*C == E*F)

################################################

################################################
# (Bruno) Testando a Função da Lista 1 Número 3

V = [1 1 11 01 11 2 13 2; 1 2 12 102 21 3 10 2; 1 3 13 103 31 4 7 2; 1 4 14 104 41 5 4 3]

B = getBase(V)

println(B)

anotherB = getAnotherBase(B)

println(anotherB)

################################################



################################################
# (Bruno) Testando a Função da Lista 3 Número 8:
#Teste com a matriz da letra "a"

A = zeros(2, 2)
b = [5; 15; 35; 10]

I, B = interpolate(A, b)

println(I)
println(B)
################################################
