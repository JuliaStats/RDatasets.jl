function data{S <: String, T <: String}(package_name::S, dataset_name::T)
  package_directory = Pkg.dir("RDatasets")
  basename = joinpath(package_directory,
                      "data",
                      package_name)
  rdaname = joinpath(basename, string(dataset_name, ".rda"))
  if isfile(rdaname)
    return DataFrame(read_rda(rdaname)[dataset_name])
  end
  filename = joinpath(basename, string(dataset_name, ".csv"))
  if !isfile(filename)
    error("Unable to locate file $rdaname or $filename")
  end
  return read_table(filename)
end
