import pandas as pd
import numpy as np

raw_data = {
        'customer_id': ['1', '2', '3', '4', '5'],
        'first_name': ['George', 'John', 'Thomas', 'James', 'James'], 
        'last_name': ['Washington', 'Adams', 'Jefferson', 'Madison', 'Monroe'],
        'email':['gwashington@usa.gov','jadams@usa.gov','tjefferson@usa.gov','jmadison@usa.gov','jmonroe@usa.gov'],
        'address':['3200 Mt Vernon Hwy', '1250 Hancock St', '931 Thomas Jefferson Pkwy', '11350 Constitution Hwy', '2050 James Monroe Parkway'],
        'city':['Mount Vernon', 'Quincy', 'Charlottesville', 'Orange', 'Charlottesville'],
        'state':['VA', 'MA', 'VA', 'VA', 'VA'],
        'zipcode':['22121', '02169', '22902', '22960', '22902']}
df_a = pd.DataFrame(raw_data, columns = ['customer_id', 'first_name', 'last_name','email','address','city','state','zipcode'])

print(" TABLE A CUSTOMER" )

print(df_a)

print(" ")

raw_data = {
        'sale_id': ['1', '2', '3', '4', '5','6'],
        'sale_date': ['07/04/1776', '03/14/1760', '05/23/1784', '09/03/1790', '07/21/1795','11/27/1787'],
        'amount': ['234.56', '78.50', '124.00', '65.50', '25.50','14.40'],
        'customer_id': ['1', '3', '2', '3', np.nan,np.nan]
        }
df_b = pd.DataFrame(raw_data, columns = ['sale_id','sale_date','amount','customer_id'])

print(" TABLE B SALE" )

print(df_b)

print(" ")

print(" MERGE LEFT, JOIN LEFT")

print(pd.merge(df_a,df_b, on='customer_id', how='left'))

print(" ")

print(" MERGE LEFT ONLY, JOIN LEFT WHERE IS NULL")

print(pd.merge(df_a,df_b, on='customer_id', how='left', indicator=True).query('_merge == "left_only"').drop('_merge', 1))

print(" ")

print(" MERGE INNER, INNER JOIN")

print(pd.merge(df_a,df_b, on='customer_id', how='inner'))

print(" ")

print(" MERGE RIGHT ONLY, JOIN RIGHT WHERE IS NULL")

print(pd.merge(df_a,df_b, on='customer_id', how='right'))

print(" ")

print(" MERGE RIGHT, JOIN RIGHT")

print(pd.merge(df_a,df_b, on='customer_id', how='right', indicator=True).query('_merge == "right_only"').drop('_merge', 1))

print(" ")

print(" MERGE OUTER, FULL OUTER JOIN")

print(pd.merge(df_a,df_b, on='customer_id', how='outer'))

print(" ")

print(" MERGE OUTER EXCLUDE BOTH, FULL OUTER JOIN WHERE IS NULL")

print(pd.merge(df_a,df_b, on='customer_id', how='outer', indicator=True).query('_merge != "both"').drop('_merge', 1))

print(" ")
