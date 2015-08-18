---
title: "Human Activity Recognition Using Smartphones Dataset, cleaning & reordering Data"
---

# STUDY DESIGN

Data Sets included in this repository are the result of reordering the Original Data Set downloaded from the following URL:

Original Data Set (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

The data from the previous URL represents data collected from the accelerometers from the Samsung Galaxy S smartphone. 
In particular the experiment has been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a 
smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration 
and 3-axial angular velocity at a constant rate of 50Hz were captured. The experiments have been video-recorded to label the data manually.  

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding 
windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, 
was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only 
low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained 
by calculating variables from the time and frequency domain. 


# Code Book: Variable Information.

For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 66-feature vector with time and frequency domain variables. 
- Its activity label ((WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)) 
- An identifier of the subject who carried out the experiment.

The features selected for this dataset come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. 
These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. 
Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. 
Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another 
low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). 
Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, 
tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, 
fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

*tBodyAcc-XYZ
*tGravityAcc-XYZ
*tBodyAccJerk-XYZ
*tBodyGyro-XYZ
*tBodyGyroJerk-XYZ
*tBodyAccMag
*tGravityAccMag
*tBodyAccJerkMag
*tBodyGyroMag
*tBodyGyroJerkMag
*fBodyAcc-XYZ
*fBodyAccJerk-XYZ
*fBodyGyro-XYZ
*fBodyAccMag
*fBodyAccJerkMag
*fBodyGyroMag
*fBodyGyroJerkMag

The set of variables that were estimated from these signals in the current dataser are: 

mean(): Mean value
std(): Standard deviation

They were extracted form the Original ones, I selected only the measurements on the mean and standard deviation for each measurement. 

The complete list of variables of each feature vector is:

1. "ID"
2. "Activity"
3. "tBodyAcc.mean...X"
4. "tBodyAcc.mean...Y"
5. "tBodyAcc.mean...Z"
6. "tGravityAcc.mean...X"
7. "tGravityAcc.mean...Y"
8. "tGravityAcc.mean...Z"
9. "tBodyAccJerk.mean...X"
10. "tBodyAccJerk.mean...Y"
11. "tBodyAccJerk.mean...Z"
12. "tBodyGyro.mean...X"
13. "tBodyGyro.mean...Y"
14. "tBodyGyro.mean...Z"
15. "tBodyGyroJerk.mean...X"
16. "tBodyGyroJerk.mean...Y"
17. "tBodyGyroJerk.mean...Z"
18. "tBodyAccMag.mean.."
19. "tGravityAccMag.mean.."
20. "tBodyAccJerkMag.mean.."
21. "tBodyGyroMag.mean.."
22. "tBodyGyroJerkMag.mean.."
23. "fBodyAcc.mean...X"
24. "fBodyAcc.mean...Y"
25. "fBodyAcc.mean...Z"
26. "fBodyAccJerk.mean...X"
27. "fBodyAccJerk.mean...Y"
28. "fBodyAccJerk.mean...Z"
29. "fBodyGyro.mean...X"
30. "fBodyGyro.mean...Y"
31. "fBodyGyro.mean...Z"
32. "fBodyAccMag.mean.."
33. "fBodyBodyAccJerkMag.mean.."
34. "fBodyBodyGyroMag.mean.."
35. "fBodyBodyGyroJerkMag.mean.."
36. "tBodyAcc.std...X"
37. "tBodyAcc.std...Y"
38. "tBodyAcc.std...Z"
39. "tGravityAcc.std...X"
40. "tGravityAcc.std...Y"
41. "tGravityAcc.std...Z"
42. "tBodyAccJerk.std...X"
43. "tBodyAccJerk.std...Y"
44. "tBodyAccJerk.std...Z"
45. "tBodyGyro.std...X"
46. "tBodyGyro.std...Y"
47. "tBodyGyro.std...Z"
48. "tBodyGyroJerk.std...X"
49. "tBodyGyroJerk.std...Y"
50. "tBodyGyroJerk.std...Z"
51. "tBodyAccMag.std.."
52. "tGravityAccMag.std.."
53. "tBodyAccJerkMag.std.."
54. "tBodyGyroMag.std.."
55. "tBodyGyroJerkMag.std.."
56. "fBodyAcc.std...X"
57. "fBodyAcc.std...Y"
58. "fBodyAcc.std...Z"
59. "fBodyAccJerk.std...X"
60. "fBodyAccJerk.std...Y"
61. "fBodyAccJerk.std...Z"
62. "fBodyGyro.std...X"
63. "fBodyGyro.std...Y"
64. "fBodyGyro.std...Z"
65. "fBodyAccMag.std.."
66. "fBodyBodyAccJerkMag.std.."
67. "fBodyBodyGyroMag.std.."
68. "fBodyBodyGyroJerkMag.std.."

# OUTPUT OF THE SCRIPT (run_analysis.R) 

The script "run_analysis.R" creates one Data Frame (dataset), one table (meanTable) and two txt files containing the data in the Data Frame and 
Table (dataset.txt and meanTable.txt).
The first Data Set (dataset) contains the mean and standard deviation for each measurement specified in "Variable Information" section.
The table (meanTable) contains information about the same variables but it is group by the the subject doing the experiment (subject ID form 1-30) 
and the activity. The vlaues asigned to these groups is the mean of the values of the original records in the group.

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

# RAW ORIGINAL DATA SET INFORMATION 
[Original Source] http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Source:

Jorge L. Reyes-Ortiz(1,2), Davide Anguita(1), Alessandro Ghio(1), Luca Oneto(1) and Xavier Parra(2)
1 - Smartlab - Non-Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova, Genoa (I-16145), Italy. 
2 - CETpD - Technical Research Centre for Dependency Care and Autonomous Living
Universitat Politècnica de Catalunya (BarcelonaTech). Vilanova i la Geltrú (08800), Spain
activityrecognition '@' smartlab.ws

Relevant Papers:

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012 

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra, Jorge L. Reyes-Ortiz. Energy Efficient Smartphone-Based Activity Recognition using Fixed-Point Arithmetic. Journal of Universal Computer Science. Special Issue in Ambient Assisted Living: Home Care. Volume 19, Issue 9. May 2013

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. 4th International Workshop of Ambient Assited Living, IWAAL 2012, Vitoria-Gasteiz, Spain, December 3-5, 2012. Proceedings. Lecture Notes in Computer Science 2012, pp 216-223. 

Jorge Luis Reyes-Ortiz, Alessandro Ghio, Xavier Parra-Llanas, Davide Anguita, Joan Cabestany, Andreu Català. Human Activity and Motion Disorder Recognition: Towards Smarter Interactive Cognitive Environments. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013
