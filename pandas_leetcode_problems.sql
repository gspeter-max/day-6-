'''1517. Find Users With Valid E-Mails'''
https://leetcode.com/problems/find-users-with-valid-e-mails/

import pandas as pd
def valid_emails(users: pd.DataFrame) -> pd.DataFrame:
    
    import re 
    patterns = r'[#]|^\.|^_|^-'
    patterns_2 = r'@leetcode\.com$'

    users = users[~users['mail'].apply(lambda x : bool(re.search(patterns, x)))]
    return users[users['mail'].apply(lambda x : bool(re.search(patterns_2, x)))]
 
