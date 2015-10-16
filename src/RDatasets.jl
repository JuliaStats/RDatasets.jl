module RDatasets
    using Reexport
    using Compat
    @reexport using DataFrames

    export dataset

    include("dataset.jl")
    include("datasets.jl")
    include("packages.jl")

    Base.@deprecate available_datasets RDatasets.datasets
end
