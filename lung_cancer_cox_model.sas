/******************************************************
 * Lung Cancer Cox Proportional Hazards Model
 * Project Data Sphere Clinical Trial Data
 * 
 * Author: Sohel Ahmed
 * 
 * Description:
 * This script performs a Cox proportional hazards 
 * regression analysis to assess the effect of 
 * covariates on survival time.
 ******************************************************/

/* Step 1: Define Library */
libname mydata '/home/yourusername/lung_cancer_project/data';

/* Step 2: Load Prepared Data */
data analysis_data;
    set mydata.analysis_data_cleaned; /* Assume the cleaned dataset is saved */
run;

/* Step 3: Cox Proportional Hazards Model */
proc phreg data=analysis_data;
    class sex_label(ref='Male') treatment(ref='Control') / param=ref;
    model event_time*status(0) = age sex_label treatment;
    
    /* Estimate hazard ratios */
    hazardratio sex_label / diff=ref at(age=mean);
    hazardratio treatment / diff=ref;
    
    /* Output parameter estimates */
    ods output ParameterEstimates=cox_parameters;
    title "Cox Proportional Hazards Model for Lung Cancer Survival";
run;

/* Step 4: Save Results */
proc export data=cox_parameters
    outfile="/home/yourusername/lung_cancer_project/results/cox_model_summary.csv"
    dbms=csv replace;
run;

/* End of Script */
