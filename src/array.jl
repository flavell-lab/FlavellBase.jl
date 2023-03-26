function standardize(A::AbstractArray) 
    μ = mean(A)
    σ = std(A)
    (A .- μ) / σ
end

"""
    map_data(f::Function, data::Array; dims)

Apply function `f` to array `data` in dimension(s) `dims` and
drop any singleton dimension.
"""
function map_data(f::Function, A::AbstractArray; dims)
    dropdims(mapslices(f, A, dims=dims), dims=dims)
end

function maxprj(A::AbstractArray; dims)
    dropdims(maximum(A, dims=dims), dims=dims)
end

function meanprj(A::AbstractArray; dims)
    dropdims(mean(A, dims=dims), dims=dims)
end

function medianprj(A::AbstractArray; dims)
    dropdims(median(A, dims=dims), dims=dims)
end

function stdprj(A::AbstractArray; dims)
    dropdims(std(A, dims=dims), dims=dims)
end

function minprj(A::AbstractArray; dims)
    dropdims(minimum(A, dims=dims), dims=dims)
end

"""
    aggregate_var(data; f_aggregate=mean, f_var=std, dim=2)

Aggregate data along dimension `dim` using `f_aggregate` and
compute the variance along dimension `dim` using `f_var`.

Returns a tuple of 5 arrays:
    - y1: aggregate - variance
    - y2: aggregate
    - y3: aggregate + variance
    - u: aggregate
    - s: variance

Arguments:
    - data: array of data
    - f_aggregate: function to aggregate data
    - f_var: function to compute variance
    - dim: dimension to aggregate and compute variance
"""
function aggregate_var(data; f_aggregate=mean, f_var=std, dim=2)
    u = f_aggregate(data, dims=dim)[:]
    s = f_var(data, dims=dim)[:]
    
    y1 = u .- s
    y2 = u
    y3 = u .+ s
    
    y1, y2, y3, u, s
end