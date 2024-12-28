/* There are many missing observations in the dataset, both with respect to outcomes and covariates.
A SAS program to give a quick visualization of the missing values by questions and create a
barplot to see whether there are specific questions that have lower response rates.

This program shows how to count the number of missing observations for numeric type and character
type entries and merging them to a single SAS table for the barplot.
*/
/* Import the excel datafile*/
option validvarname=v7;

proc import datafile="/home/u64114183/sasuser.v94/market_survey_data_mod.xlsx" 
		out=work.market_survey_data(drop=S) dbms=xlsx replace;
run;

/* Description of the columns*/
proc contents data=work.market_survey_data;
run;

/* We see that columns N and R are character type and all other are numeric type */
/* Select columns excluding the first two(as they are refer to household no and product id)
It is also preferable to rename the column names as all are very long. I rename them as per our
column description. We store the new table as Quesdata*/
data work.Quesdata;
	set work.market_survey_data(keep=value--hispanic);
	rename value=C ratprod=D perform=E Overall_Perfume=F 
		Product_does_not_irritate_hand=G Color_of_product=H Overall_package=I 
		Not_having_too_much_effort_dispe=J Do_you_think_the_package_was_fil=K 
		Do_you_place_product_directly_un=L How_do_you_care_for_dishes__1__o=M 
		Past6mUserOfBrandX=N household_income=O Age__categorical_10_yrs__interva=P 
		__handwash_per_week=Q Hispanic=R;
run;

/*Now count the number of missing values in the numeric columns*/
proc means data=work.Quesdata nmiss noprint;
	output out=work.missing_numeric(drop=_TYPE_-- _FREQ_) nmiss= / autoname;
run;

/*Count the number of missing values in the character columns i.e., N and R*/
proc sql;
	create table work.missing_char as select nmiss(N) as N_Nmiss, nmiss(R) as 
		R_Nmiss from work.Quesdata;
quit;

/*Transpose both the tables preparing for merging*/
proc transpose data=work.missing_numeric 
		out=work.transposed_numeric(drop=_LABEL_);
run;

proc transpose data=work.missing_char out=work.transposed_char;
run;

/* Merge missing count data for all columns*/
data work.missing_counts;
	set work.transposed_numeric work.transposed_char;
run;

/*Create a bar chart for all the missing values*/
proc sgplot data=work.missing_counts;
	vbar _NAME_ / response=COL1 fillattrs=(color=red);
	xaxis label="Column ID";
	yaxis label="Count of Missing Observations";
	title "Count of Missing Observations";
run;

/* The barchart shows that among all the questions Question F: "Do you like the scent(perfume) of the product?"
has the lowest response rate. Thereafter, Cols K,M,L,J,I,H have similar level of missingness in their responses. */
