'''1517. Find Users With Valid E-Mails'''
https://leetcode.com/problems/find-users-with-valid-e-mails/
import pandas as pd

def valid_emails(users: pd.DataFrame) -> pd.DataFrame:
    import re 

    patterns = r'[a-zA-Z][a-zA-Z0-9._-]*@leetcode\.com$'

    filters = users[users['mail'].str.match(patterns, na = False)]
    return filters 



'''1527. Patients With a Condition'''
https://leetcode.com/problems/patients-with-a-condition/

import pandas as pd

def find_patients(patients: pd.DataFrame) -> pd.DataFrame:
    import re 

    patterns = r'(?<!\+)\bDIAB1[0-9]*\b'
    filters = patients[patients['conditions'].apply(lambda x : bool(re.search(patterns,x)))]
    return filters 
'''
1581. Customer Who Visited but Did Not Make Any Transactions'''
https://leetcode.com/problems/customer-who-visited-but-did-not-make-any-transactions/

import pandas as pd

def find_customers(visits: pd.DataFrame, transactions: pd.DataFrame) -> pd.DataFrame:
    import numpy as np    
    merge = pd.merge(
        visits, 
        transactions,
        on = 'visit_id', 
        how = 'left'
    ) 
    merge = merge[pd.isna(merge['transaction_id'])]
    merge = merge.groupby('customer_id')['visit_id'].agg('count').reset_index() 
    merge.columns = ['customer_id','count_no_trans']
    return merge 
