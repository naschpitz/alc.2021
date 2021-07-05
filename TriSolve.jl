include("MatMul.jl")

# Solves an upper triangular system U with right hand side matrix B recursively.
function UpperSolve(U,B)
	if ndims(B) == 1
		B=reshape(B,:,1)
	end

	m,n=size(U)
	p,q=size(B)
	
	if n != p
		return "Dimension mismatch"
	end
	
	if m>1
		mb=ceil(Int,m/2)
	
		U11=U[1:mb,1:mb]
		U22=U[mb+1:end,mb+1:end]
		M=U[1:mb,mb+1:end]
		
		B1=B[1:mb,:]
		B2=B[mb+1:end,:]
		
		x2=UpperSolve(U22,B2)
		B1_new=B1 - MvM(M,x2)
		x1=UpperSolve(U11,B1_new)
		
		return [x1;x2]
		
	else
		return (1/U[1,1]).*B
	end
end

# Solves a lower triangular system L with right hand side matrix B recursively.
function LowerSolve(L,B)
	if ndims(B) == 1
		B=reshape(B,:,1)
	end

	m,n=size(L)
	p,q=size(B)
	
	if n != p
		return "Dimension mismatch"
	end
	
	if m>1
		mb=ceil(Int,m/2)
	
		L11=L[1:mb,1:mb]
		L22=L[mb+1:end,mb+1:end]
		M=L[mb+1:end,1:mb]
		
		B1=B[1:mb,:]
		B2=B[mb+1:end,:]
		
		x1=LowerSolve(L11,B1)
		B2_new=B2 - MvM(M,x1)
		x2=LowerSolve(L22,B2_new)
		
		return [x1;x2]
		
	else
		return (1/L[1,1]).*B
	end
end