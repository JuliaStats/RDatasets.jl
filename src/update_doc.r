install_packages <- function(packages) {
    # Pick a decent mirror if none set
    r <- getOption("repos")
    if (r["CRAN"] == "@CRAN@") {
        r <- "http://cran.rstudio.com/"
    }
    suppressWarnings({install.packages(packages, repos = r)})
}

install_packages(c("R2HTML"))
library(R2HTML)

write_doc = function(package, dataset) {
    help.ref <- try(help(eval(dataset), package=eval(package)), silent = TRUE)
    doc <- try(utils:::.getHelpFile(help.ref), silent = TRUE)
    try(dir.create(paste0('doc/', package)), silent = TRUE)
    fn_doc <- paste0('doc/', package, '/', dataset, '.html')
    tools::Rd2HTML(doc, out = fn_doc)
}

do_package_update <- function(data_dir, package_df, old_dataset_df, dataset_df, mismatched_dims_df, package) {
    suppressWarnings({library(package, character.only = TRUE)})

    # Get package description
    pdesc <- packageDescription(package)
    new_row <- as.data.frame(pdesc[c("Package", "Title")],
                             stringsAsFactors = FALSE)
    package_df <- rbind(package_df, new_row)

    pdat <- data(package=package)$results

    datasets <- dir(path = file.path(data_dir, package))

    # Trim filenames to dataset names
    r <- "(.+)\\.(csv\\.gz|rda)$"
    format_recognized <- grepl(r, datasets)
    if (!(all(format_recognized))) {
        stop("Unrecognized formats:\n",
             cat(datasets[!format_recognized], sep = "\n"))
    }
    datanames <- sub(r, "\\1", datasets)

    for (dataname in datanames) {
        evaltext = paste0("data(", dataname, ", package=package)")
        eval(parse(text = evaltext))
        ds <- get(dataname)

        write_doc(package, dataname)

        # Get dataset description
        title <- unique(pdat[, "Title"][pdat[, "Item"] == dataname])
        if (length(title) != 1) {
            stop(package, "/", dataname, " had ", length(title), " descriptions.")
        }

        # Old dims to fall back on
        old_row = subset(old_dataset_df,
                         Dataset == dataname & Package == package)
        nr <- if (nrow(old_row)) old_row$Rows[[1]] else NA
        nc <- if (nrow(old_row)) old_row$Columns[[1]] else NA

        # Check against new dims when simple
        new_nr <- NROW(ds)
        new_nc <- NCOL(ds)
        if (!(any(c("table", "ltraj") %in% class(ds))) &&
            class(ds) != "list" &&
            is.numeric(new_nr) &&
            is.numeric(new_nc)) {

            expected_cols <- c(nc, nc - 1) # row.names sometimes included
            if (!is.numeric(nr) || !is.numeric(nc)) {
                nr <- new_nr
                nc <- new_nc
            } else if (new_nr != nr || !(new_nc %in% expected_cols)) {

                new_row <- data.frame(Package = package,
                                      Dataset = dataname,
                                      Class = class(ds),
                                      OldRows = nr,
                                      OldColumns = nc,
                                      NewRows = new_nr,
                                      NewColumns = new_nc)

                mismatched_dims_df <- rbind(mismatched_dims_df, new_row)

            }
        }

        new_row <- data.frame(Package = package,
                              Dataset = dataname,
                              Title = title,
                              Rows = nr,
                              Columns = nc,
                              stringsAsFactors = FALSE)

        dataset_df <- rbind(dataset_df, new_row)
    }
    return(list(package_df = package_df, dataset_df = dataset_df, mismatched_dims_df = mismatched_dims_df))
}

update_package_doc <- function(pkg_dir, package) {
    data_dir <- file.path(pkg_dir, "data")
    doc_dir <- file.path(pkg_dir, "doc")

    package_fn <- file.path(doc_dir, "packages.csv")
    dataset_fn <- file.path(doc_dir, "datasets.csv")

    package_df <- read.csv(package_fn)
    dataset_df <- read.csv(dataset_fn)

    install_packages(c(package))

    mismatched_dims_df <- data.frame()
    dfs <- do_package_update(data_dir, package_df, dataset_df, dataset_df, mismatched_dims_df, package)
    package_df <- dfs$package_df
    dataset_df <- dfs$dataset_df
    mismatched_dims_df <- dfs$mismatched_dims_df

    package_df <- sort_upper_first(clean(package_df), c("Package"))
    dataset_df <- sort_upper_first(clean(dataset_df), c("Package", "Dataset"))

    write(package_df, package_fn)
    write(dataset_df, dataset_fn)
    return(mismatched_dims_df)
}

update_docs <- function(pkg_dir) {
    data_dir <- file.path(pkg_dir, "data")
    doc_dir <- file.path(pkg_dir, "doc")

    package_fn <- file.path(doc_dir, "packages.csv")
    dataset_fn <- file.path(doc_dir, "datasets.csv")

    old_dataset_df <- read.csv(dataset_fn)

    package_df <- data.frame()
    dataset_df <- data.frame()
    mismatched_dims_df <- data.frame()

    packages <- dir(path = data_dir)

    # Install any missing packages
    new_packages <- packages[!(packages %in% installed.packages()[, "Package"])]
    if (length(new_packages)) {
        install_packages(new_packages)
    }

    for (package in packages) {
        do_package_update(data_dir, package_df, old_dataset_df, dataset_df, mismatched_dims_df, package)
    }

    stopifnot(nrow(dataset_df) > 0)

    package_df <- sort_upper_first(clean(package_df), c("Package"))
    dataset_df <- sort_upper_first(clean(dataset_df), c("Package", "Dataset"))

    write(package_df, package_fn)
    write(dataset_df, dataset_fn)

    return(mismatched_dims_df)
}

write <- function(df, fn) {
    write.table(df, file = fn, sep = ",", qmethod = "double", row.names = FALSE)
}

clean <- function(df) {
    for (n in names(df)) {
        col <- df[[n]]
        if ("character" %in% class(col)) {
            df[n] <- gsub("\\s+", " ", col)
        }
    }
    return(df)
}

sort_upper_first <- function(df, colnames) {
    ord <- do.call(order, lapply(df[colnames], sort_vals))
    df[ord, ]
}

# for sorting uppercase characters first
sort_vals <- function(chr_vec) {
    sapply(chr_vec, function(chr) {
        ns <- as.numeric(charToRaw(chr))
        val <- sum(sapply(1:length(ns), function(i) {ns[i] / 128^(i-1)}))
    })
}
