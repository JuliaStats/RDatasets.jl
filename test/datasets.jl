@testset "Datasets availability" begin
    package_directory = joinpath(dirname(@__FILE__), "..", "data")

    dfs_found = vcat(map(readdir(package_directory)) do directory
        fns = readdir(joinpath(package_directory, directory))
        pkgs = fill(directory, length(fns))
        sets = replace.(fns, Ref(r"(\.(rda|csv|gz))+$" => ""))
        DataFrame(Package = pkgs, Dataset = sets)
    end...)

    dfs_documented = RDatasets.datasets()

    @test size(dfs_found, 1) == size(dfs_documented, 1)
    @test sort(dfs_documented[[:Package, :Dataset]]) == sort(dfs_found)

    # test caching works
    @test dfs_documented === RDatasets.datasets()
end
