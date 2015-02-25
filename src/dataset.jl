function dataset(package_name::String, dataset_name::String)
    basename = joinpath(dirname(@__FILE__), "..", "data", package_name)
    
    rdaname = joinpath(basename, string(dataset_name, ".rda"))
    if isfile(rdaname)
        return DataFrame(read_rda(rdaname)[dataset_name])
    end

    filename = joinpath(basename, string(dataset_name, ".csv.gz"))
    if !isfile(filename)
        error(@sprintf "Unable to locate file %s or %s\n" rdaname filename)
    else
        return readtable(filename)
    end
end
