#first, you will need to load any packages you will be using
install.packages('pastecs')
install.packages('psych')
install.packages('sm')
install.packages('vcd')
library(pastecs)
library(psych)
library(sm)
library(vcd)
#second, you will need to set your working directory
setwd('F:/r tutorials/descriptives and independent t-tests')
#read in your data frame 
df <- read.csv('LIWC2015 Results (love_letters_text_files (166 files)) with independent variables.csv')
#check your variable names 
names(df)
head(df)
#let's take a look at just some of our variables - there are a couple of ways to do this
vars <- c("age", "sex")
head(df[vars])
head(df$age)
head(df$sex)
#lets looks at summary stats
summary(df)
summary(df$age)
#more descriptive stats (to look indvidually you will need to look at the [vars])
mystats <- function(x, na.omit=FALSE){
  if (na.omit)
    x <- x[!is.na(x)]
  m <- mean(x)
  n <- length(x)
  s <- sd(x)
  skew <- sum((x-m)^3/s^3)/n
  kurt <- sum((x-m)^4/s^4)/n - 3
  return(c(n=n, mean=m, stdev=s, skew=skew, kurtosis=kurt))
}

sapply(df[vars], mystats)
sapply(df, mystats)
#or you can use the psych package and get even more, but this will require you to upload the psych package 
describe(df)
#and if you need to take a quick look at CI 
stat.desc(df[vars])
stat.desc(df$age)
stat.desc(df)
#what if you want to look at these stats by group (either by mean or sd and others)
aggregate(df[vars], by=list(condition=df$condition), mean)
aggregate(df, by=list(condition=df$condition), mean)
aggregate(df[vars], by=list(condition=df$condition), sd)
#but what if you want to look at a bunch of these stats by group
describe.by(df[vars], df$condition)
describe.by(df, df$condition)
#want to take a look at frequency
mytable <- with(df, table(df$sex))
mytable
prop.table(mytable)
prop.table(mytable)*100
#want to take a look at frequnecy by group
mytable <- xtabs(~ condition+sex, data=df)
mytable
#how do we "see" these descriptives 
#one option, bar plots
counts <- table(df$sex)
counts
#want to make bar plot vertical
barplot(counts,
        main="Simple Bar Plot",
        xlab="Age", ylab="Frequency")
#want to make bar plot horizontal
barplot(counts,
        main="Horizontal Bar Plot",
        xlab="Frequency", ylab="Age",
        horiz=TRUE)
#but wait what groups

#histograms
#simple histogram
par(mfrow=c(2,2))
hist(df$age)
#more complex histograms
x <- df$age
h<-hist(x,
        breaks=8,
        col="red",
        xlab="Age",
        main="Histogram with normal curve and box")
xfit<-seq(min(x), max(x), length=40)
yfit<-dnorm(xfit, mean=mean(x), sd=sd(x))
yfit <- yfit*diff(h$mids[1:2])*length(x)
lines(xfit, yfit, col="blue", lwd=2)
#add box()
#simple boxplot 
boxplot(df$age, main="Box plot", ylab="Age")
boxplot.stats(df$age)
#boxplot comparisons
boxplot(we ~ condition, data=df,
        main="Data",
        xlab="Condition",
        ylab="Age")
#tests of independence
mytable <- xtabs(~ condition+sex, data=df)
chisq.test(mytable)
