function datasets(package_name::String)
	d = datasets()
	d[d["Package"] .== package_name, :]
end

function datasets()
	path = joinpath(Pkg.dir("RDatasets"), "doc", "datasets.csv")
	readtable(path)
end
