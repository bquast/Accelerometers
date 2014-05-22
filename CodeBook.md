CodeBook
===================
Bastiaan Quast
-------------------
This file described how to replicate the results presented in this repository. The R code for the is all presented in the file [run_analysis.R](/run_analysis.R).

Data
-----------------
The file [run_analysis.R](/run_analysis.R) assumes that the content of the ZIP file has been extracted to the working directory.

In order to download the correct ZIP file, us the [run_download.R](/run_download.R) file. This will take some time and the program may become unresponsive.

After downloading the ZIP file, it needs to be manually unzipped, so that the contents of the ZIP file are placed in the working directory. DO NOT create a new folder to place the content of the ZIP file in, the R script will not be able to find the source files if you do.

After extracting the content of the ZIP file to the working directory, the [run_analysis.R](/run_analysis.R) script can be executed.

Transformations
------------------
In this section the transformation which are applied to the data are described. The steps below correspond to the steps in the [run_analysis.R](/run_analysis.R) file (preceded by a doubel hash '##').

1. Import the data from the text files
2. Rename the variables and observations
3. Add a variable 'type' classifying every observation as 'training' or 'test'
4. Merge the data frames
5. Save the complete merged data frame to imported.RData (excluded from Git because of its size)
6. Subset the data frame using regular expressions, the criteria is that the variable name contains: 'type', 'activity', 'mean' or 'std' (standard deviation)
7. Save the resulting data frame to [final.RData](/final.RData)
8. Calculate the mean for each variable and write this to a new data frame
9. Save the new data frame as [means.RData](/means.RData)
10. Export the data frame to a tab-delimited text file ([means.txt](/means.txt))