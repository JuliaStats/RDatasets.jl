module TestPackages
    using Base.Test
    using DataArrays
    using DataFrames
    using RDatasets

    ds = RDatasets.datasets()
    dp = RDatasets.packages()

    @assert dp["Package"] == sort(unique(ds["Package"]))
end
