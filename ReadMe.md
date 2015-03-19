 0. I remove the enviromental variables
 1. I create the ./ out library for the output
 2. I prepare the NAMES of the files that I have to read.
 3. I read files in tables.
 4. I define the 2 factors I consider, the subjectID and the activity_labels
 5. I rename the columns containing the subjects identification to 
    subjectID to label the appropriately this column.
 6. I rename appropriately the activity. This will contain the 6 activity names.
 7. I appropriately label all columns from the test and train dataset
    using the features defined by the authors, containing in the features.txt
 8. I add two columns to the beginning of the test and train data, the subjectID and the activity.
 9. Next step is to MERGE the test and the train data in x table.
10. After merging I Delete the tables that became unnecessary from the Global environment for Memory Safe
11. I select the columns that contains mean and standard deviation values from the x table to xNew table.
12. Using descriptive activity names in the dataset, WALKING,...LAYING in the 2nd column, activity.
13. I also delete unnecessary tables.
14. In this moment I reach step 4 of the instructions.
15. I average the data_set grouping by the subject and activity and I have my tidy dataset.
16. I save the tidy dataset and the previous dataset for further investigations, donloading and uploadings







 