# ProgrammingAssignement3

This repository is my submission for the coursera project linked to the "Getting and Cleaning Data" course

# Structure

This repository contains the following files:

- `CodeBook.md` which explains the variables used in the tidy set
- `tidy_set.txt`, the tidy set which contains the aggregated results of the initial dataset
- `run_analysis.R` which creates `tidy_set.txt`

# `run_analysis.R` functionning

Here are the main steps of the `run_analysis.R` script:

0. The script loads the data from the online portal
1. It merges the data from both training and test sets
2. It extracts the variables which correspond to means or standard deviation measurements (`-mean()` and `-std()` fields)
3. It adds the activity names and subject ids to the former set
4. It modifies the column names in the set
5. It performs the aggregation of the former set and creates `tidy_set.txt`

# Data Source

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013. 
