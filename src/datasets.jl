function datasets(package_name::AbstractString)
	d = datasets()
	d[d[:Package] .== package_name, :]
end

function datasets()
    if RDatasets.__datasets === nothing
        path = joinpath(dirname(@__FILE__), "..", "doc", "datasets.csv")
        global __datasets = CSV.read(path)
    end
    return RDatasets.__datasets::DataFrame
end
