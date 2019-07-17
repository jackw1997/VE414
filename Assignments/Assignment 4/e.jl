ni = [50, 250, 750, 1500, 3000]

for n in ni
    x = 0.5 
    a = -5
    b = 5
    if n <= 1000
        y_grid = collect(range(a, length=n, stop=b));
        newa = a;
    elseif n > 1000 && n <= 2000
        nm = 1000;
        na=round(Int, (n-nm)/2);
        l = (b-a)/(nm-1); 
        newa = a-l*na;
        y_grid = collect(range(newa, step=l , length=n));
    else n > 2000 
        nm=round(Int, n/2);
        na=round(Int, (n-nm)/2); l = (b-a)/(nm-1);
        newa = a-l*na;
        y_grid = collect(range(newa, step=l , length=n));
    end
    delta = y_grid[3] - y_grid[2]
    inte = Array{Float64, 1}(undef, n)
    unnormalized_posterior = Array{Float64, 1}(undef, n)
    for i in 1:n
        unnormalized_posterior[i] = y_grid[i] * exp(-(x-y_grid[i])^2/2) * (1/(1+y_grid[i]^2)) * delta
        inte[i] = exp(-(x-y_grid[i])^2/2) * (1/(1+y_grid[i]^2)) * delta
    end
    A = sum(inte)
    C = 1/A
    println(sum(unnormalized_posterior) * C)
end