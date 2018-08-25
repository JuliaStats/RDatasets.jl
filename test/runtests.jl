#
# Correctness Tests
#

using RDatasets
using Test

my_tests = ["packages.jl",
            "datasets.jl",
            "dataset.jl"]

@testset "$my_test" for my_test in my_tests
    @info "Running $(my_test)..."
    include(my_test)
end
