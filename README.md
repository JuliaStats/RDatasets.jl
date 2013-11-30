# RDatasets.jl

The RDatasets package provides an easy way for Julia users to experiment with most of the standard data sets that are available in the core of R as well as datasets included with many of R's most popular packages. This package is essentially a simplistic port of the Rdatasets repo created by Vincent Arelbundock, who conveniently gathered data sets from many of the standard R packages in one convenient location on GitHub at https://github.com/vincentarelbundock/Rdatasets

In order to load one of the data sets included in the RDatasets package, you will need to have the `DataFrames` package installed. This package is automatically installed as a dependency of the `RDatasets` package if you install `RDatasets` as follows:

    Pkg.add("RDatasets")

After installing the RDatasets package, you can then load data sets using the `data()` function, which takes the name of a package and a data set as arguments:

    using RDatasets
    iris = data("datasets", "iris")
    neuro = data("boot", "neuro")

# Data Sets

The `RDatasets.packages()` function returns a table of represented R packages:

Package|Title
---|---
COUNT|Functions, data and code for count data.
Ecdat|Data sets for econometrics
HSAUR|A Handbook of Statistical Analyses Using R
HistData|Data sets from the history of statistics and data visualization
KMsurv|Data sets from Klein and Moeschberger (1997), Survival Analysis
MASS|Support Functions and Datasets for Venables and Ripley's MASS
SASmixed|Data sets from SAS System for Mixed Models
Zelig|Everyone's Statistical Software
boot|Bootstrap Functions (originally by Angelo Canty for S)
car|Companion to Applied Regression
cluster|Cluster Analysis Extended Rousseeuw et al.
datasets|The R Datasets Package
gap|Genetic analysis package
ggplot2|An implementation of the Grammar of Graphics
lattice|Lattice Graphics
lme4|Linear mixed-effects models using Eigen and S4
mgcv|Mixed GAM Computation Vehicle with GCV/AIC/REML smoothness estimation
mlmRev|Examples from Multilevel Modelling Software Review
nlreg|Higher Order Inference for Nonlinear Heteroscedastic Models
plm|Linear Models for Panel Data
plyr|Tools for splitting, applying and combining data
pscl|Political Science Computational Laboratory, Stanford University
psych|Procedures for Psychological, Psychometric, and Personality Research
quantreg|Quantile Regression
reshape2|Flexibly reshape data: a reboot of the reshape package.
robustbase|Basic Robust Statistics
rpart|Recursive Partitioning
sandwich|Robust Covariance Matrix Estimators
sem|Structural Equation Models
survival|Survival Analysis
vcd|Visualizing Categorical Data

The `RDatasets.datasets()` function returns a table describing the 700+ included datasets. Or pass in a package name (e.g. `RDatasets.datasets("mlmRev")`) for a targeted table:

Package|Dataset|Title|Rows|Columns
---|---|---|---:|---:
mlmRev|Chem97|Scores on A-level Chemistry in 1997|31022|8
mlmRev|Contraception|Contraceptive use in Bangladesh|1934|6
mlmRev|Early|Early childhood intervention study|309|4
mlmRev|Exam|Exam scores from inner London|4059|10
mlmRev|Gcsemv|GCSE exam score|1905|5
mlmRev|Hsb82|High School and Beyond - 1982|7185|8
mlmRev|Mmmec|Malignant melanoma deaths in Europe|354|6
mlmRev|Oxboys|Heights of Boys in Oxford|234|4
mlmRev|ScotsSec|Scottish secondary school scores|3435|6
mlmRev|bdf|Language Scores of 8-Graders in The Netherlands|2287|28
mlmRev|egsingle|US Sustaining Effects study|7230|12
mlmRev|guImmun|Immunization in Guatemala|2159|13
mlmRev|guPrenat|Prenatal care in Guatemala|2449|15
mlmRev|star|Student Teacher Achievement Ratio (STAR) project data|26796|18

# Licensing and Intellectual Property

Following Vincent's lead, we have assumed that all of the data sets in this repository can be made available under the GPL-3 license. If you know that one of the datasets released here should not be released publicly or if you know that a data set can only be released under a different license, please contact me so that I can remove the data set from this repository.
