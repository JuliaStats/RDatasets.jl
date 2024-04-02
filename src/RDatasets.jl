module RDatasets
    if isdefined(Base, :Experimental) && isdefined(Base.Experimental, Symbol("@optlevel"))
        @eval Base.Experimental.@optlevel 1
    end

    import Markdown
    using Reexport, RData, CSV, CodecZlib
    @reexport using DataFrames

    export dataset

    global __packages = nothing
    global __datasets = nothing

    include("dataset.jl")
    include("datasets.jl")
    include("packages.jl")
end
