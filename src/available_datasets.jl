function available_datasets()
  if has(ENV, "JULIA_PKGDIR")
    package_directory = file_path(ENV["JULIA_PKGDIR"], "RDatasets", "data")
  else
    package_directory = path_expand(file_path("~/.julia", "RDatasets", "data"))
  end
  for directory in readdir(package_directory)
    println("* Package: $directory")
    for file in readdir(file_path(package_directory, directory))
      dataname = replace(file, ".csv", "")
      println("    * Data Set: $dataname")
    end
  end
end
