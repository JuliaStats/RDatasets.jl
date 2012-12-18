load("DataFrames")

module RDatasets
  export data

  using Base

  using DataFrames

  load("RDatasets/src/data.jl")
  load("RDatasets/src/datasets.jl")
  load("RDatasets/src/available_datasets.jl")
end
