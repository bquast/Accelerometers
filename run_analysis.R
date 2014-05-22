# R script for merging accelerometer data
# for the course 'Getting and Cleaning Data' (Coursera)
# for more information see README.md and CodeBook.md
#
# Bastiaan Quast
# bquast@gmail.com

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


# subset based on variable names
final <- subset(imported, 
                select = grep(
                  "activity|type|mean|std",
                  ls(imported)
                  )
                )
rm(imported)

# inspect the results
str(final)
head(final)
View(final)
ls(final)

# save the final dataset
save(final, file = 'final.RData')

# create a data frame with the means
# the first two rows contain string and are skipped
means <- as.vector(sapply(final[3:length(final)], mean ))
names <- names(final)[3:length(final)]
means <- as.data.frame(cbind(names, means))
rm(names)
names(means) <- c('variable', 'mean')
rm(final)

# inspect the result
str(means)
head(means)
View(means)

# save the result
save(means, file = 'means.Rdata' )

# export the result
write.table(means, file = 'means.txt', sep = '\t', row.names=FALSE)