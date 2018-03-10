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
'Research Question: What kinds of the structure of population and how many graduated have the two races?'
;

title2
'Rationale: This would help inform whcih race need more help in education and which race is the largest group.'
;

footnote1
'It shows that Hispanic is the largest graduated group and PAC_ISLD is the lowest graduated group.'
;

footnote2
'The two races graduated only have 10999, which means the diversity of student are not enough in same school.'
;

footnote3
'However, assuming there are no data issues underlying this analysis.'
;

*
Note: This compares the column each ethnicities and the sum.

Methodology: Use proc means to compute summaries of ethnicities.

Limitations: Even though predictive modeling is specified in the research
questions, this methodology solely relies on a crude descriptive technique
by looking at correlations along quartile values, furtherore, this result 
may not represent the real situation and can't imply that Hispanic 
has more advantage than others races.

Followup Steps: A possible follow-up to this approach could need others source
to help to support the prediction.
;

proc means data=Eth_grad_1516 sum;
  var HISPANIC AM_IND ASIAN PAC_ISLD FILIPINO AFRICAN_AM WHITE TWO_MORE_RACES TOTAL;
run;

run;
title;
footnote; 


*******************************************************************************;
* Research Question Analysis Starting Point;
*******************************************************************************;

title1
'Research Question: Which are the top three ethnics experienced the higheest dropouts rates?'
;

title2
'Rationale: It helps find out what are the top three ethnics experienced the higheest dropouts rates.'
;

footnote1
'Based on the result and analytics, Not reported, African American and American Indian are the top 3 highest dropouts rates.'
;

footnote2
'(Ethnic: 0 = Not reported, 
1 = American Indian or Alaska Native, 
2 = Asian, 
3 = Pacific Islander'
;

footnote4
'4 = Filipino, 
5 = Hispanic or Latino,
6 = African American, 
7 = White, 
9 = Two or More Races)'
;


*
Methodology:Used proc sql to create a table calculating enrollment 
and dropout number between the different ethnics. 

Limitations:This table does't prove the direct relatiohship between 
the different ethnics in enrollment and dropout number is positive or 
negative.

Possible Follow-up Steps: Dropout rates may not imply the everything, 
thus I am likey to know what the reasons contribute to the higher 
dropouts rate, and what should we do to improve the probelms.Moreover,
the ethnics maybe not the major problems to effect the dropout rates.
;

proc print data=Eth_Drop;
run; 

title;
footnote;


