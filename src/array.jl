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

function minprj(A::AbstractArray; dims)
    dropdims(minimum(A, dims=dims), dims=dims)
end
