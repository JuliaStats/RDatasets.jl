module TestData
    using Base.Test
    using DataArrays
    using DataFrames
    using RDatasets

    iris = data("datasets", "iris")
    
    @assert size(iris) == (150, 5)
end
