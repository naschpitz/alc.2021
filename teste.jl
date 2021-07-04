using Base: func_for_method_checked
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
idade_dos_amigos()
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
