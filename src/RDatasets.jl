module RDatasets
    if isdefined(Base, :Experimental) && isdefined(Base.Experimental, Symbol("@optlevel"))
        @eval Base.Experimental.@optlevel 1
    end

    import Markdown
    import SciMLPublic: @public
    using Reexport, RData, CSV, CodecZlib
    @reexport using DataFrames

    export dataset
    @public description, packages

    global __packages = nothing
    global __datasets = nothing

    include("dataset.jl")
    include("datasets.jl")
    include("packages.jl")
end
