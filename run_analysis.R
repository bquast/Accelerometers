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

