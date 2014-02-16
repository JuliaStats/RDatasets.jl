module TestDataset
    using Base.Test
    using DataArrays
    using DataFrames
    using RDatasets

    iris = dataset("datasets", "iris")
    
    @assert size(iris) == (150, 5)
end
