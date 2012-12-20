require("DataFrames")
using DataFrames

module RDatasets
  export data

  using Base

  using DataFrames

  require("RDatasets/src/data.jl")
  require("RDatasets/src/datasets.jl")
  require("RDatasets/src/available_datasets.jl")
end
