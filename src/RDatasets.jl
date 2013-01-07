require("DataFrames")
using DataFrames

module RDatasets
  using DataFrames

  export data

  include(joinpath(julia_pkgdir(), "RDatasets", "src", "data.jl"))
  include(joinpath(julia_pkgdir(), "RDatasets", "src", "datasets.jl"))
  include(joinpath(julia_pkgdir(), "RDatasets", "src", "available_datasets.jl"))
end
