#Case Study1 Code - Rob Rivens Intro to Data Science Section 402
#Download GDP Data from website
options(repos = c(CRAN = "http://cran.rstudio.com"))
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"

#Set working directory and specify path for file download
setwd("/Users/robertrivens/SMU Data Science/Intro to Data Science/CaseStudy1")
f <- file.path(getwd(), "GDP.csv")
download.file(url, f)
install.packages("data.table")
library(data.table)
#Populate GDP Data Table, excluding column headings; set variable names
dtGDP <- data.table(read.csv(f, skip = 4, nrows = 215))
dtGDP <- dtGDP[X != ""]
dtGDP <- dtGDP[, list(X, X.1, X.3, X.4)]
setnames(dtGDP, c("X", "X.1", "X.3", "X.4"), c("CountryCode","Ranking","Long.Name","gdp"))

#Download Education Data from website
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"

#Set working directory and specify path for file download
f <- file.path(getwd(), "FEDSTATS_Country.csv") 
download.file(url, f)

#Populate Education Data Table
dtEd <- data.table(read.csv(f))
