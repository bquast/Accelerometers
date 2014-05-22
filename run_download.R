# R script for downloading accelerometer data
# for the course 'Getting and Cleaning Data' (Coursera)
# for more information see README.md and CodeBook.md
#
# Bastiaan Quast
# bquast@gmail.com

# download the dataset

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