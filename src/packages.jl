function packages()
    if RDatasets.__packages === nothing
        path = joinpath(dirname(@__FILE__), "..", "doc", "packages.csv")
        global __packages = DataFrame(CSV.File(path))
    end
    return RDatasets.__packages::DataFrame
end
