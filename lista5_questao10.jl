# enlongamento de matrix
function elongar_matrix(distancia, A)
  m,n = size(distancia)
  d = zeros(m, n)
  for i in 1:m
      for j in 1:n
          if distancia[i,j]!= 0
              d[i,j] = 1/distancia[i,j]
          end
      end
  end
  return d, d*A, A*d
end

# Rotacao da matrix
function rotar_matrix(angulo, A)
  R = [cos(angulo) -sin(angulo);sin(angulo) cos(angulo)]
  return R, A*R
end

