/******************************************************
 * Lung Cancer Survival Analysis
 * Project Data Sphere Clinical Trial Data
 * 
 * Author: Sohel Ahmed

 * Description:
 * This script performs a basic survival analysis 
 * including Kaplan-Meier curves and Cox regression 
 * based on publicly available clinical trial data.
 ******************************************************/

/* Step 0: Define library */
libname mydata '/home/yourusername/lung_cancer_project/data';

/* Step 1: Import Data */
proc import datafile="/home/yourusername/lung_cancer_project/data/subjinfo.csv"
    out=subjinfo dbms=csv replace;
    getnames=yes;
run;

proc import datafile="/home/yourusername/lung_cancer_project/data/ttevent.csv"
    out=ttevent dbms=csv replace;
    getnames=yes;
run;

proc import datafile="/home/yourusername/lung_cancer_project/data/bor.csv"
    out=bor dbms=csv replace;
    getnames=yes;
run;

/* Additional datasets like events.csv, exsum.csv can be imported similarly */

/* Step 2: Clean & Prepare */
data analysis_data;
    merge subjinfo(in=a) ttevent(in=b) bor(in=c);
    by subjid;
    if a and b and c;
    
    /* Label Sex */
    if sex = 1 then sex_label = "Male";
    else if sex = 2 then sex_label = "Female";

    /* Calculate Event Status */
    if event_time > . then status = 1;
    else status = 0;
run;

/* Step 3: Kaplan-Meier Survival Analysis */
proc lifetest data=analysis_data plots=survival(atrisk=0 to 1000 by 250);
    time event_time*status(0);
    strata treatment;
    title "Kaplan-Meier Survival Curves by Treatment Arm";
run;

/* Step 4: Cox Proportional Hazards Model */
proc phreg data=analysis_data;
    class sex_label(ref='Male') treatment(ref='Control');
    model event_time*status(0) = age sex_label treatment;
    hazardratio treatment;
    hazardratio sex_label;
    title "Cox Proportional Hazards Model";
run;

/* Step 5: Adverse Events and Response Rate 
   [NOTE: Skipped for public version]
*/

/* End of Script */
