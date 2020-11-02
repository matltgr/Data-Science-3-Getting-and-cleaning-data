## Step 0: load data
if(length(list.dirs("./Original Data")) == 0){
  message("Data not found, please wait for retrieval.")
  dir.create("./Original Data")
  download.file(url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "./Original Data/OriginalData.zip", method = "curl")
  unzip(zipfile = "./Original Data/OriginalData.zip", exdir = "./Original Data")
}
message("Data loaded successfully!")

## Step 1: Merge the training and the test sets to create one data set.
message("Step 1: merging")

train_x_data <- read.table("./Original Data/UCI HAR Dataset/train/X_train.txt")
train_y_data <- read.table("./Original Data/UCI HAR Dataset/train/Y_train.txt")
train_sbj_data <- read.table("./Original Data/UCI HAR Dataset/train/subject_train.txt")

test_x_data <- read.table("./Original Data/UCI HAR Dataset/test/X_test.txt")
test_y_data <- read.table("./Original Data/UCI HAR Dataset/test/Y_test.txt")
test_sbj_data <- read.table("./Original Data/UCI HAR Dataset/test/subject_test.txt")

merged_x_data <- rbind(train_x_data, test_x_data)
merged_y_data <- rbind(train_y_data, test_y_data)
merged_sbj_data <- rbind(train_sbj_data, test_sbj_data)

message("Merging complete")

## Step 2: Extracts only the measurements on the mean and standard deviation for each measurement. 
message("Step 2: Statistics Extraction")

features <- read.table("./Original Data/UCI HAR Dataset/features.txt") 
colFilter <- grep("-(std|mean)\\(\\)", features[, 2])
subfeatures <- features[colFilter,]
stats_x_data <- merged_x_data[, colFilter]

message("Statistics extraction complete.")

## Step 3: Use descriptive activity names to name the activities in the data set
message("Adding Activity names and generating final dataset")

activities <- read.table("./Original Data/UCI HAR Dataset/activity_labels.txt")
y_names <- left_join(merged_y_data, activities)
final_set <- cbind(merged_sbj_data, y_names[, 2], stats_x_data)

message("Done.")

## Step 4: Appropriately label the data set with descriptive variable names. 
names_col <- subfeatures[, 2]
names(final_set) <- c("Subject", "Activity", names_col)
message("Labelling complete.")

## Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
message("Generating tidy (aggregated) set")

agg_set <- aggregate( . ~ Subject + Activity, data = final_set, FUN = mean )
write.table(agg_set, "tidy_set.txt", row.names = FALSE )

message("File has been successfully generated in your working directory!")
