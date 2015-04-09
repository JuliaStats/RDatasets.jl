module TestPackages
    using Base.Test
    using RDatasets

    ds = RDatasets.datasets()
    dp = RDatasets.packages()

    @test dp[:Package] == sort(unique(ds[:Package]))
end
