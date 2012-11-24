load("DataFrames")

module RDatasets
  export data

  using Base

  load("DataFrames")
  using DataFrames

  load("RDatasets/src/data.jl")
  load("RDatasets/src/available_datasets.jl")
end
