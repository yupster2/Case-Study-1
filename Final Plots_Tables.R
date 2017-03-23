#install package ggplot2 and themes
install.packages("ggplot2")
library(ggplot2)

#Create color plot of GDP value by Income Group
g<-ggplot(dt, aes(Income.Group, gdp))+geom_point(color="firebrick")

g
#Cut GDP Ranking into 5 quantile groups; make table Income Group by GDP

install.packages("data.table")
library(data.table)
breaks <- quantile(dt$Ranking, probs = seq(0, 1, 0.2), na.rm = TRUE)
dt$quantileGDP <- cut(dt$Ranking, breaks = breaks)
dt[Income.Group == "Lower middle income", .N, by = c("Income.Group", "quantileGDP")]
