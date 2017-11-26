function packages()
	path = joinpath(dirname(@__FILE__), "..", "doc", "packages.csv")
	CSV.read(path)
end
