# GettingAndCleaningDataProject
Project within the Coursera course of "Getting and Cleaning Data"

The script load both the train and test set, the list of features, the activity labels and the subjects for both train and test set and process all these files obtaining the output.
The activities labels are renamed and attached at the dataset. The same is done for the subject. This process is repeated for both train and test set.
The resulting two sets are merged considering all the variables, and renaming them using appropriate names.
In this way the tidy dataset is obtained.
Then using the melt function the final dataset is obtained and is written to the output.txt file.
All the processing is performed in script

In order to execute the analysis, just clone the repository in your local machine, download the project data and unzip it into the repository folder cloned. After this from R console type: source("your_path_to_run_analysis.R").