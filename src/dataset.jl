function dataset(package_name::AbstractString, dataset_name::AbstractString)
    basename = joinpath(dirname(@__FILE__), "..", "data", package_name)

    rdaname = joinpath(basename, string(dataset_name, ".rda"))
    if isfile(rdaname)
        return load(rdaname)[dataset_name]
    end

    csvname = joinpath(basename, string(dataset_name, ".csv.gz"))
    if isfile(csvname)
        return open(GzipDecompressorStream, csvname, "r") do io
            CSV.read(io, delim=',', quotechar='\"', null="NA",
                     rows_for_type_detect=15000)
        end
    end
    error(@sprintf "Unable to locate dataset file %s or %s" rdaname csvname)
end
