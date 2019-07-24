@testset "Datasets validity" begin
    goodname(sym) = occursin(r"^[A-Za-z0-9_][A-Za-z0-9_.]*$", string(sym))

    allsets = RDatasets.datasets()
    for pkgsets in groupby(allsets, :Package)
        pkg = convert(String, pkgsets[1, :Package])
        @testset "$pkg datasets" begin
            for r in eachrow(pkgsets)
                ds = convert(String, r[:Dataset])
                @testset "$pkg::$ds dataset" begin
                    recorded_size = (r.Rows, r.Columns)
                    df = dataset(pkg, ds)

                    @test size(df) == recorded_size
                    # test there are no bad column names:
                    #  - words are 'UpperCamelCase' (acronyms uppercase)
                    #  - '_' used only where two acronyms or two numbers would be concatenated
                    @test names(df)[.!goodname.(names(df))] == String[]
                end
            end
        end
    end
end
