module FlavellBase

using Statistics

include("io.jl")
include("array.jl")

export read_txt,
    write_txt,
    create_dir,

    # array.jl
    standardize,
    maxprj,
    meanprj,
    map_data

end # module
