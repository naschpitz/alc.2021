function definirVetores(unidade)
  a1 =[1;0]*unidade
  a2=[3;1]*unidade
  a3=[0;1]*unidade
  a4=[2;3]*unidade
  a5=[0;-3]*unidade
  a6=[-4;0]*unidade
  
  A = [a1 a2 a3 a4 a5 a6]
  B = [a2 a4]
  C = inv(B)*A # A\B
  
  return A, B, C
end