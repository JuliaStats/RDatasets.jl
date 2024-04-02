# special cases for datasets that need more rows for proper column type detection
const Dataset_typedetect_rows = Dict{Tuple{String, String}, Union{Vector,Dict}}(
    ("gap", "PD") => [x in [1:15...,17] ? String : Int for x in 1:22],
    ("vcd", "Bundesliga") => [Union{Missing, String}, Union{Missing, String}, Int64, Int64, Int64, Int64, String]
)

function dataset(package_name::AbstractString, dataset_name::AbstractString)
    basename = joinpath(@__DIR__, "..", "data", package_name)
    # First, identify possible files
    rdataname = joinpath(basename, string(dataset_name, ".RData"))
    rdaname = joinpath(basename, string(dataset_name, ".rda"))
    csvname = joinpath(basename, string(dataset_name, ".csv.gz"))
    # Then, check to see which exists.  If none exist, error.
    dataset = if isfile(rdataname)
        load(rdataname)[dataset_name]
    elseif isfile(rdaname)
        load(rdaname)[dataset_name]
    elseif isfile(csvname)
        open(csvname,"r") do io
            uncompressed = IOBuffer(read(GzipDecompressorStream(io)))
            DataFrame(CSV.File(uncompressed, delim=',', quotechar='\"', missingstring="NA",
                      types=get(Dataset_typedetect_rows, (package_name, dataset_name), nothing)) )
        end
    else
        error("Unable to locate dataset file $rdaname or $csvname")
    end
    # Finally, inject metadata into the dataframe to indicate origin:
    DataFrames.metadata!(dataset, "RDatasets.jl", (string(package_name), string(dataset_name)))
    return dataset
end


"""
    RDatasets.description(package_name::AbstractString, dataset_name::AbstractString)
    RDatasets.description(df::DataFrame) # only call this on dataframes from RDatasets!

Returns an `RDatasetDescription` object containing the description of the dataset.

Invoke this function in exactly the same way you would invoke `dataset` to get the dataset itself.

This object prints well in the REPL, and can also be shown as markdown or HTML.

!!! note Unexported
    This function is left deliberately unexported, since the name is pretty common.
"""
function description(package_name::AbstractString, dataset_name::AbstractString)
    doc_html_file = joinpath(@__DIR__, "..", "doc", package_name, "$dataset_name.html")
    if isfile(doc_html_file)
        return RDatasetDescription(read(doc_html_file, String))
    else
        return RDatasetDescription("No description available.")
    end
end

# This is a convenience function to get the description of a dataset from a DataFrame.
# Since we set metadata on the DataFrame, we can use this to get the description,
# if it exists.
function description(df::AbstractDataFrame)
    if "RDatasets.jl" in DataFrames.metadatakeys(df)
        package_name, dataset_name = DataFrames.metadata(df, "RDatasets.jl")
        return description(package_name, dataset_name)
    else
        @warn "No metadata indicating dataset origin found.  Returning default description."
        return RDatasetDescription("No description available.")
    end
end

"""
    RDatasetDescription(content::String)

A type to hold the content of a dataset description.

The main purpose of its existence is to provide a way to display the content
differently in HTML and markdown contexts.

Invoked through [`RDatasets.description`](@ref).
"""
struct RDatasetDescription
    content::String
end

function Base.show(io::IO, mime::MIME"text/plain", d::RDatasetDescription)
    s = description_to_markdown(d.content)
    # Here, we show a Markdown.jl object, which the REPL can render correctly
    # as markdown, as it does in help-mode.
    show(io, mime, Markdown.parse(s))
end
function Base.show(io::IO, mime::MIME"text/markdown", d::RDatasetDescription)
    s = description_to_markdown(d.content)
    # Here, we return a Markdown string directly.  This is useful for e.g. documentation, 
    # where we want to render the markdown as HTML.
    show(io, mime, s)
end
# This returns raw HTML documentation.
function Base.show(io::IO, mime::MIME"text/html", d::RDatasetDescription)
    show(io, mime, Docs.HTML(d.content))
end


"""
    description_to_markdown(string::String)

Converts an HTML string to markdown.  This function is written specifically 
for HTML descriptions in RDatasets.jl, and so is a bit opinionated on what to 
replace, etc.

It replaces all known HTML tags using regex, and then removes all other HTML tags.

## Behaviour

Currently, it handles the following HTML tags:
- `<h1>`, `<h2>`, `<h3>`, `<h4>`, `<h5>`, `<h6>` -> `#`, `##`, `###`, `####`, `#####`, `######`
- `<title>` -> `#`
- `<code>` -> `` `code` ``
- `<pre>` -> "```R\\npre\\n```"
- `<EM>` -> `*EM*`
- `<B>` -> `**B**`
- `&ndash;` -> `-`

## TODOs

- Tables
- Links
- Images
"""
function description_to_markdown(string)
    html_header_regex = r"<h(?'hnum'\d)>(?'content'[^<]+)<\/h\g'hnum'>"
    function regexmatch2md(matched_string)
        m = match(html_header_regex, matched_string)
        if isnothing(m.captures[1]) || isnothing(m.captures[2])
            return matched_string
        end

        hnum = parse(Int, m[:hnum])
        content = m[:content]

        return join(("\n", "#"^hnum, " ", content, "\n\n"))
    end
    title_matcher_regex = r"<title>(?'content'[^<]+)<\/title>"
    code_matcher_regex = r"<code>(?'content'[^<]+)<\/code>"
    pre_matcher_regex = r"<pre>(?'content'[^<]+)<\/pre>"
    emph_matcher_regex = r"<(?i)EM(?-i)>(?'content'[^<]+)<\/(?i)EM(?-i)>"
    b_matcher_regex = r"<(?i)B(?-i)>(?'content'[^<]+)<\/(?i)B(?-i)>"
    new_string = replace(
        string, 
        html_header_regex => regexmatch2md, 
        title_matcher_regex => titlestr -> "# " * match(title_matcher_regex, titlestr)[:content],
        code_matcher_regex => codestr -> "`" * match(code_matcher_regex, codestr)[:content] * "`",
        pre_matcher_regex => prestr -> "\n```R\n" * match(pre_matcher_regex, prestr)[:content] * "\n```\n",
        emph_matcher_regex => emphstr -> "*" * match(emph_matcher_regex, emphstr)[:content] * "*",
        b_matcher_regex => bstr -> "**" * match(b_matcher_regex, bstr)[:content] * "**",
        "&ndash;" => "-",
    )
    nohtml = replace(new_string, Regex("<[^>]*>") => "")
    return replace(nohtml, Regex("\n\n+") => "\n\n")
end
