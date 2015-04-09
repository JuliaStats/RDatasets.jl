module TestDataset
    using Base.Test
    using RDatasets

    function badname(sym)
        n = string(sym)
        ismatch(r"^[a-z]", n) || contains(n, ".")
    end

    package_directory = joinpath(dirname(@__FILE__), "..", "data")

    sets = RDatasets.datasets()

    for r in eachrow(sets)
        pkg, ds = r[:Package], r[:Dataset]
        recorded_size = (r[:Rows], r[:Columns])

        df = dataset(pkg, ds)

        if size(df) != recorded_size
            println("Package: $pkg Dataset: $ds -")
            @test size(df) == recorded_size
        end
    end
end
