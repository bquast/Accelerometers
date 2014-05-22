# R script for merging accelerometer data
# for the course 'Getting and Cleaning Data' (Coursera)
# for more information see README.md and CodeBook.md
#
# Bastiaan Quast
# bquast@gmail.com

## download the dataset
# assign the file url
file.url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
# assign the destination file
file.dest <- 'accelerometer.zip'
# execute the download
# WARNING: this is a 61MB file, it will take time
# DO NOT terminate the program if it is not responsive
download.file(file.url, file.dest, method='auto')
# NOTE: because of the size, this file is ignored by Git

# cleanup
rm(file.url)
rm(file.dest)

### UNZIP the file manually ###
# make sure the contents of the zip file
# are places in the working directory
# the working directory is currently
getwd()

# read the data
features <- read.table('UCI HAR Dataset/features.txt')
features <- t(features[2])
y_train <- read.table('UCI HAR Dataset/train/y_train.txt')
y_test <- read.table('UCI HAR Dataset/test/y_test.txt')
X_train <- read.table('UCI HAR Dataset/train/X_train.txt')
X_test <- read.table('UCI HAR Dataset/test/X_test.txt')

# label the variables and observations
labs <- c('walking', 'walking_upstairs', 'walking_downstairs', 'sitting', 'standing', 'laying')
y_train <- as.data.frame(factor(y_train$V1, levels=c(1,2,3,4,5,6), labels=labs) )
y_test <- as.data.frame(factor(y_test$V1, levels=c(1,2,3,4,5,6), labels=labs) )
rm(labs)
names(y_train) <- 'activity'
names(y_test) <- 'activity'
names(X_train) <- features
names(X_test) <- features
rm(features)

# add activity variable type with value train
type <- 'train'
names(type) <- 'type'

# merge the train dataframe
train <- as.data.frame( c(type, y_train, X_train) )
rm(y_train)
rm(X_train)

# add activity variable type with value test
type <- 'test'
names(type) <- 'type'

# merge the test dataframe
test <- as.data.frame( c(type, y_test, X_test) )
rm(y_test)
rm(X_test)
rm(type)

# merge the train and test data frames
imported <- rbind(train, test)
rm(train)
rm(test)

# inspect the result
str(imported)
head(imported)
View(imported)

# save the workspace
save(imported, file = 'imported.RData')