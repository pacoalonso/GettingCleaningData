Getting and Cleaning Data
=========================

Course project
--------------

Description of the run_analysis.R script
----------------------------------------

The script run_analysis.R has eleven steps, these steps are also indicated in the script file using comments (*#*):

1. Read data files (train and test) and merge both sets in a single object (__data__)
2. Read label files (train and test) and merge both sets in a single object (__label__)
3. Read subject files (train and test) and merge both sets in a single object (__subject__)
4. Descriptive activity names were extracted from the _activity\_labels.txt_ file and used to reclassify the __label__ object from activity codes into activity names 
5. The columns corresponding to means and standard deviations were located in the file _features.txt_. The column numbers were grouped in a vector used to select just such columns
6. The file _features.txt_ was also read to create feature names using nested __gsub__ calls to elliminate punctuation form the names
7. Interactions subjects-label were created with the __interaction__ function
8. Several steps were needed to create a two column __data.frame__ called __tidy__ that contains the activity in the first column and the subject in the second
9. A loop adds, for each feature, a column is added to __tidy__ containing the feature mean for each activity-subject combination 
10. The names of the columns are attached to __tidy__
11. Write the __tidy__ __data.frame__ to the file _tidyData.txt_


