using DataFrames

module RDatasets
    using DataFrames

    export data

    include("data.jl")
    include("datasets.jl")
    include("packages.jl")
    include("available_datasets.jl")

    Base.@deprecate available_datasets datasets
end
