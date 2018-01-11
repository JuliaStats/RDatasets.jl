__precompile__()

module RDatasets
    using Reexport, FileIO, CSV, CodecZlib
    @reexport using DataFrames

    export dataset

    global __packages = nothing
    global __datasets = nothing

    include("dataset.jl")
    include("datasets.jl")
    include("packages.jl")
end
