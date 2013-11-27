function datasets(package_name::String)
	df = datasets()
	return df[df["Package"] .== package_name]
end

function datasets()
	path = joinpath(Pkg.dir("RDatasets"), "doc", "datasets.csv")
	return readtable(path)
end
