using Plots

function plano_cartesiano(M)
    l, c = size(M)
    if l != 2
        println("Plano Cartesiano deve morar em R2! ;-)")
    else
        x = [zeros(21) Vector(-10:10)]
        y = [Vector(-10:10) zeros(21)]
        linecolor=[:black :black]
        lw = [1 1]
        for i in 1:c
            x = [x zeros(21)]
            x[1,2+i] = M[1,i]
            y = [y zeros(21)]
            y[1,2+i] = M[2,i]
            linecolor=[linecolor :blue]
            lw = [lw 3]
        end
        plot(x, y, xlims = (-10, 10), xticks = -10:1:10, ylims = (-10, 10), yticks = -10:1:10, leg=false, linecolor=linecolor, lw=lw)
    end
end
