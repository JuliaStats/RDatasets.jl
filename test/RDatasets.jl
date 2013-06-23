using RDatasets

iris = data("datasets", "iris")
RDatasets.available_datasets()
datasets = RDatasets.datasets()
@assert isa(datasets, Array{Any})
