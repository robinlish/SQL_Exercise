/* For all the questions in this practice set, you will be using the Salary by Job Range Table. This is a single table titled: salary_range_by_job_classification. This table contains the following columns:  
   SetID
 Job_Code
 Eff_Date Sal_End_Date
# Salary_setID
# Sal_Plan
# Grade
# Step
# Biweekly_High_Rate
# Biweekly_Low_Rate
# Union_Code
# Extended_Step
# Pay_Type*/

--1. Find the distinct values for the extended step
SELECT 
distinct Extended_step
from salary_range_by_job_classification

--2. Excluding $0.00, what is the minimum bi-weekly high rate of pay (please include the dollar sign and decimal point in your answer)? 
Select
min(Biweekly_high_Rate)
From salary_range_by_job_classification
where Biweekly_high_Rate <> "$0.00"

--3. What is the maximum biweekly high rate of pay (please include the dollar sign and decimal point in your answer)?
Select
Max(Biweekly_high_Rate)
from salary_range_by_job_classification

--4. What is the pay type for all the job codes that start with '03'
Select
job_code,
pay_type
from salary_range_by_job_classification
where job_code like "03%"

--5. Run a query to find the Effective Date (eff_date) or Salary End Date (sal_end_date) for grade Q90H0? 
Select
grade,
sal_end_date,
eff_date,
from salary_range_by_job_classification
where grade = 'Q90H0'

--6. Sort the Biweekly low rate in ascending order. 
select 
Biweekly_Low_Rate
from salary_range_by_job_classification
order by Biweekly_Low_Rate asc

--7. Write and run a query, with no starter code to answer this question: What Step are Job Codes 0110-0400?
select Step,
Job_Code
from salary_range_by_job_classification
where Job_Code between '0110' and '0400'

--8. Write and run a query, with no starter code or hints to answer this question: What is the Biweekly High Rate minus the Biweekly Low Rate for job Code 0170?
select Biweekly_High_Rate,
Biweekly_Low_Rate,
Biweekly_High_Rate - Biweekly_Low_Rate
from salary_range_by_job_classification
where job_code = '0170'

--9. Write and run a query, with no starter code or hints to answer this question: What is the Extended Step for Pay Types M, H, and D?
select Extended_Step,
Pay_Type
from  salary_range_by_job_classification
where Pay_Type in ('M','H','D')

--10. Write and run a query, with no starter code or hints to answer this question: What is the step for Union Code 990 and a Set ID of SFMTA or COMMN?
select step,
union_code,
setid
from  salary_range_by_job_classification
where union_code = '990' and setid in ("SFMTA","COMMN")