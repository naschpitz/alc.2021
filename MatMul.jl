using LinearAlgebra

#Multiplies two matrices A and B recursively.
function MvM(A,B)
	if ndims(A) == 1
		A=reshape(A,:,1)
	end
	if ndims(B) == 1
		B=reshape(B,:,1)
	end
	
	m,n=size(A)
	p,q=size(B)
	
	if n != p 
		return "Dimension Mismatch"
	end
	
	mb=ceil(Int,m/2)
	nb=ceil(Int,n/2)
	qb=ceil(Int,q/2)

	if m>1 && n>1 && q>1 
		A11=A[1:mb,1:nb]
		A12=A[1:mb,nb+1:end]
		A21=A[mb+1:end,1:nb]
		A22=A[mb+1:end,nb+1:end]
		
		B11=B[1:nb,1:qb]
		B12=B[1:nb,qb+1:end]
		B21=B[nb+1:end,1:qb]
		B22=B[nb+1:end,qb+1:end]
		
		C11=MvM(A11,B11) + MvM(A12,B21)
		C12=MvM(A11,B12) + MvM(A12,B22)
		C21=MvM(A21,B11) + MvM(A22,B21)
		C22=MvM(A21,B12) + MvM(A22,B22)
		
		return [C11 C12;C21 C22]
	elseif m>1 && n>1 && q==1
		A11=A[1:mb,1:nb]
		A12=A[1:mb,nb+1:end]
		A21=A[mb+1:end,1:nb]
		A22=A[mb+1:end,nb+1:end]
	
		B11=B[1:nb,1:qb]
		B21=B[nb+1:end,1:qb]
		
		C11=MvM(A11,B11) + MvM(A12,B21)
		C21=MvM(A21,B11) + MvM(A22,B21)
		
		return [C11;C21]
	elseif m>1 && n==1 && q>1
		A11=A[1:mb,1:nb]
		A21=A[mb+1:end,1:nb]
		
		B11=B[1:nb,1:qb]
		B12=B[1:nb,qb+1:end]
		
		C11=MvM(A11,B11)
		C12=MvM(A11,B12)
		C21=MvM(A21,B11)
		C22=MvM(A21,B12)
		
		return [C11 C12;C21 C22]
	elseif m>1 && n==1 && q==1
		A11=A[1:mb,1:nb]
		A21=A[mb+1:end,1:nb]
		
		B11=B[1:nb,1:qb]
		
		C11=MvM(A11,B11)
		C21=MvM(A21,B11)

		return [C11;C21]
	elseif m==1 && n>1 && q>1
		A11=A[1:mb,1:nb]
		A12=A[1:mb,nb+1:end]
		
		B11=B[1:nb,1:qb]
		B12=B[1:nb,qb+1:end]
		B21=B[nb+1:end,1:qb]
		B22=B[nb+1:end,qb+1:end]
		
		C11=MvM(A11,B11) + MvM(A12,B21)
		C12=MvM(A11,B12) + MvM(A12,B22)
		
		return [C11 C12]
	elseif m==1 && n>1 && q==1
		A11=A[1:mb,1:nb]
		A12=A[1:mb,nb+1:end]
		
		B11=B[1:nb,1:qb]
		B21=B[nb+1:end,1:qb]
		
		
		C11=MvM(A11,B11) + MvM(A12,B21)
		
		return C11
	elseif m==1 && n==1 && q>1
		A11=A[1:mb,1:nb]
		
		B11=B[1:nb,1:qb]
		B12=B[1:nb,qb+1:end]
		
		C11=MvM(A11,B11)
		C12=MvM(A11,B12)
		
		return [C11 C12]
	elseif m==n==q==1
		return reshape([A[1,1]*B[1,1]],:,1)
	end
end