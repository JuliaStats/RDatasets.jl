module TestDatasets
    using Base.Test
    using DataFrames
    using RDatasets

    ds = RDatasets.datasets()
    n = size(ds, 1)

    df = DataFrame(Package = fill("", n), Dataset = fill("", n))
    i = 1
    package_directory = Pkg.dir("RDatasets", "data")
    for directory in readdir(package_directory)
        for file in readdir(joinpath(package_directory, directory))
            dataset = replace(file, r"(\.(rda|csv|gz))+$", "")
            df[i, "Package"] = directory
            df[i, "Dataset"] = dataset
            i += 1
        end
    end
    
    @assert sort(ds[["Package", "Dataset"]]) == sort(df)
end
