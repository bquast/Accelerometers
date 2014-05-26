# R script for merging accelerometer data
# for the course 'Getting and Cleaning Data' (Coursera)
# for more information see README.md and CodeBook.md
#
# Bastiaan Quast
# bquast@gmail.com

## Step 1
# read the data
features <- read.table('UCI HAR Dataset/features.txt')
features <- t(features[2])
features <- tolower(features)
features <- gsub("-", "", features)
features <- gsub(",", "", features)
features <- gsub("\\(", "", features)
features <- gsub("\\)", "", features)
y_train <- read.table('UCI HAR Dataset/train/y_train.txt')
y_test <- read.table('UCI HAR Dataset/test/y_test.txt')
X_train <- read.table('UCI HAR Dataset/train/X_train.txt')
X_test <- read.table('UCI HAR Dataset/test/X_test.txt')


## Step 2
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

## Step 3
# add activity variable type with value train
type <- 'train'
names(type) <- 'type'

## Step 4
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


## Step 5
# save the workspace
save(imported, file = 'imported.RData')

## Step 6
# subset based on variable names
final <- subset(imported, 
                select = grep(
                  "mean|std",
                  ls(imported)
                  )
                )
rm(imported)
final <- subset(final, select = (!names(final) == 'activity') )

## Step 7
# save the final dataset
save(final, file = 'final.RData')


## Step 8
# create a data frame with the means
# the first two rows contain string and are skipped
means <- as.vector(sapply(final, mean ))
names <- names(final)
means <- as.data.frame(cbind(names, means))
rm(names)
names(means) <- c('variable', 'mean')
rm(final)


## Step 9
# save the result
save(means, file = 'means.Rdata' )

## Step 10
# export the result
write.table(means, file = 'means.txt', sep = '\t', row.names=FALSE)
