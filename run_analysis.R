library(curl)
library (RCurl)
library(dplyr)

#setting the working directory
setwd("~/Coursera/Getting and Cleaning Data/Week4/Wearables")

#download file from the link provided
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, destfile = "HAR.zip", method = "curl")

#unzip the data
unzip(zipfile="HAR.zip")

#Merge the training and the test sets to create one data set
# read the training set
xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
ytrain <- read.table("./UCI HAR Dataset/train/y_train.txt")
subjecttrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
str(xtrain)

# read the test set
xtest <- read.table("./UCI HAR Dataset/test/X_test.txt")
ytest <- read.table("./UCI HAR Dataset/test/y_test.txt")
subjecttest <- read.table("./UCI HAR Dataset/test/subject_test.txt")

#Merge the train and test data sets
xdata <- rbind(xtrain,  xtest)
ydata <- rbind(ytrain, ytest)
subject <- rbind(subjecttrain, subjecttest)
##View(ydata)

#Column names of features #Appropriately label the data set with descriptive variable names.
features <- read.table("./UCI HAR Dataset/features.txt")
colnames(xdata) <- features[,2]

#column names of ydata, subject amd activities
colnames(ydata) <- "ActivityID"
colnames(subject) <- "SubjectID"
activities <- read.table("./UCI HAR Dataset/activity_labels.txt")
colnames(activities) <- c("ActivityID","Activity")

#Extract only the measurements on the mean and standard deviation for each measurement
xdata_msd <- xdata [, grepl("mean\\(\\)",colnames(xdata))|grepl("std\\(\\)",colnames(xdata))]
#str(xdata_msd)

#combine x, y and subject tables
combined <- cbind(subject,ydata,xdata_msd)
##View(combined)
#Uses descriptive activity names to name the activities in the data set
combined[,2] <- activities[combined[,2], 2]


#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidydata <- combined %>% 
  group_by(SubjectID, ActivityID) %>%
  summarise_all(funs(mean))

#write tidy data set to a text file
write.table(tidydata, "./tidydataset.txt", row.names = FALSE)
  
