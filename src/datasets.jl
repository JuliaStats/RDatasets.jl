function datasets(package_name::AbstractString)
	d = datasets()
	d[findfirst(isequal(package_name), d[:Package]), :]
end

function datasets()
    if RDatasets.__datasets === nothing
        path = joinpath(dirname(@__FILE__), "..", "doc", "datasets.csv")
        global __datasets = CSV.read(path)
    end
    return RDatasets.__datasets::DataFrame
end
