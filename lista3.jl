using LinearAlgebra
include("plots.jl")

function idade_dos_amigos()     # Número 4 da Lista 3. (Fábio)
    A = zeros(5, 5)
    b = zeros(5)
    e = 0
    y = 1
    p  = ["A", "B", "C", "D", "E"]

    println("Idade dos amigos: Alberto, Bernardo, Carol, Denise e Ernestro...")

    while e != InterruptException() && y != 0
        p1 = ""
        p2 = ""
        op = ""
        idade = nothing
        println("SISTEMA SEM SOLUÇÃ0, POR ENQUANTO...")
        println()

        while e != InterruptException() && !(p1 in p)
            print("[A]lberto, [B]ernardo, [C]arol, [D]enise, [E]rnestro tem... (Ctrl+C to exit): ")
            try p1 = readline() catch e end
        end
        while e != InterruptException() && !(op in ["+", "-", "="])
            print("[+] mais ... anos que ..., [-] menos ... anos que ..., [=] ... anos... (Ctrl+C to exit): ")
            try op = readline() catch e end
        end
        if op == "+"
            s = "a mais"
        elseif op == "-"
            s = "a menos"
        else
            s = "tem"
        end
        while e != InterruptException() && !(idade isa Int)
            print("Quantos anos $s? (Ctrl+C to exit): ")
            try idade = parse(Int, readline()) catch e end
        end
        while op != "=" && e != InterruptException() && !(p2 in p)
            print("... $s que [A]lberto, [B]ernardo, [C]arol, [D]enise, [E]rnestro. (Ctrl+C to exit): ")
            try p2 = readline() catch e end
            p2 == p1 ? p2 = "" : nothing
        end

        i = findall(==(p1), p)[1]
        A[i,i] = 1
        if op != "="
            j = findall(==(p2), p)[1]
            if A[i,j] == 0
                A[i,j] = -1
                op == "-" ? idade = idade * -1 : nothing
                b[i]  += idade
            end

            if A[j,j] == 0
                A[j,j] = 1
                A[j,i] = -1
                b[j]   = idade * -1
            end
        else
            A[i,:] = zeros(5) 
            A[i,i] = 1
            b[i]   = idade
        end
        
        println()
        for k in 1:5
            println(A[k,:])
        end
        println()
        println(b)

        x = 0
        y = 0
        try x = A\b catch y end
        if x != 0
            println()
            println("Idade dos amigos: ")
            println("Alberto tem ", x[1], " anos")
            println("Bernardo tem ", x[2], " anos")
            println("Carol tem ", x[3], " anos")
            println("Denise tem ", x[4], " anos")
            println("Ernestro tem ", x[5], " anos")
        end        
    end
end

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
