#set general working directory 
setwd("C:/Users/radae500/Desktop/Coursera/Getting and Cleaning Data/UCI HAR Dataset")

#create variable containing the 6 labels
activity_labels <- read.table("activity_labels.txt")[,2]

#create featureNames variable containing a list of features
features <- read.table("features.txt")
features[,2] <- as.character(features[,2])
featuresNames <- features[,2]

#create 3 variables containing the test data
setwd("C:/Users/radae500/Desktop/Coursera/Getting and Cleaning Data/UCI HAR Dataset/test")
subject_test <- read.table("subject_test.txt")
features_test <- read.table("X_test.txt")
activities_test <- read.table("y_test.txt")

#create 3 variables containing the train data
setwd("C:/Users/radae500/Desktop/Coursera/Getting and Cleaning Data/UCI HAR Dataset/train")
subject_train <- read.table("subject_train.txt")
features_train <- read.table("X_train.txt")
activities_train <- read.table("y_train.txt")

#merge the train and test data together
subject <- rbind (subject_train, subject_test)
features <- rbind (features_train, features_test)
activities <- rbind (activities_train, activities_test)

#assign names to each of the variables
names(subject) <- "Subject"
names(activities) <- "Activity"
names(features) <- featuresNames

#create dataframe with total data
data <- cbind(features, subject, activities)

#subset the data file for variables containing "mean" or "std"
featuresWanted <- featuresNames[grep("(mean)|(std)", featuresNames)]
colnames <- c(featuresWanted, "Subject", "Activity")
data <- subset(data, select=colnames)

#clean up the variable names
names(data)<-gsub("^t", "Time", names(data))
names(data)<-gsub("^f", "Freq", names(data))
names(data)<-gsub("Acc", "Accelerometer", names(data))
names(data)<-gsub("Gyro", "Gyroscope", names(data))
names(data)<-gsub("Mag", "Magnitude", names(data))
names(data)<-gsub("BodyBody", "Body", names(data))
names(data)<- gsub('[-()]', '', names(data))
names(data)<- gsub('mean', 'Mean', names(data))
names(data)<- gsub('std', 'Std', names(data))

#assign the activity labels to the facotry contained in the "activity" varibale in data
data$Activity<- activity_labels[data$Activity]

#create a second indipendent tidy dataset aggregating data by subject and activity
data2<-aggregate(. ~Subject + Activity, data, mean)
data2 <- data2[order(data2$Subject, data2$Activity),]

#print out the new dataset to "tidydata.txt"
write.table(data2, "tidydata.txt", row.name=FALSE)
