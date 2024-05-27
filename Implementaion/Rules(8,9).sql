
-- Rules for the Company 
-- Points --> 8 and 9 in the project wizard 

use Company ;
Go  

-- Create a rule for salary column 
create rule rule_salary 
as 
	@SALARY < 6000; 
Go 

-- Create a rule or constrains on address 
create rule rule_address
as 
	@ADDRESS in ("alex","mansoura","mansoura")
GO