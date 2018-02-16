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


*

Note: This compares the column "Total" from Eth_grad_1415 to the column of the 
same name from Eth_grad_1516.


Methodology: When combining Eth_grad_1415 with Eth_grad_1516 during data preparation,

take the difference of values of "Total graduates" for each school and

create a new variable called grad_change_2014_to_2015. Then,

use proc sort to create a temporary sorted table in descending by

grad_change_2014_to_2015. Finally, use proc print here to display the

first five rows of the sorted dataset.


Limitations: This methodology does not account for schools with missing data,

nor does it attempt to validate data in any way.


Followup Steps: More carefully clean values in order to filter out any possible

illegal values, and better handle missing data, e.g., by using a previous year's

data or a rolling average of previous years' data as a proxy.
; 


