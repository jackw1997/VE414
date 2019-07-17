using Distributions

sample_sizes = [50, 250, 750, 1500, 3000]

for n in sample_sizes 
    samples = Array{Float64}(undef, n)
    i = 1
    while i <= n
        v = rand(1)[1]
        y = rand(Normal(0.5, 1), 1)[1]
        if v <= 1 / (1+y^2)
            samples[i] = y
            i+=1 
        end
    end
    exp = sum(samples) / n
    println(exp)
end
