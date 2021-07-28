# Eliminacao Gauss
function eliminacao_Gaussiana(A,b)
  m, n=size(A)
 
 for j=1:n
     k=j+1:n
     
     for i=j+1:m
         mij=A[i,j]/A[i,j]
         A[i,k]-=mij*A[j,k]
         A[i,j]=0.0
         b[i]-=mij*b[j]
     end
 end
 return A
end

# LU descomp posto 1
function LU_descomp(A)
  m, n = size(A)
  L = zeros(n, n)
  U = Matrix{Float64}(I, (n, n))
  k = 0
  for k in 1:n
    for i in k:n
      sum_ = 0.0
      for p in 1:k
          sum_ = sum_ + L[i,p]*U[p,k]
          #print(L[i,p],"-",U[p,k], "-", i, "-", p, "-", k, "-", sum_,"\n")
      end
      L[i,k] = A[i,k] - sum_
      #print(i,"-",k, "-",L[i,k], "-",A[i,k],", ",sum_, "\n")
    end
    for i in k+1:n
      sum_ = 0
      for p in 1:k
          sum_ = sum_ + L[k,p]*U[p,i]
      end
      U[k,i] = (A[k,i] - sum_) / float(L[k,k])
    end
  end
  return L, U
end