function T_calor(x, c)
  return c[2]*exp(c[1]*x)
end

# linearizamos nosso vetor
function f_calor(b)
  m,n = size(b)
  b_f = []
  for i=1:m
      b_f = [b_f; log(b[i])]
  end
  b_f = convert(Array{Float64,1}, b_f)
  return b_f
end

# voltamos a non-linear
function g_calor(b)
  b[2] = exp(b[2])
  return b
end

# resolver
function ResolverTemperatura_calor(A, b, f, g)
  b_ = f(b)
  c = A\b_
  c = g(c)
  return c
end

# c =ResolverTemperatura_calor(A, b, f_calor, g_calor)
# T_calor(0.3, c)