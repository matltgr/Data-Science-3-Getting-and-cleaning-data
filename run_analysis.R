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