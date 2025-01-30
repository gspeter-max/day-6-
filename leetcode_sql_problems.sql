https://leetcode.com/problems/find-users-with-valid-e-mails/
'''1517. Find Users With Valid E-Mails'''

select user_id , name , mail 
from users 
where mail regexp '^[a-zA-Z][a-zA-Z0-9._-]*@leetcode\\.com$';




'''1527. Patients With a Condition'''
https://leetcode.com/problems/patients-with-a-condition/

select patient_id, patient_name , conditions
from patients 
where conditions regexp '(^|[[:space:]])DIAB1[0-9]*($|[[:space:]])';


'''1581. Customer Who Visited but Did Not Make Any Transactions'''
https://leetcode.com/problems/customer-who-visited-but-did-not-make-any-transactions/
# Write your MySQL query statement below

with temp_temp as (
	select v.visit_id as visit_id  , 
		v.customer_id  as customer_id 
	from visits v 
	left join Transactions t 
	on v.visit_id = t.visit_id 
	where t.visit_id is null
	) 
select customer_id , 
	count(visit_id) as count_no_trans
from temp_temp 
group by customer_id ;   
