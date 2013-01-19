function data{S <: String, T <: String}(package_name::S, dataset_name::T)
  package_directory = Pkg.dir("RDatasets")
  filename = joinpath(package_directory,
                       "data",
                       package_name,
                       strcat(dataset_name, ".csv"))
  if !isfile(filename)
    error("Unable to locate file $filename")
  end
  return read_table(filename)
end
