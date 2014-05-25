

#The script assumes that the folder 'UCI HAR Dataset' is available in the current directory

# Merge the training and test measurements
xTrain <- read.fwf(".\\UCI HAR Dataset\\train\\X_train.txt", widths = rep(16,561))
xTest  <- read.fwf(".\\UCI HAR Dataset\\test\\X_test.txt", widths = rep(16,561))
xData  <- rbind(xTrain, xTest)


# Extract the features
features <- read.table(".\\UCI HAR Dataset\\features.txt",sep = " ",as.is = TRUE)
features <- features[,2]

# Assign column names
colnames(xData) <- features

# Merge the subject details and activities
subjectTrain    <- readLines(".\\UCI HAR Dataset\\train\\subject_train.txt")
subjectTest     <- readLines(".\\UCI HAR Dataset\\test\\subject_test.txt")
subjectData     <- c(subjectTrain, subjectTest)
activityTrain   <- readLines(".\\UCI HAR Dataset\\train\\y_train.txt")
activityTest    <- readLines(".\\UCI HAR Dataset\\test\\y_test.txt")
activityNumber  <- c(activityTrain, activityTest)


# Obj 1  - Merge all the data. No tidying yet. 
mergedData <- cbind(subjectData,activityNumber,xData, stringsAsFactors = FALSE)


# Obj 2 - Extract only the measurements on the mean & std deviation for each measurement.
stdCols  <- grep("std()", names(mergedData))
meanCols <- grep("mean()", names(mergedData))
dataSet1 <- mergedData[,c(meanCols,stdCols)]


# Obj 3 - Name activities in data set
activityNumber           <- as.data.frame(activityNumber,stringsAsFactors = FALSE)
colnames(activityNumber) <- "Number"
activityNumber$id        <- 1:nrow(activityNumber) # create an id to counteract sorting that happens while merging
# Use the descriptive activity labels given in activity_labels.txt and 
# .. match it with activity numbers in data set
activityLabels           <- read.fwf(".\\UCI HAR Dataset\\activity_labels.txt",c(2,18),
                                     col.names = c("Number","Activity"),as.is = TRUE)
activity                 <- merge(activityNumber,activityLabels)
activity                 <- activity[order(activity$id),c(1,3)]


# Obj 4 - Use descriptive activity names in data set
finalDataSet1              <- cbind(subjectData,activityNumber[,1],dataSet1,stringsAsFactors = FALSE)
finalDataSet1              <- finalDataSet1[order(as.numeric(finalDataSet1[,1]),
                                                 as.numeric(finalDataSet1[,2])),]
activityNumber1            <- finalDataSet1[,2]
activityNumber1            <- as.data.frame(activityNumber1,stringsAsFactors = FALSE)
colnames(activityNumber1)  <- "Number"
activityNumber1$id         <- 1:nrow(activityNumber1)
activity1                  <- merge(activityNumber1,activityLabels)
activity1                  <- activity1[order(activity1$id),c(1,3)]
finalDataSet1              <- cbind(finalDataSet1[,1],activity1[,2],finalDataSet1[3:81])
colnames(finalDataSet1)[1] <- "Subject"
colnames(finalDataSet1)[2] <- "Activity"
write.table(finalDataSet1,"finalDataSet1.txt")


# Obj 5 - Data set with average of each variable for each activity and each subject. 
if(!require(plyr))
{
  install.packages("plyr")
  require(plyr)
}
finalDataSet2             <- ddply(mergedData, c("subjectData","activityNumber"), numcolwise(mean))
names(finalDataSet2)      <- c("Subject","Activity",paste("Mean of", names(finalDataSet2)[3:479]))
# Order as per Subject number and then Activity
finalDataSet2             <- finalDataSet2[order(as.numeric(finalDataSet2$Subject),
                                                 as.numeric(finalDataSet2$Activity)),]
activityNumber2           <- finalDataSet2[,2]
activityNumber2           <- as.data.frame(activityNumber2,stringsAsFactors = FALSE)
colnames(activityNumber2) <- "Number"
activityNumber2$id        <- 1:nrow(activityNumber2)
activity2                 <- merge(activityNumber2,activityLabels)
activity2                 <- activity2[order(activity2$id),c(1,3)]
finalDataSet2             <- cbind(finalDataSet2[,1],activity2[,2],finalDataSet2[,3:479])
colnames(finalDataSet2)[1] <- "Subject"
colnames(finalDataSet2)[2] <- "Activity"
write.table(finalDataSet2,"finalDataSet2.txt")
















