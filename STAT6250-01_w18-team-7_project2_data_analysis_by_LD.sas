*******************************************************************************;
**************** 80-character banner for column width reference ***************;
* (set window width to banner width to calibrate line length to 80 characters *;
*******************************************************************************;

*
This file uses the following analytic dataset to address several research
questions regarding gradutes,ethnicity, and dropouts at CA public schools

Dataset Name: GradChange and ETh_Drop created in external file
STAT6250-01_w18-team-7_project2_data_preparation.sas, which is assumed to be
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
'Research Queation: What are the top five school districts that experienced the most change in " Number Of Total Graduates" between 2014-2015 schoolyear and 2015-2016 schoolyear?'
;
title2
'Rationale: This will help state government to identify which school districts are experiencing most change in student population.'
;

footnote1
'Compared the totle number of students graduated,we can identify the school districts have the most change in student population.'
;
footnote2
'This analysis can help the California government make right decision on budget allocation.'
;

*
Note: This compares the column "Total" from Eth_grad_1415 to the column of the 
same name from Eth_grad_1516.

Methodology: When combining Eth_grad_1415 with Eth_grad_1516 during data preparation,
take the difference of values of "Total graduates" for each school and create 
a new variable called gradchange. 

Limitations: This methodology does not account for schools with missing data,
nor does it attempt to validate data in any way.

Followup Steps: More carefully clean values in order to filter out any possible
illegal values, and better handle missing data, e.g., by using a previous year's
data or a rolling average of previous years' data as a proxy.
; 

*combine Eth_grad_1415 and 1516 data vertically, and compute year-over-year
change in Total graduate;

proc print data=GradChange(obs=5);
    var County SchoolNumber TotalGrad1415 Totalgrad1516 GradChange;
run;

run;
title;
footnote;


*******************************************************************************;
* Research Question Analysis Starting Point;
*******************************************************************************;

title1
'Research Question: What is the populatipon of each in ethnic group that graduates?'
;
title2
'Rationale: This would help analyze status and trends in the education of ethnicity.'
;

footnote1
'Based on descriptive statistic for data set Eth_grad_1516, graduates in California were made up different ethnic groups.'
;

footnote2
'Hispanic is the highest population among graduates in California, followed by White, Asian, and Filipino.'
;

footnote3
'The population of graduates reflects CaLiforan is most ethnic diversity state.'
;

*
Note: The columns are county and every ethnicities.

Methodology: Use proc means to compute summaries of ethnicities.

Limitations: Even though predictive modeling is specified in the research
questions, this methodology solely relies on a crude descriptive technique
by looking at correlations along quartile values, which could be too coarse a
method to find actual association between the variables.

Followup Steps: A possible follow-up to this approach could use an inferential
statistical technique like linear regression.
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
'Research Question: Is the dropouts related to the students’ ethnic background?' 
;
title2
'Rationale: This would help policy makers and educators understand and solve this complex social and educational issue.'
;
footnote1
'Based on data analysis, data indicates certain ethnic groups have higher dropout rates.'
;
footnote2
'African American,American Indian,and Hispanic have higher dropout rates in California.'
;
footnote3
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
Note: This compares the column ethnic and dropout. 

Methodology: create new column for sum the number of dropouts and enrollment for data set
Race_dropout1516 in data preparation.

Limitations: This methodology does not account for schools with missing data,
nor does it attempt to validate data in any way, like filtering for values
outside of admissable values.

Followup Steps: More carefully clean the values of variables so that the
statistics computed do not include any possible illegal values.
;


proc print data=Eth_Drop;
run; 

run;
title;
footnote;
