require("DataFrames")
using DataFrames

function make_help_index(datasets_csv_name::String, output_file_dir::String)

    output_file_dir = file_path(julia_pkgdir(), "RDatasets", "doc")
    # 
    output_file_name = file_path(output_file_dir, "_JL_INDEX_")
    d = read_table(datasets_csv_name)
    #    
    f = open(output_file_name, "w")
    println(f, "RDatasets  README  A package with datasets originally distributed with R or R add-on packages")
    for idx in 1:nrow(d)
        file_location = match(r".*/doc/(.*)\.html", d["doc"][idx]).captures[1]
        println(f, d["Item"][idx], "  ", file_location, "  ", d["Title"][idx])
    end
    close(f)

end

make_help_index(name::String) = make_help_index(name, file_path(julia_pkgdir(), "RDatasets", "doc"))
make_help_index() = make_help_index(file_path(julia_pkgdir(), "RDatasets", "doc", "datasets.csv"), file_path(julia_pkgdir(), "RDatasets", "doc"))
