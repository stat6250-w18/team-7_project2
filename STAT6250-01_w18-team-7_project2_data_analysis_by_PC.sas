*******************************************************************************;
**************** 80-character banner for column width reference ***************;
* (set window width to banner width to calibrate line length to 80 characters *;
*******************************************************************************;

*
This file uses the following analytic dataset to address several research
questions regarding college-preparation trends at CA public K-12 schools

Dataset Name: Eth_grad_1415_file created in external file
STAT6250-02_s17-team-7_project2_data_preparation.sas, which is assumed to be
in the same directory as this file

See included file for dataset properties
;

* environmental setup;

* set relative file import path to current directory (using standard SAS trick);
X "cd ""%substr(%sysget(SAS_EXECFILEPATH),1,%eval(%length(%sysget(SAS_EXECFILEPATH))-%length(%sysget(SAS_EXECFILENAME))))""";


* load external file;
%include '.\STAT6250-01_w18-team-7_project2_data_preparation.sas';


*******************************************************************************;
* Research Question Analysis Starting Point;
*******************************************************************************;

title1
'Research Question: What are the top five counties that experienced the remarkable reduced in "Total gradudte" between Eth_grad_1415 and Eth_grad_1516?'
;

title2
'Rationale: This should help identify counties, which may can accommodate more students based upon decreased total graduated numbers.'
;

footnote1
'Of the five counties with the greatest decreased in between Eth_grad_1415 and Eth_grad_1516 is -780, then second decrease in between Eth_grad_1415 and Eth_grad_1516 is -311.'
;

footnote2
'Given the magnitude of these changes, further investigation should be performed to ensure no data errors are involved.'
;

footnote3
'However, assuming there are no data issues underlying this analysis.'
;

*
Note: This compares the column "Total graduates" from Eth_grad_1415
to the column of the same name from Eth_grad_1516.

Methodology: When combining Eth_grad_1415 with Eth_grad_1516 during data 
preparation, take the difference of values of "Total graduates" for each
school and create a new variable called grad_change_2014_to_2015. Here,
use proc sort to create a temporary sorted table in descending by
grad_change_2014_to_2015. Finally, use proc print to display the first five
rows of the sorted dataset.

Limitations: This methodology does not account for counties with situation
such as the loaction, the people intensity, and whether the school is famous
or not.

Followup Steps: More carefully to do the research the location, whether can 
attractive more student go to study or not.
;

proc print data=GradChange(obs=5);
    var County SchoolNumber TotalGrad1415 Totalgrad1516 GradChange;

run;

title;
footnote;


*******************************************************************************;
* Research Question Analysis Starting Point;
*******************************************************************************;

title1
'Research Question: What are the three counties that experienced the biggest "SchoolNumber" and remarkable reduced in "Total gradudte" between Eth_grad_1415 and Eth_grad_1516?'
;

title2
'Rationale: This would help inform the counties, whihc would be likely need more fund or help to imporve the situation.'
;

footnote1
"Of the three counties with the remarkable reduced in "Total graduates", the SchoolNumbers in between Eth_grad_1415 and Eth_grad_1516 is 114, the second largest one is 100."
;

footnote2
"Given the magnitude of these changes, further investigation should be performed to ensure no data errors are involved."
;

footnote3
"However, assuming there are no data issues underlying this analysis."
;

*
Note: This compares the column "Total graduates" from Eth_grad_1415
to the column of the same name from Eth_grad_1516.

Methodology: When combining Eth_grad_1415 with Eth_grad_1516 during data 
preparation, take the difference of values of "Total graduates" for each
school and create a new variable called grad_change_2014_to_2015. Here,
use proc sort to create a temporary sorted table in descending by
grad_change_2014_to_2015. Finally, use proc print to display the first five
rows of the sorted dataset.

Limitations: Even though predictive modeling is specified in the research
questions, this methodology solely relies on the data, which the SchoolNumber
may can't explain eveything why they face the remarkable reduced in Total 
graduates. 

Followup Steps: A possible follow-up to this approach could need others source
to help to support the prediction.
;

proc print data=GradChange(obs=5);
    var County SchoolNumber TotalGrad1415 Totalgrad1516 GradChange;

run;

title;
footnote;


*******************************************************************************;
* Research Question Analysis Starting Point;
*******************************************************************************;

title1
'Research Question: Which are the two races experienced the largest enrollment and lowest dropout between 2015 and 2016?'
;

title2
'Rationale: It helps find out what are the two races experienced the largest and enrollment and the lowest dropout numbers in schools.'
;

footnote1
'Based on the result, Hispanic or Latino(5) has the highest enrollent and Pacific Islander(3) has the lowest dropout number.'
;

*
Methodology:Used proc sql to create a table calculating enrollment 
and dropout number for all the race. 

Limitations:This does not show what the relatiohship between the 
enrollment and dropout number.

Possible Follow-up Steps: I have to be focus on the dropout number 
more, rather than the enrollment. Because the dropout number would 
be the main issue, what we have to care on.
;

proc print data=Enr_race_sum(obs=9);
    var Enr_race_sum.ETHNIC,Enr_race_sum.ENR_Total,Drop_race_sum.Drop_Total;
    
run;

title;
footnote;


