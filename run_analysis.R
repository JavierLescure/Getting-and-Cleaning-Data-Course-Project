# Seed & libraries
set.seed(230963)
library(readxl)
library(XML)
library(methods)
library(data.table)
library(dplyr)

# Merge the training and the test sets to create one data set
dataTrain <- fread("UCI HAR Dataset/train/X_train.txt", sep=" ", data.table=F)
dataTest <- fread("UCI HAR Dataset/test/X_test.txt", sep=" ", data.table=F)
dataMerged <- rbind(dataTrain, dataTest)

# Extracts only the measurements on the mean and standard deviation for each measurement.
dataMean <- c()
dataSD <- c()
for(i in 1:ncol(dataMerged)) {
    dataMean[i] <- mean(dataMerged[, i], na.rm = T)
    dataSD[i] <- sd(dataMerged[, i], na.rm = T)
}

# Uses descriptive activity names to name the activities in the data set
dataTrain <- cbind(fread("UCI HAR Dataset/train/y_train.txt", sep=" ", data.table=F),
                   dataTrain)
dataTest <- cbind(fread("UCI HAR Dataset/test/y_test.txt", sep=" ", data.table=F),
                  dataTest)
dataMerged <- rbind(dataTrain, dataTest)
for(i in 1:nrow(dataMerged)) {
    if(dataMerged[i, 1] == 1){dataMerged[i, 1] <- "WALKING"}
    if(dataMerged[i, 1] == 2){dataMerged[i, 1] <- "WALKING_UPSTAIRS"}
    if(dataMerged[i, 1] == 3){dataMerged[i, 1] <- "WALKING_DOWNSTAIRS"}
    if(dataMerged[i, 1] == 4){dataMerged[i, 1] <- "SITTING"}
    if(dataMerged[i, 1] == 5){dataMerged[i, 1] <- "STANDING"}
    if(dataMerged[i, 1] == 6){dataMerged[i, 1] <- "LAYING"}
}

# Appropriately labels the data set with descriptive variable names.
varNamesRaw <- fread("UCI HAR Dataset/features.txt", sep=" ", data.table=F)
subjectID <- rbind(fread("UCI HAR Dataset/train/subject_train.txt", sep=" ", data.table=F), 
                  fread("UCI HAR Dataset/test/subject_test.txt", sep=" ", data.table=F))
dataMerged <- cbind(subjectID, dataMerged)
varNames <- c()
varNames[1] <- "subject"
varNames[2] <- "activity"
for(i in 3:(nrow(varNamesRaw) + 2)) {
    varNames[i] <- varNamesRaw[i - 2, 2]
}
varNames <- make.names(varNames, unique = T)
colnames(dataMerged) <- varNames

# Creates a second data set with the average of each variable for each activity and each subject
dataset2 <- matrix(nrow = 180, ncol = 563)
dataset2 <- as.data.frame(dataset2)
colnames(dataset2) <- varNames
for(i in 1:nrow(dataset2)) {
    for(j in 1:30){
        if(i/6 <= j){
            dataset2$subject[i] <- j
            #print(j)
            break
        }
    }
}
dataset2$activity <- c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING",
                       "STANDING", "LAYING")
for(i in 3:ncol(dataset2)) {
    for(j in 1:nrow(dataset2)) {
        dataFiltered <- filter(dataMerged, dataMerged$subject == dataset2[j, 1])
        dataFiltered <- filter(dataFiltered, dataFiltered$activity == dataset2[j, 2])
        dataset2[j, i] <- mean(dataFiltered[, i], na.rm = T)
    }
    print(i)
}


