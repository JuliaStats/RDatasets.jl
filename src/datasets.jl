function datasets(package_name::AbstractString)
	d = datasets()
	d[d[:Package] .== package_name, :]
end

function datasets()
	path = joinpath(dirname(@__FILE__), "..", "doc", "datasets.csv")
	readtable(path)
end
