using DataFrames

module RDatasets
    using DataFrames

    export data

    include("data.jl")
    include("datasets.jl")
    include("available_datasets.jl")
end
