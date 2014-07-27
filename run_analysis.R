## the purpose of this script is to create a tidy dataset 

getwd()

#### 1 Merges the training and the test sets to create one data set.

##Stop if the script is not at the root of the directories "test" and "train" exist
if (!file.exists("test/X_test.txt") | !file.exists("train/X_train.txt")) {
		stop ("Cannot find the files \"test/X_test.txt\" and \"train/X_train.txt\", this script need to be placed at the root of the \"test\" and \"train\" directories and")
	}

## read List of all features from 'features.txt'. these features are the column names for the data sets train/X_train.txt
featurenames <- read.table("features.txt")
## read activity name 'activity_labels.txt': Links the class labels with their activity name.
activitylabels <- read.table("activity_labels.txt")
names(activitylabels)[1] = "ActivityId"
names(activitylabels)[2] = "Activity"

### TRAINING specific dataset
message ("reading the training Dataset")
## read the training dataset file
trainingDF <- read.table("train/X_train.txt", col.names=featurenames[,2] )
## read the subjects from 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
trainingSubject <- read.table("train/subject_train.txt")
## read the activity from 'train/y_train.txt': Each row identifies the activity value performed for each window sample
trainingActivity <- read.table("train/y_train.txt")

message ("adding the Subjects and the activities")
# merge the activities for the training dataset 
trainingDF <- cbind(trainingActivity, trainingDF)
names(trainingDF)[1] = "ActivityId"
# merge the subject for the training dataset 
trainingDF <- cbind(trainingSubject, trainingDF)
names(trainingDF)[1] = "Subject"


### TEST  specific dataset
## read the training dataset file
message ("reading the test Dataset")
testDF <- read.table("test/X_test.txt", col.names=featurenames[,2] )
## read the subjects from 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
testSubject <- read.table("test/subject_test.txt")
## read the activity from 'test/y_test.txt': Each row identifies the activity value performed for each window sample
testActivity <- read.table("test/y_test.txt")

message ("adding the Subjects and the activities")
# merge the activities for the test dataset 
testDF <- cbind(testActivity, testDF)
names(testDF)[1] = "ActivityId"
# merge the subject for the test dataset 
testDF <- cbind(testSubject, testDF)
names(testDF)[1] = "Subject"

message ("merging the training and test Datasets")
## merge the rows of the datasets with rbind  
mergedDF = rbind(testDF, trainingDF)
trainingDF <- NULL # tidy up
testDF <- NULL # tidy up

## now we can merge the activities and activity labels without loosing the order
## the column "Activity" will now contain the activity label 
mergedDF = merge (mergedDF, activitylabels, by.x="ActivityId", by.y="ActivityId", all=TRUE)



### 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
## extracting the columns containing .mean., .std,  Subject and activity
message ("extracting the measurements on the mean and standard deviation")
tidyDF <- mergedDF[,c("Subject", "Activity",grep(".mean.|.std.", nm, value = TRUE))]
mergedDF <- NULL # tidy up


### 3. Uses descriptive activity names to name the activities in the data set
## that was done in a previous step

### 4. Appropriately labels the data set with descriptive variable names. 

### 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
message ("creating a second dataset with the average of each variable for each activity and each subject")
SecondTidyDF <- aggregate(. ~ Subject + Activity, data = tidyDF, FUN=mean)

## write the dataset in the same directory as the script
message ("writing the second dataset")
write.table(SecondTidyDF, file = "tidyData.txt", sep=" ", row.names = FALSE)
## the dataset can be read using tidyDF2 <- read.table("tidyData.txt", header=TRUE)

message ("Done")




