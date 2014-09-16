GCData
======

Projection of Getting and Cleaning Data

The R script is built for projecton of Getting and Cleaning Data class.

The script can reunite all the required data sets into one complete set.
And, the finnal data set includes only the measurements on the mean and standard deviation for each measurement.
At the last, the data set was aggreated by subject and activity with `mean()` function.

**Note**: All data sets should be unziped in same folder.


##Codebook:
  If you have read a pic descripting the structure of data sets. you definitely have a sense about how to organize them.
  
  The very first thing is to read all required data sets into memory with argument `as.is = T`.
  
  My strategy is to bind the sets of saem type by row through function `rbind()`, and then bind the aboving sets by columns through function `cbind()`. 
  
  Feature names was read and added upon data set as variable names, in other words, colnames. 
  By the help of activity_label set, covert activity variable into factor variable.
  
  Extraction of specific variables is very simple by employing `grep()` function on colnames.
  
  At the last, `aggregate()` function could be introduced to aggreate variables for each variable for each activity and each subject.
