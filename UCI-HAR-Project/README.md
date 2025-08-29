# UCI-HAR-Project

This repository contains the final project for the **Getting and Cleaning Data** course offered by Johns Hopkins University on Coursera.  

The objective of this project is to demonstrate skills in collecting, cleaning, and preparing data for analysis. The outcome is a tidy dataset that can be used for subsequent analytical tasks.  

---

## Dataset  

The project uses data collected from the **accelerometers of the Samsung Galaxy S smartphone**.  
Specifically, it leverages the *Human Activity Recognition (HAR) dataset*, which includes recordings from **30 subjects** performing daily activities (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.  

📂 **Source**: [UCI Machine Learning Repository](http://archive.ics.uci.edu/dataset/240/human+activity+recognition+using+smartphones)

---

## Files in this repository  

- **`run_analysis.R`** → R script that downloads, cleans, and processes the dataset.  
- **`TidyData.txt`** → the final tidy dataset produced by the script.  
- **`CodeBook.md`** → documentation describing the dataset, variables, and transformation steps applied.  

---

## How to run  

1. Download and unzip the dataset into your working directory.  
   The folder must be named exactly **`UCI HAR Dataset`**.  
2. Open **RStudio** (or R console) and run the script.
3. After execution, the script will generate the file TidyData.txt in your working directory.
