#!/usr/bin/env python
# coding: utf-8

# In[1]:


import pandas as pd


# In[2]:


pd.__version__


# In[ ]:


df = pd.read_csv('green_tripdata_2019-10.csv.gz', nrows=100)


# In[ ]:


df.lpep_pickup_datetime = pd.to_datetime(df.lpep_pickup_datetime)
df.lpep_dropoff_datetime = pd.to_datetime(df.lpep_dropoff_datetime)


# In[2]:


from sqlalchemy import create_engine


# In[3]:


engine = create_engine('postgresql://root:root@localhost:5431/ny_taxi')


# In[4]:


engine.connect()


# In[41]:


print(pd.io.sql.get_schema(df, name='green_trip_data', con=engine))


# In[6]:


df_iter = pd.read_csv("green_tripdata_2019-10.csv.gz", iterator=True, chunksize=100000)


# In[7]:


df = next(df_iter)


# In[11]:


len(df)


# In[8]:


df.lpep_pickup_datetime = pd.to_datetime(df.lpep_pickup_datetime)
df.lpep_dropoff_datetime = pd.to_datetime(df.lpep_dropoff_datetime)


# In[13]:


df.head(n=0).to_sql(name='green_trip_data', con=engine, if_exists='replace', index=False)


# In[10]:


get_ipython().run_line_magic('time', "df.to_sql(name='green_trip_data', con=engine, if_exists='append', index=False)")


# In[9]:


from time import time


# In[11]:


while True:
    t_start = time()
    df = next(df_iter)
    df.lpep_pickup_datetime = pd.to_datetime(df.lpep_pickup_datetime)
    df.lpep_dropoff_datetime = pd.to_datetime(df.lpep_dropoff_datetime)
    df.to_sql(name='green_trip_data', con=engine, if_exists='append', index=False)
    t_end = time()
    print('inserted another chunk..., took %.3f second' % (t_end - t_start))


# In[ ]:




