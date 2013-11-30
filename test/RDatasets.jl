using RDatasets

iris = data("datasets", "iris")
packages = RDatasets.packages()
datasets = RDatasets.datasets()
countdatasets = RDatasets.datasets("COUNT")
@assert isa(packages, DataFrame)
@assert isa(datasets, DataFrame)
@assert isa(countdatasets, DataFrame)
