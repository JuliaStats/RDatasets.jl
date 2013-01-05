function available_datasets()
  if has(ENV, "JULIA_PKGDIR")
    package_directory = joinpath(ENV["JULIA_PKGDIR"], "RDatasets", "data")
  else
    package_directory = path_expand(joinpath("~/.julia", "RDatasets", "data"))
  end
  for directory in readdir(package_directory)
    println("* Package: $directory")
    for file in readdir(joinpath(package_directory, directory))
      dataname = replace(file, ".csv", "")
      println("    * Data Set: $dataname")
    end
  end
end
