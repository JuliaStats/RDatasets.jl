# special cases for datasets that need more rows for proper column type detection
const Dataset_typedetect_rows = Dict{Tuple{String, String}, Int}(
    ("adehabitatLT", "albatross") => 1000,
    ("adehabitatLT", "bear") => 1200,
    ("adehabitatLT", "buffalo") => 1500,
    ("adehabitatLT", "capreotf") => 600,
    ("boot", "neuro") => 500,
    ("gap", "PD") => 500,
    ("plyr", "baseball") => 1000,
    ("psych", "bfi") => 1000,
    ("survival", "cancer") => 250,
    ("survival", "lung") => 250,
    ("vcd", "Bundesliga") => 15000,
)

function dataset(package_name::AbstractString, dataset_name::AbstractString)
    basename = joinpath(dirname(@__FILE__), "..", "data", package_name)

    rdaname = joinpath(basename, string(dataset_name, ".rda"))
    if isfile(rdaname)
        return load(rdaname)[dataset_name]
    end

    csvname = joinpath(basename, string(dataset_name, ".csv.gz"))
    if isfile(csvname)
        return open(GzipDecompressorStream, csvname, "r") do io
            CSV.read(io, delim=',', quotechar='\"', missingstring="NA",
                     rows_for_type_detect=get(Dataset_typedetect_rows, (package_name, dataset_name), 200))
        end
    end
    error(@sprintf "Unable to locate dataset file %s or %s" rdaname csvname)
end
