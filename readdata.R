require(lubridate)
require(caret)
require(randomForest)
require(gbm)
cat("Reading training data\n")
system.time((crimeTrainFull = read.csv("train.csv")))

trainIndexes = createDataPartition(crimeTrainFull$Category, p = 0.1)$Resample1
crimeTrain = crimeTrainFull[trainIndexes,]   # 10% sample

cat("Reading testing data\n")
system.time((crimeTest = read.csv("test.csv")))


#table(train$Category)  #39 categories, 879 descriptions, 17 resolutions, 10 PD Districts
cat("Transforming Data")
crimeTrain$Month = month(crimeTrain$Dates)
crimeTest$Month = month(crimeTest$Dates)
crimeTrain = crimeTrain[,c("Category", "X", "Y", "DayOfWeek", "Month", "PdDistrict")]

crimeTestX = crimeTrain[,c("X", "Y", "DayOfWeek", "Month", "PdDistrict")]


