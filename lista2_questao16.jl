function norma(x)
  return sqrt(x'*x)
end

function normalizar(vetor)
  return vetor/norma(vetor)
end

function projecao(v,q) # projecao v sobre q
  q=normalizar(q)
  p=q*(v'*q)
  return p
end

function mesmoPlano(a,b,c)
  ## suma = 0 -> coplanar
  sum = a+b+c
  if sum ==0
      print("Sao Coplanares")
      return
  end
  
  ## Se nao tem projecao -> coplanar
  Q, R = qr([a' b' c']) # R3x3 -> 0 -> coplanar
  n_r, m_r = size(R)
  if n_r != m_r
    print("Nao sao Coplanares")
    return
  else
    print("Sao Coplanares")
    return
  end
  
  ## em geral
  ab = b-a
  ac = c-a
  
  A = [ab' ac' a']
  m,n = size(A)
  if m==n
      if det(A) == 0
          print("Sao Coplanares")
          return
      end
  end
end