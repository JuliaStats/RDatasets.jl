function available_datasets()
	depmsg = "available_datasets() is deprecated, use datasets() instead."
	Base.depwarn(depmsg, :available_datasets)

    package_directory = Pkg.dir("RDatasets", "data")
    for directory in readdir(package_directory)
        @printf "* Package: %s\n" directory
        for file in readdir(joinpath(package_directory, directory))
            dataname = replace(file, ".csv.gz", "")
            dataname = replace(dataname, ".rda", "")
            @printf "    * Data Set: %s\n" dataname
        end
    end
end
