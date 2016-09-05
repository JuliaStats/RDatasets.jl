module RDatasets
    using Reexport
    using Compat
    import FileIO
    @reexport using DataFrames

    export dataset

    include("dataset.jl")
    include("datasets.jl")
    include("packages.jl")

    Base.@deprecate available_datasets RDatasets.datasets
end
