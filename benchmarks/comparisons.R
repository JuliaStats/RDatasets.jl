df <- read.csv(file.path("results", "performance.tsv"), sep = "\t")

ggplot(melt(df), aes(x = variable, y = value, fill = variable)) +
  stat_summary(fun.data = "mean_cl_boot", geom = "bar") +
  stat_summary(fun.data = "mean_cl_boot", geom = "errorbar") +
  theme(legend.position = "none")

ggplot(melt(df), aes(x = variable, y = value, fill = variable)) +
  geom_boxplot() +
  theme(legend.position = "none")

ggplot(df, aes(x = RCSVTime, y = TableTime)) +
 geom_point() +
 geom_abline() +
 xlim(0, 8) +
 ylim(0, 8)

ggplot(df, aes(x = RCSVTime, y = TableTime)) +
 geom_point() +
 geom_abline() +
 xlim(0, 2) +
 ylim(0, 2)

ggplot(df, aes(x = log(RCSVTime), y = log(TableTime))) +
 geom_point()
