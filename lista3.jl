using LinearAlgebra
include("plots.jl")

function lago_fabio(s, v)                                           # Número 8 da Lista 3. (Fábio)
    A = zeros(s*s, s*s)                                             # "v" é uma vetor de 4 posições, com as temperaturas das bordas
    b = zeros(s*s)                                                  # s -> parametro q informa a raiz da quantidade...
    for i = 1:s*s                                                   # ...de pontos a se medir (s^2) = Matriz s x s
        for j = 1:s*s                                               # Este "for" preenche a Matriz A de tamanho s^2 x s^2
            i==j ? A[i,j] = 1 : nothing                             # Preenche com valor 1 na diagonal principal
            j>i && (i%s)!=0 && j==i+1 ? A[i,j] = -0.25 : nothing    # Preenche com -0.25 na lateral direita do 1 se este não estiver na borda direita 
            j<i && (i%s)!=1 && j==i-1 ? A[i,j] = -0.25 : nothing    # Preenche com -0.25 na lateral esquerda do 1 se este não estiver na borda esquerda
            j==i+s || j==i-s ? A[i,j] = -0.25 : nothing             # Preenche com -0.25 acima e abaixo do 1
        end
                                                                    # Daqui para baixo preenche o vetor "b"
        if i<=s                                                     # Borda superior = v[2]
            b[i] = v[2]/4                                           # Inicialmente é o valor da borda superior/4
            i==1 ? b[i] = v[1]/4 + v[2]/4 : nothing                 # Se está na quina esquerda, é borda superior/4 + esquerda/4
            i==s ? b[i] = v[2]/4 + v[3]/4 : nothing                 # Se está na quina direita, é borda superior/4 + direita/4
        elseif i>(s*s)-s                                            # Borda inferior = v[4]
            b[i] = v[4]/4                                           # Inicialmente é o valor da borda inferior/4
            i==(s*s)-s+1 ? b[i] = v[1]/4 + v[4]/4 : nothing         # Se está na quina esquerda, é borda inferior/4 + esquerda/4
            i==s*s ? b[i] = v[3]/4 + v[4]/4 : nothing               # Se está na quina direita, é borda inferior/4 + direita/4
        else                                                        # Bordas laterais (exceto quina superior e quina inferior)...
            (i%s)==1 ? b[i] = v[1]/4 : nothing                      # ...laterais esquerda = v[1]/4
            (i%s)==0 ? b[i] = v[3]/4 : nothing                      # ...laterais direita  = v[3]/4
        end
    end
    return A\b                                                      # x = A\b
end
