setwd("C:/Users/nn561/learning/UCI HAR Dataset")

subjectTrain = read.table('./train/subject_train.txt',header=FALSE)
xTrain = read.table('./train/x_train.txt',header=FALSE)
yTrain = read.table('./train/y_train.txt',header=FALSE)

subjectTest = read.table('./test/subject_test.txt',header=FALSE)
xTest = read.table('./test/x_test.txt',header=FALSE)
yTest = read.table('./test/y_test.txt',header=FALSE)

xFull <- rbind(xTrain, xTest)
yFull <- rbind(yTrain, yTest)
subjectFull <- rbind(subjectTrain, subjectTest)

View(xFull)
View(yFull)
View(subjectFull)

features <- read.table('features.txt')
msd <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
View(msd)
xFull_msd <- xFull[,mean.sd]
View(xFull_msd)
names(xFull_msd) <- features[msd, 2]
View(xFull_msd)

activities <- read.table("activity_labels.txt")
View(activities)
yFull[, 1] = activities[yFull[, 1], 2]

names(yFull) <- "Activity"
View(yFull)
names(subjectFull)<-"Subject"

Merged <- cbind(subjectFull, yFull,xFull_msd)
View(Merged)
str(Merged)

Agg <-aggregate(.~Subject + Activity, Merged, mean)
View(Agg)
write.table(Agg, file = "tidydata.txt",row.name=FALSE)
