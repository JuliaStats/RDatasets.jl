module TestDatasets
    using Base.Test
    using RDatasets

    package_directory = joinpath(dirname(@__FILE__), "..", "data")

    dfs_found = vcat(map(readdir(package_directory)) do directory
        fns = readdir(joinpath(package_directory, directory))
        pkgs = fill(directory, length(fns))
        sets = map(fn -> replace(fn, r"(\.(rda|csv|gz))+$", ""), fns)
        DataFrame(Package = pkgs, Dataset = sets)
    end...)

    dfs_documented = RDatasets.datasets()

    @test size(dfs_found, 1) == size(dfs_documented, 1)

    @test sort(dfs_documented[[:Package, :Dataset]]) == sort(dfs_found)
end
