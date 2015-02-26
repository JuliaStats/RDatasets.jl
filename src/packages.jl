function packages()
	path = joinpath(dirname(@__FILE__), "..", "doc", "packages.csv")
	readtable(path)
end
