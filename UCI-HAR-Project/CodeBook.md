# CodeBook – UCI-HAR-Project

This CodeBook describes the variables, the data source, and the transformations carried out to clean and prepare the tidy dataset (`TidyData.txt`).  

---

## 📂 Source Data  

- **Dataset**: Human Activity Recognition Using Smartphones Dataset (Version 1.0)  
- **Collected by**: Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.  
- **Source**: [UCI Machine Learning Repository](http://archive.ics.uci.edu/dataset/240/human+activity+recognition+using+smartphones)  
- **Device**: Samsung Galaxy S II (waist-mounted)  
- **Signals**: Accelerometer and gyroscope, 3-axial linear acceleration and angular velocity, sampled at **50Hz**.  
- **Participants**: 30 volunteers, aged **19–48 years**.  
- **Activities**:  
  1. WALKING  
  2. WALKING_UPSTAIRS  
  3. WALKING_DOWNSTAIRS  
  4. SITTING  
  5. STANDING  
  6. LAYING  

The dataset was originally split into **70% training** and **30% test** sets.  

---

## 🔧 Data Processing Steps  

1. **Merged** the training and test datasets into a single dataset.  
2. **Extracted** only variables containing **mean** and **standard deviation** measurements.  
3. **Replaced** numeric activity codes with descriptive **activity names**.  
4. **Cleaned and standardized** variable names:  
   - Expanded abbreviations (e.g., `Acc` → `Accelerometer`, `Gyro` → `Gyroscope`)  
   - Corrected typos and applied consistent formatting.  
5. **Created** a tidy dataset with the **average of each variable** for each activity and each subject.  
6. **Exported** the final dataset as `TidyData.txt`.  

---

## 📑 Variables in `TidyData.txt`  

The tidy dataset contains **180 rows** and **89 variables**.  

- **Identifiers**:   
  - `Activity_Name`: Character, descriptive activity name (e.g., WALKING, SITTING).
  - `Activity_Code`: Integer, numeric code representing the activity (1–6).
  - `Subject`: Integer, identifies the participant (values: 1–30).  

- **Measurements**:  
  - All remaining variables are **averages of sensor signals** (accelerometer and gyroscope).  
  - Variables are labeled to indicate:  
    - **Domain**: Time (`Time`) or Frequency (`Frequency`)  
    - **Signal source**: Body or Gravity (`Body`, `Gravity`)  
    - **Instrument**: Accelerometer or Gyroscope  
    - **Statistic**: Mean or Standard Deviation  
    - **Axis**: X, Y, or Z (for directional signals)  

**Examples of variable names:**  
- `TimeBodyAccelerometer.mean...X` → Mean of time-domain body accelerometer signal along the X axis.  
- `TimeGravityAccelerometer.std...Z` → Standard deviation of time-domain gravity accelerometer signal along the Z axis.  
- `FrequencyBodyGyroscope.mean...Y` → Mean of frequency-domain body gyroscope signal along the Y axis.  

---

## 📊 Dimensions  

- **Rows**: 180 (30 subjects × 6 activities)  
- **Columns**: 89 (3 identifiers + 86 measurement variables)  

---

✅ This CodeBook ensures clarity and reproducibility of the data cleaning process and provides a full description of the variables included in the tidy dataset.  
