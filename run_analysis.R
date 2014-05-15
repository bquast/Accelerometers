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
download.file(file.url, file.dest)
# NOTE: because of the size, this file is ignored by Git

# cleanup
rm(file.url)
rm(file.dest)

# UNZIP the file manually

# read the data
features <- read.table('UCI HAR Dataset/features.txt')
features <- t(features[2])
y_train <- read.table('UCI HAR Dataset/train/y_train.txt')
y_test <- read.table('UCI HAR Dataset/test/y_test.txt')
labs <- c('walking', 'walking_upstairs', 'walking_downstairs', 'sitting', 'standing', 'laying')
y_train <- as.data.frame(factor(y_train$V1, levels=c(1,2,3,4,5,6), labels=labs) )
y_test <- as.data.frame(factor(y_test$V1, levels=c(1,2,3,4,5,6), labels=labs) )
train <- read.table('UCI HAR Dataset/train/X_train.txt')
test <- read.table('UCI HAR Dataset/test/X_test.txt')
# add activity variable
train <- as.data.frame( c(y_train, train) )
test <- as.data.frame( c(y_test, test) )

# remove temporary variables
rm(features)
rm(labs)
rm(y_train)
rm(y_test)

# save the workspace
save.image('import.RData')
