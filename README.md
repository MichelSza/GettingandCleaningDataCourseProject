


# Getting and Cleaning Data Course Project

## The dataset includes the following files:
1. run_analysis.R - script to perform create the tidy dataset
2. CodeBook.md - description of the columns for the generated tidy dataset
3. README.md - this file


## Steps required before doing the analysis
the following steps help in downloading the source dataset, unzip it and place the analysis script in the correct directory.
1. download the dataset from [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
2. unzip the file getdata-projectfiles-UCI HAR Dataset.zip
	- unzip in the directory "getdata-projectfiles-UCI HAR Dataset"
	- you should then have a directory "getdata-projectfiles-UCI HAR Dataset" that contains another directory "UCI HAR Dataset"

### Running the script
1. place the file "run_analysis.R" in the directory "UCI HAR Dataset"
2. Execute R
3. change your working directory to the "UCI HAR Dataset"
	- you should use setwd ("<YOUR DIRECTORY>/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset")
	- note that on windows / should be replaced by //
4. run the script
	- source("run_analysis.R")
	- a txt file named "tidyData.txt" will be created in the directory
5. checking result
	- a file "tidyData.txt" has been created
	- the file must have 181 rows (including the header)
	- you can also load the tidy dataset using tidyDF2 <- read.table("tidyData.txt", header=TRUE)