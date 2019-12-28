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

Information about the summary choices you made

    Step 2:       Mean and Standard deviation for each measurement in dataMerged are calculated.
    Step 5:       A new tidy dataset is calculated for sumarize the original dataset (dataMerged).
                  This new dataset includes the mean of each variable for each activity and each subject.
