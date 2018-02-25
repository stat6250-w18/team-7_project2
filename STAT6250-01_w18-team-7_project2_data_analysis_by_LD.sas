*******************************************************************************;
**************** 80-character banner for column width reference ***************;
* (set window width to banner width to calibrate line length to 80 characters *;
*******************************************************************************;

*
This file uses the following analytic dataset to address several research
questions regarding gradutes,ethnicity, and dropouts at CA public schools

* environmental setup;

* set relative file import path to current directory (using standard SAS trick);
X "cd ""%substr(%sysget(SAS_EXECFILEPATH),1,%eval(%length(%sysget(SAS_EXECFILEPATH))-%length(%sysget(SAS_EXECFILENAME))))""";


* load external file 
%include '.\STAT6250-01_w18-team-7_project2_data_preparation.sas';


*******************************************************************************;
* Research Question Analysis Starting Point;
*******************************************************************************;

title1
'Research Queation: What are the top five districts that experienced the biggest increase in "Total graduates" between Eth_grad_1415 and Eth_grad_1516?'
;

title2
'Rationale: This should help identify school districts to consider for increasing education fund in these districts.'
;

footnote1
'compared the totle number of Graduate in year 14-15 and year 15-16,We can find
the biggest change of graduates from year 14-15 to 15-16.'
;

footnote2
'This change can help the california government make right decision on education.'
;


*

Note: This compares the column "Total" from Eth_grad_1415 to the column of the 
same name from Eth_grad_1516.


Methodology: When combining Eth_grad_1415 with Eth_grad_1516 during data preparation,
take the difference of values of "Total graduates" for each school and
create a new variable called grad_change_2014_to_2015. Then,
use proc sort to create a temporary sorted table in descending by
grad_change_2014_to_2015. Finally, use proc print here to display the
first ten rows of the sorted dataset.


Limitations: This methodology does not account for schools with missing data,
nor does it attempt to validate data in any way.


Followup Steps: More carefully clean values in order to filter out any possible
illegal values, and better handle missing data, e.g., by using a previous year's
data or a rolling average of previous years' data as a proxy.
; 

proc print

        data=Eth_grad_1415_1516(obs=10)
    ;
    id
        county
    ;
    var
        mean sum     
    ;

run;
title;
footnote;



*******************************************************************************;

* Research Question Analysis Starting Point;

*******************************************************************************;

title1
'Research Question: What is the percentage of ethnicity in graduates?'
;

title2
'Rationale: This would help analyze status and trends in the education of ethnicity.'
;

footnote1
'Based on descriptive statistic for data set Eth_grad_1516, the percentage of ethnicity in 
graduates is different in each county.
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

proc means data=Eth_grad1516-sorted maxdec=0
    ;
    var HISPANIC AM_IND ASIAN PAC_ISLD FILINO AFRICAN_AM WHITE
    CLASS COUNTY;
	output out=Eth_grad1516_summary
run;    
title;
footnote; 


*******************************************************************************;

* Research Question Analysis Starting Point;

*******************************************************************************;

title1
'Research Question: Is the dropouts related to the students’ race or enrollment?' 
;
title2
'Rationale: This would help policymakers and educators trying to understand and solve this complex social and educational problem.'
;

footnote1

;

footnote2

;

*

Note: This compares the column ethnic and dropout. 

Methodology: When combining enrollment1516 and Race_dropout1516 during data preparation.

Limitations: This methodology does not account for schools with missing data,
nor does it attempt to validate data in any way, like filtering for values
outside of admissable values.

Followup Steps: More carefully clean the values of variables so that the
statistics computed do not include any possible illegal values, and better
handle missing data, e.g., by using a previous year's data or a rolling average
of previous years' data as a proxy.
;


