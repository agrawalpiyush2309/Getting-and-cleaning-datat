CodeBook for UCI HAR Dataset
=================================

## What is it?

This CodeBook describes the data contained in the output of the `run_analysis.R` script contained in this repository. 

```R
tidy_data <- data.table("tidy_data.txt")
```

The script creates a tidy, condensed version of the University of California Irvine's (UCI's) dataset for Human Activity Recognition (HAR) using smartphones that can be used for further research and analysis. The original UCI HAR Dataset is a public domain dataset built from the recordings of subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensor (see http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

As noted in the above referenced document, the original data comes from experiments that were carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (walking, walking_upstairs, walking_downstairs, sitting, standing, and laying) wearing a Samsung Galaxy S II smartphone on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity were captured at a constant rate of 50Hz. The experiments were video-recorded to label the data manually.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force was assumed to have only low frequency components, so a filter with a 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

The script generates a combined subset of the original data by extracting the mean and standard deviation 57 features (out of the 561 available features from the original feature vector). This combined subset contains 10299 observations of 57 variables, with activity and subject appended to the 57 features.

The combined subset is further reduced by calculating the mean of the observations by activity and subject pair to generate 10260 observations (6 activities * 30 subjects) of the same 57 variables. Output is saved in `tidy_data.txt`

## cleanup

Transformations

```R
features[,"Features"]<-str_replace(features[,"Features"], "^t", "TimeOf")
features[,"Features"]<-str_replace(features[,"Features"], "^f", "FrequencyOf")
features[,"Features"]<-str_replace(features[,"Features"], "BodyBody", "Body")
features[,"Features"]<-str_replace(features[,"Features"], "\\(\\)", "")
features[,"Features"]<-str_replace(features[,"Features"], "\\(", "")
features[,"Features"]<-str_replace(features[,"Features"], "\\)", "")
features[,"Features"]<-str_replace(features[,"Features"], "\\-", "")
features[,"Features"]<-str_replace(features[,"Features"], "Acc", "acceleration")
features[,"Features"]<-str_replace(features[,"Features"], "Mag", "Magnitude")
```

And finally all variable names are converted into lowercase.

## Description of the UCI HAR variables

The Tidy dataset consists of 10260 observations summarized by activity (6 categories) and subject (30 volunteers) pairs. For each observation (row) in the Tidy dataset, the following 4 columns are provided:

- subject
- activity
- Features
- Reading

### subject

A numeric identifier (1-30) of the subject who carried out the experiment.

### activity

The activity name with the following possible values.
- 'laying',
- 'sitting',
- 'standing',
- 'walking',
- 'walking_downstairs'
- 'walking_upstairs'

### measurement

feature names

-TimeOfBodyaccelerationmean-X
-TimeOfBodyaccelerationmean-Y
-TimeOfBodyaccelerationmean-Z
-TimeOfBodyaccelerationstd-X
-TimeOfBodyaccelerationstd-Y
-TimeOfBodyaccelerationstd-Z
-TimeOfGravityaccelerationmean-X
-TimeOfGravityaccelerationmean-Y
-TimeOfGravityaccelerationmean-Z
-TimeOfGravityaccelerationstd-X
-TimeOfGravityaccelerationstd-Y
-TimeOfGravityaccelerationstd-Z
-TimeOfBodyaccelerationJerkmean-X
-TimeOfBodyaccelerationJerkmean-Y
-TimeOfBodyaccelerationJerkmean-Z
-TimeOfBodyaccelerationJerkstd-X
-TimeOfBodyaccelerationJerkstd-Y
-TimeOfBodyaccelerationJerkstd-Z
-TimeOfBodyGyromean-X
-TimeOfBodyGyromean-Y
-TimeOfBodyGyromean-Z
-TimeOfBodyGyrostd-X
-TimeOfBodyGyrostd-Y
-TimeOfBodyGyrostd-Z
-TimeOfBodyGyroJerkmean-X
-TimeOfBodyGyroJerkmean-Y
-TimeOfBodyGyroJerkmean-Z
-TimeOfBodyGyroJerkstd-X
-TimeOfBodyGyroJerkstd-Y
-TimeOfBodyGyroJerkstd-Z
-TimeOfBodyaccelerationMagnitudestd
-TimeOfGravityaccelerationMagnitudestd
-TimeOfBodyaccelerationJerkMagnitudestd
-TimeOfBodyGyroMagnitudestd
-TimeOfBodyGyroJerkMagnitudestd
-FrequencyOfBodyaccelerationmean-X
-FrequencyOfBodyaccelerationmean-Y
-FrequencyOfBodyaccelerationmean-Z
-FrequencyOfBodyaccelerationstd-X
-FrequencyOfBodyaccelerationstd-Y
-FrequencyOfBodyaccelerationstd-Z
-FrequencyOfBodyaccelerationJerkmean-X
-FrequencyOfBodyaccelerationJerkmean-Y
-FrequencyOfBodyaccelerationJerkmean-Z
-FrequencyOfBodyaccelerationJerkstd-X
-FrequencyOfBodyaccelerationJerkstd-Y
-FrequencyOfBodyaccelerationJerkstd-Z
-FrequencyOfBodyGyromean-X
-FrequencyOfBodyGyromean-Y
-FrequencyOfBodyGyromean-Z
-FrequencyOfBodyGyrostd-X
-FrequencyOfBodyGyrostd-Y
-FrequencyOfBodyGyrostd-Z
-FrequencyOfBodyaccelerationMagnitudestd
-FrequencyOfBodyaccelerationJerkMagnitudestd
-FrequencyOfBodyGyroMagnitudestd
-FrequencyOfBodyGyroJerkMagnitudestd


### Reading

The mean of the Features.
