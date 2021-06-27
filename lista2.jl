using LinearAlgebra
include("plots.jl")

function produtoInterno_Angulo(v, u)                                        # Número 9 da Lista 2.
    if size(v)[1] != 2 || size(u)[1] != 2                                   # Para satisfazer a letra (c)...
        println("Os vetores devem morar em R^2!")                            # ...testamos se os vetores pertencem a R^2.
    else
        if v[1] < 0 || v[2] < 0 || u[1] < 0 || u[2] < 0                     # Testa se todos os valores (dos vetores v e u)...
            print("Os vetores devem ser não-negativos!")                    # ...não são menores que 0 (não-negativos).
        else
            produtoInterno = dot(v, u)                                      # Calcula o produto interno dos vetores.
            
            cos_theta = produtoInterno / (norm(v) * norm(u))
            rad = acos(cos_theta)
            angulo = rad / (pi / 180)                                       # Calcula o ângulo entre os vetores.
            
            plano_cartesiano([v1 v2])                                       # Desenha os vetores em um plano cartesiano.
            annotate!(5, 10, text("Produto interno: $produtoInterno", 10))  # Imoprime o produto interno.
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
