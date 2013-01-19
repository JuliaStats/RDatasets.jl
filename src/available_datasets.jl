function available_datasets()
  package_directory = Pkg.dir("RDatasets", "data")
  for directory in readdir(package_directory)
    println("* Package: $directory")
    for file in readdir(joinpath(package_directory, directory))
      dataname = replace(file, ".csv", "")
      println("    * Data Set: $dataname")
    end
  end
end
