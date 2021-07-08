#lista_5, exercício_4

#recebe dois vetores v,w e retorna uma matriz P. Tal que, P*x é a projeção de x no plano gerado por v e w 

function MPO(v,w) #recebe dois vetores v e w 
    w=normalizar(w) #normaliza w(torna ele de tamanho 1)
    v=v-projecao(v,w) #projeta v em w 
    v=normalizar(v) #normaliza v
    
    #neste momento temos uma base ortonormal formada por v e w (são de tamanho 1 e perpendiculares entre si)
    
    #agora vamos achar a matriz de ortogonalização na base canônica com o v e w já definidos
    
    p1=dot(v,[1;0;0])*v + dot(w,[1;0;0])*w #p1 recebe a projeção do vetor [1;0;0] no espaço gerado por v e w
    p2=dot(v,[0;1;0])*v + dot(w,[0;1;0])*w #p2 recebe a projeção do vetor [0;1;0] no espaço gerado por v e w 
    p3=dot(v,[0;0;1])*v + dot(w,[0;0;1])*w #p3 recebe a projeção do vetor [0;0;1] no espaço gerado por v e w
    
    P=p1,p2,p3 #P recebe os vetores p1,p2,p3
    return P
end
