function packages()
	path = joinpath(Pkg.dir("RDatasets"), "doc", "packages.csv")
	return readtable(path)
end
