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