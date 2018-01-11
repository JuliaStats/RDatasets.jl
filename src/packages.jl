function packages()
    if RDatasets.__packages === nothing
        path = joinpath(dirname(@__FILE__), "..", "doc", "packages.csv")
        global __packages = CSV.read(path)
    end
    return RDatasets.__packages::DataFrame
end
