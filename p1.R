dir.create("repdata")
setwd("repdata")
download.file("https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2Factivity.zip",
              "temp.zip")
unzip("temp.zip")
list.files()
DF <- read.csv(list.files(pattern="csv"))
head(DF)
unique(DF$steps)

# What is mean total number of steps taken per day?
dailySum <- aggregate(formula = steps~date, 
                      FUN = sum, 
                      data = DF)
hist(dailySum$steps, xlab = "steps per day", main = "Histogram of steps per day")
median(dailySum$steps)
mean(dailySum$steps)

# What is the average daily activity pattern?
stepInterval <- aggregate(formula = interval~date, 
                          FUN = mean, 
                          data = DF)
plot(as.ts(dailyMean$),
     type="l")