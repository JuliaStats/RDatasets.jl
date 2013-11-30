# Read command line args
args = commandArgs(TRUE)
package = args[1]
datasets = strsplit(args[2], ",")[[1]]
dir = args[3]

# Load package and extract package info
suppressWarnings({
	if (!require(package, character.only = TRUE)) {
		r = getOption("repos")
		if (r["CRAN"] == "@CRAN@")
			r = "http://cran.rstudio.com/"
		install.packages(package, repos = r)
		library(package, character.only = TRUE)
	}
	pdir = file.path(dir, package)
	dir.create(pdir)
})

x = library(help = package, character.only = TRUE)[["info"]][[1]]
r = "^Title:[ ]*([^ ].+)$"
title = gsub("[ \n]+", " ", sub(r, "\\1", x[grep(r, x)]))
cat(title, file = file.path(dir, "package_title.txt"))

sum = data(package = package)[["results"]][, c("Package", "Item", "Title")]
sum = sum[match(datasets, sum[, "Item"]), ]
file = file.path(dir, "datasets.psv")
write.table(sum, file = file, row.names = FALSE, sep = "|")

# Check columns to see whether csv needs quotes
needquotes = function(x) {
	if (is.character(x)) 
		return(any(grepl("[,\n]", x)))
	is.factor(x) && any(grepl("[,\\n]", levels(x)))
}
# Check whether attribute(s) will break read_rda
breakingattributes = function(x) {
	cl = class(x)
	if (cl == "list")
		return(any(sapply(x, breakingattributes)))
	cl %in% c("formula", "function", "NULL")
}
# The higher the number, the more likely it ought to be a factor
factorness = function(x) {
	ch = as.character(x)
	n = suppressWarnings(as.numeric(ch))
	if (all(is.na(ch) == is.na(n)))
		return(9999)
	length(x)/length(unique(x))
}
# Abbreviated because we"re not passing anything with numberlike labels
unfactor = function(x) {
	ch = as.character(x)
	l = as.logical(toupper(ch))
	if (all(is.na(ch) == is.na(l)))
		return(l)
	ch
}
# Clean names
clean = function(x) {
	gsub("\\W", "_", x)
}

# Loop through datasets
for (dataset in datasets) {
	print(dataset)
	eval(parse(text = paste0("data(", dataset, ", package=package)")))
	ds = get(dataset)

	# Clean field names
	if (any(c("table", "matrix") %in% class(ds))) {
		dn = dimnames(ds)
		if (!is.null(dn)) {
			if (length(dn) == 2) {
				dimnames(ds)[[2]] = clean(dn[[2]])
			} else
				names(dimnames(ds)) = clean(names(dn))
		}
	} else
		names(ds) = clean(names(ds))

	# Make sure series are preserved
	series = tsp(ds)
	if (!is.null(series)) {
		if (length(series) != 3)
			stop(package, " ", dataset, ": strange time series.\n")
		se = seq(series[1], series[2], 1)
		rep(se, each = series[3])
		row.names(ds) = rep(se, each = series[3])
	}

	# Decide whether row names should be saved
	use_row_names = if (inherits(ds, "table") && length(dimnames(ds)) != 2) {
		FALSE
	} else {
		nr = NROW(ds)
		rn = row.names(ds)
		!(is.null(rn) || 
		  all(rn == 1:nr) || all(rn == paste0("[", 1:nr, ",]")) ||
		  any(sapply(ds, function(x) all(rn == x))))
	}

	# Determine whether to save as rda or csv
	factors = sapply(ds, is.factor)
	fness = sapply(ds[factors], factorness)
	has_list_cols = any(sapply(ds, function(x) any(class(x) %in% c("POSIXt"))))

	if (any(factors) && max(fness) >= 2 && !has_list_cols) {
		# Rda-specific cleaning

		ats = attributes(ds)
		if (is.list(ats)) {
			bad = sapply(ats, breakingattributes)
			if (any(bad)) {
				for (at in names(ats[bad])) {
					attr(ds, at) = NULL
				}
			}
		}

		for (i in seq_along(ds)) {
			v = ds[[i]]
			if (is.numeric(v)) {
				v_int = as.integer(v)
				if (all(v == as.numeric(v_int), na.rm = TRUE))
					ds[i] = v_int
			} else if (factors[i] && (fness[names(factors)[i]] < 1.25))
				ds[i] = unfactor(v)

			attr(ds[[i]], "contrasts") = NULL
		}

		if (use_row_names) {
			ds["x______"] = rn
			nc = length(ds)
			ds = ds[c(nc, 1:(nc-1))]
			names(ds)[1] = ""
		}

		# Save .rda
		assign(dataset, ds)
		save(list = dataset, file = paste0(pdir, "/", dataset, ".rda"))
	} else {
		# Csv-specific cleaning
		quotes = any(sapply(ds, needquotes))
		if (use_row_names)
			quotes = quotes || needquotes(rn)

		# Save .csv.gz
		file = paste0(pdir, "/", dataset, ".csv.gz")
		gz = gzfile(file, "w", compression = 9)
		write.csv(ds, file = gz, row.names = use_row_names, quote = quotes)
		close(gz)
	}
}

q("no")
