function T_frio(x, T_0, T_f, k)
  return (T_0 - T_f) * exp(-k*x) + T_f
end

function f_frio(b, T_0, T_f)
  m,n = size(b)
  b_f = []
  for i=1:m
      b_f = [b_f; -( log(b[i] - T_f) - log(T_0 - T_f) )]
  end
  b_f = convert(Array{Float64,1}, b_f)
  return b_f
end

function g_frio(b)
  return b
end

function ResolverTemperatura_frio(A, b, f, g, T_0, T_f)
  b_ = f(b, T_0, T_f)
  c = A\b_
  c= g(c)
  return c, c[1]
end

# c, K = ResolverTemperatura_frio(A, b, f_frio, g_frio, T_0, T_f)

#for i in 0:0.5:30
#  print("$(i): $(T_frio(i , T_0, T_f,  K))\n")
#end