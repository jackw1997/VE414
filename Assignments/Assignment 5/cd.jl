using Distributions

sample_sizes = [50, 250, 750, 1500, 3000]

for n in sample_sizes 
    samples = Array{Float64}(undef, n)
    wi = Array{Float64}(undef, n)
    i = 1
    while i <= n
        v = rand(1)[1]
        y = rand(Normal(0.5, 1), 1)[1]
        w = sqrt(2 * pi) * y / (1 + y^2)
        wi[i] = sqrt(2 * pi) / (1 + y^2)
        samples[i] = w
        i+=1 
    end
    exp = sum(samples) / sum(wi)
    println(exp)
end
