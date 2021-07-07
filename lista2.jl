using LinearAlgebra
using Plots
include("plots.jl")

function uvw(M) # funcao que printa baseada na questao 8 da lista 2. w e verde, v e azul, u e vermelho, r e marrom e a soma e printada
    l, c = size(M)
    if l != 2
        println("Plano Cartesiano deve morar em R2! ;-)")
    elseif c != 2
        println("A matriz deve ter dois vetores de entrada.")
    else
        x = [zeros(21) Vector(-10:10)]
        y = [Vector(-10:10) zeros(21)]
        linecolor=[:black :black]
        lw = [1 1]
        x = [x zeros(21)]
        x[1,3] = M[1,1]
        y = [y zeros(21)]
        y[1,3] = M[2,1]
        linecolor=[linecolor :green]
        lw = [lw 3]
        x = [x zeros(21)]
        x[1,4] = M[1,2]
        y = [y zeros(21)]
        y[1,4] = M[2,2]
        linecolor=[linecolor :blue]
        lw = [lw 3]
        w = M[:,1]
        v = M[:,2]
        u = ((transpose(w)*v)/(transpose(v)*v))*v
        x = [x zeros(21)]
        x[1,5] = u[1]
        y = [y zeros(21)]
        y[1,5] = u[2]
        linecolor=[linecolor :red]
        lw = [lw 2]
        r = v-u
        x = [x zeros(21)]
        x[1,6] = r[1]
        y = [y zeros(21)]
        y[1,6] = r[2]
        linecolor=[linecolor :brown]
        lw = [lw 1]
        s = (transpose(u)*u)+(transpose(r)*r)
        println(s)
        plot(x, y, xlims = (-10, 10), xticks = -10:1:10, ylims = (-10, 10), yticks = -10:1:10, leg=false, linecolor=linecolor, lw=lw)
        
        
    end
end

function produtoInterno_Angulo(v, u)                                        # Número 9 da Lista 2. (Fábio)
    if size(v)[1] != 2 || size(u)[1] != 2                                   # Para satisfazer a letra (c)...
        println("Os vetores devem morar em R^2!")                           # ...testamos se os vetores pertencem a R^2.
    else
        if v[1] < 0 || v[2] < 0 || u[1] < 0 || u[2] < 0                     # Testa se todos os valores (dos vetores v e u)...
            print("Os vetores devem ser não-negativos!")                    # ...não são menores que 0 (não-negativos).
        else
            produtoInterno = dot(v, u)                                      # Calcula o produto interno dos vetores.
            
            cos_theta = produtoInterno / (norm(v) * norm(u))
            rad = acos(cos_theta)
            angulo = rad / (pi / 180)                                       # Calcula o ângulo entre os vetores.
            
            plano_cartesiano([v1 v2])                                       # Desenha os vetores em um plano cartesiano.
            annotate!(5, 10, text("Produto interno: $produtoInterno", 10))  # Imprime o produto interno.
            if produtoInterno == 0                                          # Satisfaz a letra (b), informando que vetores com...
                annotate!(5, 9, text("Vetores são ortogonais", 10))         # ...produto interno igual a 0 são ortogonais.
            end
            
            me = min(v, u)
            ma = max(v, u)
            p = 0.5 * (me + (0.5 * (ma-me)))                                # Calcula uma coordenada para imprimir o ângulo.
            angulo = floor(angulo)                                          # Arredonda o ângulo
            annotate!(p[1], p[2], text("$(angulo)º", 10))                   # Imprime o ângulo.
        end
    end
end

function GS(V)
    m,n = size(V)
    U = zeros(m,n)
    
    for i in 1:m
        sumProj = zeros(m)
        
        for j in 1:i-1
            sumProj += (dot(V[:,i], U[:,j])/dot(U[:,j], U[:,j])) * U[:,j] 
        end
        
        U[:,i] = V[:,i] - sumProj
    end
    
    return U
end



