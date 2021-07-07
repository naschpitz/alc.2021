include("TriSolve.jl")

# Produces the LU decomposition of a square matrix A recursively.
function dlu(A)
	if ndims(A) == 1
		A=reshape(A,:,1)
	end
	
	m,n=size(A)
	
	if m != n 
		return "Error, A is not square"
	end
	
	if m>1
		mb=ceil(Int,m/2)
		
		A11=A[1:mb,1:mb]
		A12=A[1:mb,mb+1:end]
		A21=A[mb+1:end,1:mb]
		A22=A[mb+1:end,mb+1:end]
		
		L11,U11=dlu(A11)
		L21=(LowerSolve(U11',A21'))'
		U12=LowerSolve(L11,A12)
		A22_new=A22 - MvM(L21,U12)
		L22,U22=dlu(A22_new)
		
		return [L11 zeros(size(L11,1),size(L22,2));L21 L22], [U11 U12;zeros(size(U22,1),size(U11,2)) U22]
	else
		return reshape([A[1,1]],:,1), reshape([1.0],:,1)
	end	
	
end