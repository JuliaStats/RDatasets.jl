function packages()
	path = joinpath(Pkg.dir("RDatasets"), "doc", "packages.csv")
	readtable(path)
end