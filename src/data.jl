function data{S <: String, T <: String}(package_name::S, dataset_name::T)
  if has(ENV, "JULIA_PKGDIR")
    package_directory = joinpath(ENV["JULIA_PKGDIR"], "RDatasets")
  else
    package_directory = expanduser(joinpath("~/.julia", "RDatasets"))
  end
  filename = joinpath(package_directory,
                       "data",
                       package_name,
                       strcat(dataset_name, ".csv"))
  if !isfile(filename)
    error("Unable to locate file $filename")
  end
  return read_table(filename)
end
