For each record in the input dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject 

Output data set (tidy_data): 
- The training data set and test data set from the source data have been merged.
- Each row represents an activity of a subject who carried out the experiment, as identified by the columns activity and subject. 
    - Subject:The participant who carried out the experiment.                       
    - Activity: the activity name such as laying and sitting.
-  Average and standard deviation for each subject and activity is being measured on different features, as indicated by the columns of time and frequency domain.    
    - For variables starting with "TimeDomain_", it records time 
    - For variables starting with "FrequencyDomain_", it records frequency 

Please refer to the Readme.md document for further information. 

