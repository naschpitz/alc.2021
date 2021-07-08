#lista_5, exercício 7

#recebe uma matriz A, o grau G e o eixo de rotação e a sáida é a matriz com as colunas de A rotacionadas G graus em torno do eixo dado

function rotacao(A,G,eixo) 
    e=eixo #e recebe o eixo de rotação de entrada
    if e=="X" #rotação no eixo de X, (y na direção de z)
        R=[1 0 0; 0 cos(G) -sin(G); 0 sin(G) cos(G)] 
        RR=R*A
    elseif e=="Y" #rotação no eixo de Y (z na direção x)
        R=[cos(G) 0 sin(G);0 1 0; -sin(G) 0 cos(G)]
        RR=R*A
    elseif e=="Z" #rotação no eixo de Z (x em direção a y)
        R=[cos(G) -sin(G) 0;sin(G) cos(G) 0; 0 0 1]
        RR=R*A
        end
    return RR
end