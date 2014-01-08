#
# Correctness Tests
#

using Base.Test
using DataFrames

my_tests = ["data.jl",
            "datasets.jl",
            "packages.jl"]

println("Running tests:")

for my_test in my_tests
    println(" * $(my_test)")
    include(my_test)
end
