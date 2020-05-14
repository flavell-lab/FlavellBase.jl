function standardize(array::Array) 
    μ = mean(array)
    σ = std(array)
    (array .- μ) / σ
end

function maxprj(array; dims=3)
    dropdims(maximum(array, dims=dims), dims=dims)
end
