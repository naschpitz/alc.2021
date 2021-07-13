function calcNorm(A, PL) #Verifica a igualdade entre a matriz A e o produto linear (BC)
    if norm(A-PL)<0.1
        println("Norma igual a zero!")
    end
end