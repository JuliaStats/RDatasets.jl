function packages()
    if RDatasets.__packages === nothing
        path = joinpath(@__DIR__, "..", "doc", "packages.csv")
        global __packages = CSV.read(path)
    end
    return RDatasets.__packages::DataFrame
end
