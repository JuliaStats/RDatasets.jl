@testset "Packages list correctness" begin
    ds = RDatasets.datasets()
    dp = RDatasets.packages()

    @test dp[:Package] == sort(unique(ds[:Package]))

    # test caching works
    @test dp === RDatasets.packages()
end
