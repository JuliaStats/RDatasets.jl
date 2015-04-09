module RDatasets
    using Reexport
    @reexport using DataFrames

    export dataset

    include("dataset.jl")
    include("datasets.jl")
    include("packages.jl")

    Base.@deprecate available_datasets datasets
end
