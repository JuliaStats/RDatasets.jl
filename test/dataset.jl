module TestDataset
    using Base.Test
    using RDatasets

    goodname(sym) = ismatch(r"^([_xA-Z]|pH|pK)", string(sym))

    package_directory = joinpath(dirname(@__FILE__), "..", "data")

    sets = RDatasets.datasets()

    for r in eachrow(sets)
        pkg = convert(String, r[:Package])
        ds = convert(String, r[:Dataset])
        recorded_size = (r[:Rows], r[:Columns])

        df = dataset(pkg, ds)

        if size(df) != recorded_size
            println("Package: $pkg Dataset: $ds -")
            @test size(df) == recorded_size
        end

        if !all(map(goodname, names(df)))

            println("Package: $pkg Dataset: $ds -")
            println("Names: ", names(df))
            throw(ErrorException("""

                Column names should match what 'CSV.read()' would produce,
                except words should be 'UpperCamelCase' (acronyms uppercase), &
                '_' used only where two acronyms or two numbers would be concatenated.
            """))
        end
    end
end
