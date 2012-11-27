basedir <- file.path(path.expand("~/.julia"), "RDatasets", "data")

performance <- data.frame()

for (directory in dir(basedir))
{
  for (dataset in dir(file.path(basedir, directory)))
  {
    start.time <- Sys.time()
    df <- read.csv(file.path(basedir, directory, dataset))
    end.time <- Sys.time()
    performance <- rbind(performance,
                  data.frame(Filename = file.path(basedir, directory, dataset),
                             RCSVTime = end.time - start.time))
  }
}

write.csv(performance,
	      file = file.path("results", "R_performance.csv"),
	      row.names = FALSE)
