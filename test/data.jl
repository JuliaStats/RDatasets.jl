module TestData
    using Base.Test
    using RDatasets

    iris = data("datasets", "iris")
    
    @assert size(iris) == (150, 5)
end
