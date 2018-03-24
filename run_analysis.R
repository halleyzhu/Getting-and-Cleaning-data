##load data from wd to R
features <- read.csv('./UCI HAR Dataset/features.txt', header = FALSE, sep = ' ')
features <- as.character(features[,2])

trainX<- read.table('./UCI HAR Dataset/train/X_train.txt')
trainActivity <- read.csv('./UCI HAR Dataset/train/y_train.txt', header = FALSE, sep = ' ')
trainSubject <- read.csv('./UCI HAR Dataset/train/subject_train.txt',header = FALSE, sep = ' ')

train <-  data.frame( trainSubject,trainActivity, trainX)
names(train) <- c(c('subject', 'activity'), features)

testX<- read.table('./UCI HAR Dataset/test/X_test.txt')
testActivity <- read.csv('./UCI HAR Dataset/test/y_test.txt', header = FALSE, sep = ' ')
testSubject <- read.csv('./UCI HAR Dataset/test/subject_test.txt', header = FALSE, sep = ' ')

test <-  data.frame(testSubject, testActivity, testX )
names(test) <- c(c('subject', 'activity'), features)

##1. Merges the training and the test sets to create one data set.
all <- rbind(train, test)
str(all)

##2. Extracts only the measurements on the mean and standard deviation for each measurement.
meanStdDt <- all[,c(1,2,grep('mean|std', features) + 2)]
str(meanStdDt)

##3. Uses descriptive activity names to name the activities in the data set
activityNames <- as.character( read.table('./UCI HAR Dataset/activity_labels.txt', header = FALSE)[,2]) 
meanStdDt$activity <- activityNames[meanStdDt$activity]

##4. Appropriately labels the data set with descriptive variable names.
newName <- names(meanStdDt)
newName <- gsub("[(][)]", "", newName)
newName <- gsub("^t", "TimeDomain_", newName)
newName <- gsub("^f", "FrequencyDomain_", newName)
newName <- gsub("Acc", "Accelerometer", newName)
newName <- gsub("Gyro", "Gyroscope", newName)
newName <- gsub("Mag", "Magnitude", newName)
newName <- gsub("-mean-", "_Mean_", newName)
newName <- gsub("-std-", "_StandardDeviation_", newName)
newName <- gsub("-", "_", newName)
names(meanStdDt) <- newName

##5. creates a second tidy data set with the average of each variable for each activity and each subject.
tidyDt <- aggregate(meanStdDt[,3:81], by = list(activity = meanStdDt$activity, subject = meanStdDt$subject),FUN = mean)
head(tidyDt)

write.table(x = tidyDt, file = "tidy_data.txt", row.names = FALSE)
