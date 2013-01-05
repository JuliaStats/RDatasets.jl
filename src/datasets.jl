function datasets()
  results = Array(Any, 0)
  if has(ENV, "JULIA_PKGDIR")
    package_directory = joinpath(ENV["JULIA_PKGDIR"], "RDatasets", "data")
  else
    package_directory = expanduser(joinpath("~/.julia", "RDatasets", "data"))
  end
  for directory in readdir(package_directory)
    for file in readdir(joinpath(package_directory, directory))
      dataname = replace(file, ".csv", "")
      push(results, [directory, dataname])
    end
  end
  return results
end
