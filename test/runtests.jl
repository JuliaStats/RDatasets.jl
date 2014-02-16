#
# Correctness Tests
#

using Base.Test
using DataArrays
using DataFrames

my_tests = ["dataset.jl",
            "datasets.jl",
            "packages.jl"]

println("Running tests:")

for my_test in my_tests
    println(" * $(my_test)")
    include(my_test)
end
