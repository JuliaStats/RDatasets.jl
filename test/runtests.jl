#
# Correctness Tests
#

using RDatasets

my_tests = ["packages.jl",
            "datasets.jl",
            "dataset.jl"]

println("Running tests:")

for my_test in my_tests
    println(" * $(my_test)")
    include(my_test)
end
