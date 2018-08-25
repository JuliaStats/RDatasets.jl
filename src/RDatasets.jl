module RDatasets
    using Reexport, RData, CSV, CodecZlib
    using Printf: @sprintf
    @reexport using DataFrames

    export dataset

    global __packages = nothing
    global __datasets = nothing

    include("dataset.jl")
    include("datasets.jl")
    include("packages.jl")
end
