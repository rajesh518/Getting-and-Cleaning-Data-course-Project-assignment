## creating the directory and Downloading the file using download.file##
if(!file.exists("./Assignment_gcd")){dir.create("./Assignment_gcd")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./Assignment_gcd/Dataset.zip")
##unzip the file##
unzip(zipfile="./Assignment_gcd/Dataset.zip",exdir="./Assignment_gcd")
# Reading trainings tables:
x.train.features <- read.table("./Assignment_gcd/UCI HAR Dataset/train/X_train.txt")
y.train.activity <- read.table("./Assignment_gcd/UCI HAR Dataset/train/y_train.txt")
subject.train <- read.table("./Assignment_gcd/UCI HAR Dataset/train/subject_train.txt")

# Reading testing tables:
x.test.features <- read.table("./Assignment_gcd/UCI HAR Dataset/test/X_test.txt")
y.test.activity <- read.table("./Assignment_gcd/UCI HAR Dataset/test/y_test.txt")
subject.test <- read.table("./Assignment_gcd/UCI HAR Dataset/test/subject_test.txt")

# Reading feature vector:
features <- read.table('./Assignment_gcd/UCI HAR Dataset/features.txt')

# Reading activity labels:
activityLabels = read.table('./Assignment_gcd/UCI HAR Dataset/activity_labels.txt')

##Assingning names to Columns(variables)##
colnames(x.train.features) <- features[,2] 
colnames(y.train.activity) <-"activityId"
colnames(subject.train) <- "subjectId"

colnames(x.test.features) <- features[,2] 
colnames(y.test.activity) <- "activityId"
colnames(subject.test) <- "subjectId"

colnames(activityLabels) <- c('activityId','activityType')

## Merging all data into one dataset##
  
  mergetraindata <- cbind(y.train.activity, subject.train, x.train.features)
mergetestdata <- cbind(y.test.activity, subject.test, x.test.features)
mergeddata <- rbind(mergetraindata, mergetestdata)

##Extracts only the measurements on the mean and standard deviation for each measurement##
colnames <- colnames(mergeddata)
idmeansd <- (grepl("activityId",colnames)|
               grepl("subjectId",colnames)|
               grepl("mean..",colnames)|
             grepl("std..",colnames))##create vector for mean,sd##

extmeansd <- mergeddata[ , idmeansd == TRUE]##final subseting with idmeansd and mergeddata##
##Uses descriptive activity names to name the activities in the data set##
WithActivityNames <- merge(extmeansd, activityLabels,
                              by='activityId',
                              all.x=TRUE)
## creates a second, independent tidy data set with the average of each variable for each activity and each subject.##

tidySet2 <- aggregate(. ~subjectId + activityId, WithActivityNames, mean)
tidySet2 <- tidySet2[order(tidySet2$subjectId, tidySet2$activityId),]
##writing second tidy data set using write.table##
write.table(tidySet2, "tidySet2.txt", row.name=FALSE)
