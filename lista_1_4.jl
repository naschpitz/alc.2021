#lista_1 exercício_4, recebe uma matriz com três vetores quaisquer e retorna, distância do 3ºvetor para o plano gerado 
#pelos outros dois vetores/ retorna o tamanho do primeiro vetor /retorna o tamanho da projeção do 3º vetor no plano 
#gerado pelos outros dois vetores /retorna o tamanho da projeção do 2ºvetor na reta gerada pelo 1º vetor /retorna o
#tamanho do 3ºvetor
function tamanho_distancia(A)
    m,n=size(A) # m,n recebe  o tamanho da matriz A
    respB=zeros() 
    respC=zeros() 
    respD=zeros() 
    respE=zeros() 
    respF=zeros() 
    
    Q,R=qr(A) #aplica a função qr na matriz de entrada A
    
#a função qr produz duas matrizes Q(uma matriz ortogonal) e R(uma matriz triangular superior). 
#Q é a matriz de entrada ortogonalizada e R é a matriz de entrada agora triangular superior. logo: Tendo uma matriz
#ortogonal e uma matriz triangular superior, podemos obter as respostas com base na matriz R 
    
        respB=norm(R[3,3]) #será ||R[:,3] - (R13 + R23)|| 
        respC=norm(R[:,1]) #será a norma do primeiro vetor da matriz R
        respD=norm([R[1,3];R[2,3];0]) #será a norma das duas primeiras coordenada de R3
        respE=norm(R[1,2])  #será a norma da primeira coordenada de R2
        respF=norm(R[:,3]) #será a norma de R3
    return Q, R, respB, respC, respD, respE, respF
end