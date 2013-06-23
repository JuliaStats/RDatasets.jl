#
# Correctness Tests
#

require("test.jl")

using DataFrames

my_tests = ["test/RDatasets.jl"]

println("Running tests:")

for my_test in my_tests
    println(" * $(my_test)")
    include(my_test)
end
