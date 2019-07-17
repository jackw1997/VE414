using Distributions
n = [50, 250, 750, 1500, 3000]

for ni in n
    ni = round(Int, ni/2)
    u = range(-1 * pi / 2, length = ni+1, stop = 0)
    v = range(0, length = ni+1, stop = +1 * pi / 2)
    weights = Array{Float64, 1}(undef, ni)
    for x in 1:ni
        weights[x] = 1/ni
    end
    
    u = collect(u[2:ni+1])
    v = collect(v[1: ni])

    m = [100, 1000]

    for mi in m
        um = wsample(u, weights, mi)
        vm = wsample(v, weights, mi)
    

        u_tan = map((x)->tan(x), um)
        v_tan = map((x)->tan(x), vm)

        u_exp = map((x) -> exp(-((0.5 - x)^2)/2), u_tan)
        v_exp = map((x) -> exp(-((0.5 - x)^2)/2), v_tan)

        inte = pi / (2*ni) * sum(u_exp) + pi/(2*ni) * sum(v_exp)
        c = 1 / inte
        E = c * pi / (2*ni) * sum(u_tan .* u_exp) + c * pi/(2*ni) * sum(v_tan .* v_exp)
        println(ni*2, " ", mi, " ", E)
    end
end