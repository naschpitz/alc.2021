using Plots: print
using LinearAlgebra
using Base: func_for_method_checked

include("lista1.jl")
include("lista2.jl")
include("lista3.jl")
include("lista4.jl")
include("lista5.jl")
include("Comum.jl")

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
# B = [1 3 5; 4 5 9; 3 5 8]
# C = [1 0 0 0 1; 0 1 0 0 10; 0 0 1 1000 0]

# E, F = getEF(B, C)

# println(B*C == E*F)

################################################

################################################
# (Bruno) Testando a Função da Lista 1 Número 3

# V = [1 1 11 01 11 2 13 2; 1 2 12 102 21 3 10 2; 1 3 13 103 31 4 7 2; 1 4 14 104 41 5 4 3]

# B = getBase(V)

# println(B)

# anotherB = getAnotherBase(B)

# println(anotherB)

################################################

################################################
# (Bruno) Testando a Função da Lista 2 Número 6

# V = [3 2; 1 2]

# R = GS(V)

# println(R)
################################################

################################################
# (Bruno) Testando a Função da Lista 3 Número 8:
#Teste com a matriz da letra "a"

# A = zeros(2, 2)
# b = [5; 15; 35; 10]

# I, B = interpolate(A, b)

# println(I)
# println(B)
################################################

################################################
# (Bruno) Testando a Função da Lista 4 Número 7:
#Teste com a matriz da letra "a"

# V = [1000 300 6000; 4 6 11]

# a = minQuad_retaH(V)

# println(a)
################################################

################################################
# (Bruno) Testando a Função da Lista 5 Número 5:
#Teste com a matriz da letra "a"

# eigVecs = [1 1 -1; 0 1 2; -1 1 -1]
# eigVals = [1; -2; 2]

# M = getMatrix(eigVecs, eigVals)

# println(M)
# println(M * [-1; 2; -1])
################################################

# (Fábio) Testando a Função da Lista 5 Número 2:
r = [ 5, 5]    # Define r e s...
s = [-5, 5]    # ...estes devem ser ortogonais
R = [-1  0;    # Define a matriz de transformação...
      0  1]    # ...que causa a reflexão de r
P = [ 1  0;    # Define a matriz de transformação...
      0  0]    # ...da projeção ortogonal em r
Q = [ 0  0;    # Define a matriz de transformação...
      0  1]    # ...da projeção ortogonal em s
T = R*P
#transformações_RPQ([r s], T)
################################################

# (Fábio) Testando a Função da Lista 5 Número 3:
# paralelogramo = [0 2 2 4;
#                  0 0 1 1]
# quadrado      = [0 1 0 1;
#                  0 0 1 1]
# print(matriz_transformação(paralelogramo, quadrado))
################################################

# (Roberta) Testando a Função da Lista 1 Número 1:
#A=rand(3,3)
#B, C=geraMatriz(A)
#PL=B*C
#calcNorm(A, PL)
################################################

# (Roberta/Tainá) Testando a Função da Lista 3 Número 7:
#Tomografia1=[1; 3; 2; 4; 2; 5] #Eq(6)<Var(9)=infinitas soluções
#Corpo1=[1 1 0 1 0 0 0 0 0;
#        0 0 1 0 1 1 0 1 0;
#        0 0 0 0 0 0 1 0 1;
#        0 0 1 1 0 0 1 0 0;
#        0 1 0 0 1 1 0 0 0;
#        1 0 0 0 0 0 0 1 1]
#VD=CalcDefVari(Corpo1, Tomografia1)

#Tomografia2=[1; 1; 2; 1; 2; 1; 2; 2] #Eq=Var (9) 
#Corpo2=[0 1 0 0 0 0 0 0 0;
#        0 0 0 0 1 0 0 0 0;
#        0 0 0 0 0 0 1 0 1;
#        0 0 0 0 0 0 1 0 0;
#        0 1 0 0 1 0 0 0 0;
#        0 0 0 0 0 0 0 0 1; #Inserimos as equações diagonais (3)
#        0 0 0 0 1 0 0 0 1;
#        0 0 0 0 1 0 1 0 0]
#VD=CalcDefVari(Corpo2, Tomografia2)
################################################


# (Fulaninho) Testando a Função da Lista X Número X:
#Seu Código Aqui
################################################