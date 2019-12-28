Information about the variables

    dataFiltered: Temp variable for store the filtered dataset. Used in step 5.
    dataMean:     Mean for each measurement. Calculated in step 2.
    dataMerged:   Dataset as result of merge data from train & test.
    dataSD:       Standard deviation for each measurement. Calculated in step 2.
    dataset2:     Final tidy dataset. Calculated in step 5.
    dataTest:     Raw half of the initial dataset.
    dataTrain:    Raw half of the initial dataset.
    subjectID:    Continous var for identify subjects.
    varNames:     Final names of the cols in dataMerged and dataset2.
    varNamesRaw:  Raw names of the cols in dataMerged and dataset2

Information about the summary choices I made

    Step 2:       Mean and Standard deviation for each measurement in dataMerged are calculated.
    Step 5:       A new tidy dataset is calculated for sumarize the original dataset (dataMerged).
                  This new dataset includes the mean of each variable for each activity and each subject.

Data transformation and steps
    
	Step 0:		Set the seed for random processes
			Load the required libraries
	Step 1:		Merge the training and the test sets to create one data set
			The new dataset is called dataMerged
	Step 2:		Extracts only the measurements on the mean and standard deviation for each measurement.
			They are stored in vars called dataMean and dataSD
	Step 3:		Uses descriptive activity names to name the activities in the data set
			First load the activities data from files.
			After, replace numeric (continous var) with explicit char vars.
	Step 4:		Appropriately labels the data set with descriptive variable names.
			First load the var names from file.
			Store the col names in a var called varNames.
			Finally use make-names for ensure they are valed col names adn assing then to the cols
	Step 5:		Creates a second data set with the average of each variable for each activity and each subject
			Be aware that it takes a lot of time in order to complete the process.
	
