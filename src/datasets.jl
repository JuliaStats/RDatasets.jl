function datasets()
    results = Array(Any, 0)
    package_directory = Pkg.dir("RDatasets", "data")
    for directory in readdir(package_directory)
        for file in readdir(joinpath(package_directory, directory))
            dataname = replace(file, ".csv.gz", "")
            push!(results, [directory, dataname])
        end
    end
    return results
end
