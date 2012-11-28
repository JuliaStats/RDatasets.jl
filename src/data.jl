function data{S <: String, T <: String}(package_name::S, dataset_name::T)
  if has(ENV, "JULIA_PKGDIR")
    package_directory = file_path(ENV["JULIA_PKGDIR"], "RDatasets")
  else
    package_directory = path_expand(file_path("~/.julia", "RDatasets"))
  end
  filename = file_path(package_directory,
                       "data",
                       package_name,
                       strcat(dataset_name, ".csv"))
  if !isfile(filename)
    error("Unable to locate file $filename")
  end
  return read_table(filename)
end
