using DataArrays
using DataFrames

module RDatasets
	using DataArrays
    using DataFrames

    export dataset

    include("dataset.jl")
    include("datasets.jl")
    include("packages.jl")
    include("available_datasets.jl")

    Base.@deprecate available_datasets datasets
end
