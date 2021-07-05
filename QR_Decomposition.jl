using LinearAlgebra;

# Produces the QR decomposition of a general matrix A.
function dqr(A) :: Tuple{Matrix{Float64}, Matrix{Float64}}
	m,n=size(A)
	Q=zeros(m,1)
	k=1
	for j=1:n
		proj=zeros(m)
		for i=1:k-1
			proj += dot(A[:,j],Q[:,i])*Q[:,i]
		end
		Q[:,k]= A[:,j] - proj
		if norm(Q[:,k]) > 1e-9
			Q[:,k]/=norm(Q[:,k])
			Q=[Q zeros(m,1)]
			k+=1
		end
		if j==n && norm(Q[:,k]) <= 1e-9
			Q=Q[:,1:end-1]
		end
	end
	return Q,(Q')*A
end