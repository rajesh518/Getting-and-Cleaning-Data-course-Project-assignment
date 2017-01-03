# Getting-and-Cleaning-Data-course-Project-assignment
Course work 

Introduction:This repository contains my course work for "Getting and Cleaning data" in Data Science Course track.

Synopsis:

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


The data we had is raw data and is collected  from the accelerometers from the Samsung Galaxy S smartphone.The result of this raw data should be tidy data set containig of both test and training sets with good labeled columns explaining features .the features of x.test.txt are unlabeled and activity labels too.



Process of steps:

I created a script called run_analysis.R ,first we need to download the dataset(zip) using download.file,we need to read the files using read.table() into R...we need to change the variable for  features of test and training datasets( change the variables of the columns as required for tidy data set) ...after that I had done merging..

After merging testing and training, labels are added and only columns that have to do with mean and standard deviation are kept.

At the end,  created a tidy data set containing the means and std of all the columns per test subject and per activity. This tidy dataset should be written using write.table().attached in repository for reference and the CodeBook.txt file explains the files created to get the tidy data set and process of work.
