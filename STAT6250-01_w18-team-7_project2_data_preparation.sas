*******************************************************************************;
**************** 80-character banner for column width reference ***************;
* (set window width to banner width to calibrate line length to 80 characters *;
*******************************************************************************;

*
[Dataset 1 Name] Eth_grad_1415

[Dataset Description] Graduates by Ethnicity and Gender Data, AY2014-15

[Experimental Unit Description] California public K-12 schools in AY2014-15

[Number of Observations] 2491
                    
[Number of Features] 16

[Data Source] http://dq.cde.ca.gov/dataquest/dlfile/dlfile.aspx?cLevel=School&
cYear=2014-15&cCat=GradEth&cPage=filesgrad.asp 

[Data Dictionary] https://www.cde.ca.gov/ds/sd/sd/fsgrad09.asp

[Unique ID Schema] The unique id column CDS_CODE 

--

[Dataset 2 Name] Eth_grad_1516

[Dataset Description] Graduates by Ethnicity and Gender Data, AY2015-16

[Experimental Unit Description] California public K-12 schools in AY2015-16

[Number of Observations] 2522
                    
[Number of Features] 16

[Data Source] http://dq.cde.ca.gov/dataquest/dlfile/dlfile.aspx?cLevel=School&
cYear=2014-15&cCat=GradEth&cPage=filesgrad.asp 

[Data Dictionary] https://www.cde.ca.gov/ds/sd/sd/fsgrad09.asp

[Unique ID Schema] The unique id column CDS_CODE 

--

[Dataset 3 Name] Enrollment1516

[Dataset Description] Enrollment by racial/ethnic designation, gender, and 
grade AY2015-2016

[Experimental Unit Description] California public K-12 schools in AY2015-16

[Number of Observations] 65535
                    
[Number of Features] 23

[Data Source] http://dq.cde.ca.gov/dataquest/dlfile/dlfile.aspx?cLevel=School&
cYear=2015-16&cCat=Dropouts&cPage=filesdropouts

[Data Dictionary] https://www.cde.ca.gov/ds/sd/sd/fsenr.asp

[Unique ID Schema] The column CDS_CODE is a unique id.

--

[Dataset 4 Name] Race_dropout1516

[Dataset Description] Grade seven through twelve dropouts and enrollment by 
race/ethnic designation and gender by school in AY2015-2016 

[Experimental Unit Description] California public K-12 schools in AY2015-16

[Number of Observations] 58876
                    
[Number of Features] 20

[Data Source] http://dq.cde.ca.gov/dataquest/dlfile/dlfile.aspx?cLevel=School
&cYear=2015-16&cCat=Enrollment&cPage=filesenr.asp

[Data Dictionary] https://www.cde.ca.gov/ds/sd/sd/fsdropouts.asp

[Unique ID Schema] The column CDS_CODE is a unique id.

----

;


* environmental setup;

* setup environmental parameters;

%let inputDataset1URL =

https://github.com/stat6250/team-7_project2/blob/master/Data/Eth_grad_1415.xls?raw=true

;

%let inputDataset1Type = XLS;

%let inputDataset1DSN = Eth_grad1415_raw;



%let inputDataset2URL =

https://github.com/stat6250/team-7_project2/blob/master/Data/Eth_grad_1516.xls?raw=true

;

%let inputDataset2Type = XLS;

%let inputDataset2DSN = Eth_grad1516_raw;



%let inputDataset3URL =

https://github.com/stat6250/team-7_project2/blob/master/Data/Enrollment1516.xls?raw=true

;

%let inputDataset3Type = XLS;

%let inputDataset3DSN = Enrollment1516_raw;



%let inputDataset4URL =

https://github.com/stat6250/team-7_project2/blob/master/Data/Race_dropout1516.xls?raw=true

;

%let inputDataset4Type = XLS;

%let inputDataset4DSN = Race_dropout1516_raw;


* load raw datasets over the wire, if they doesn't already exist;

%macro loadDataIfNotAlreadyAvailable(dsn,url,filetype);

    %put &=dsn;

    %put &=url;

    %put &=filetype;

    %if

        %sysfunc(exist(&dsn.)) = 0

    %then

        %do;

            %put Loading dataset &dsn. over the wire now...;

            filename tempfile "%sysfunc(getoption(work))/tempfile.xlsx";

            proc http

                method="get"

                url="&url."

                out=tempfile

                ;

            run;

            proc import

                file=tempfile

                out=&dsn.

                dbms=&filetype.;

            run;

            filename tempfile clear;

        %end;

    %else

        %do;

            %put Dataset &dsn. already exists. Please delete and try again.;

        %end;


%mend;

%loadDataIfNotAlreadyAvailable(

    &inputDataset1DSN.,

    &inputDataset1URL.,

    &inputDataset1Type.

)

%loadDataIfNotAlreadyAvailable(

    &inputDataset2DSN.,

    &inputDataset2URL.,

    &inputDataset2Type.

)

%loadDataIfNotAlreadyAvailable(

    &inputDataset3DSN.,

    &inputDataset3URL.,

    &inputDataset3Type.

)

%loadDataIfNotAlreadyAvailable(

    &inputDataset4DSN.,

    &inputDataset4URL.,

    &inputDataset4Type.

)
