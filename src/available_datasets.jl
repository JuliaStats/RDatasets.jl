function available_datasets()
    package_directory = Pkg.dir("RDatasets", "data")
    for directory in readdir(package_directory)
        @printf "* Package: %s\n" directory
        for file in readdir(joinpath(package_directory, directory))
            dataname = replace(file, ".csv", "")
            dataname = replace(dataname, ".rda", "")
            @printf "    * Data Set: %s\n" dataname
        end
    end
end
