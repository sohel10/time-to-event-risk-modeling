# 🧬 Lung Cancer Survival Analysis Using Project Data Sphere Clinical Trial Data

## 📋 Overview
This project conducts a survival analysis using publicly available lung cancer clinical trial data from **Project Data Sphere**. The analysis includes:

- Data integration and cleaning
- Kaplan-Meier survival estimation stratified by treatment arms
- Log-rank tests for survival curve comparison
- Cox proportional hazards regression modeling based on age, sex, and treatment type

---

## ⚙️ Workflow

### Step 0: Define Library
Set up the SAS library to access the datasets stored in the working directory.

### Step 1: Import Data
The following datasets are used:
- `subjinfo`: Patient demographic and treatment assignment information
- `ttevent`: Time-to-event survival data
- `events`: Adverse events experienced by patients
- `bor`: Best overall tumor response evaluations
- `exsum`: Treatment exposure summary

### Step 2: Clean & Prepare
- Merge key datasets (`subjinfo`, `ttevent`, `bor`, `exsum`) by `SUBJID`
- Label `sex` variable (1 = Male, 2 = Female)
- Calculate survival times and censoring indicators

### Step 3: Survival Analysis
- Kaplan-Meier survival estimation stratified by treatment arms
- Log-rank test to compare survival distributions between treatments
- Summarize quartiles (25%, 50%, 75%) of survival times
- Plot survival curves

### Step 4: Cox Proportional Hazards Model
Model survival times with covariates:
- Age at enrollment (`AGEYR`)
- Sex
- Treatment arm

Estimate hazard ratios and 95% confidence intervals.

### Step 5: Adverse Events Summary
- Frequency of top 10 adverse events reported
- Frequency of adverse events stratified by severity grade

### Step 6: Response Rate Summary
- Calculate objective response rate (ORR) based on best response (`CR`, `PR`)

---

## 📚 Data Source
The clinical trial datasets are obtained from:

- [Project Data Sphere](https://www.projectdatasphere.org/)

> **Disclaimer**: The data used is publicly available, de-identified, and provided solely for research purposes.

---

## 📈 Example Outputs
- Kaplan-Meier survival curves stratified by treatment
- Median survival time and interquartile range
- Cox model hazard ratios for treatment effect
- Top 10 most common adverse events

---

## 💻 Technologies
- **SAS Studio 9.4**
- **Project Data Sphere** datasets
- **Survival analysis methods**: Kaplan-Meier, Cox Proportional Hazards
