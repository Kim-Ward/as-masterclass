# Bad Code, Better Code

This is an alternate exercise to "Cracking the Code" for people who want something a little less intense, don't have a computer with R on to hand, or can't live without Python.

Let's start with this *atrocity* that was in the presentation, which is all about predicting responses to the 2021 Census by looking at 2011 data and adjusting for an increase in population:
```python
import pandas as pd

df1 = pd.read_csv("users/amp45/python/current_code/input_data/census/online_returns.csv")
df2 = pd.read_csv("users/amp45/python/current_code/input_data/census/paper_returns.csv")
df3 = pd.read_csv("users/amp45/python/current_code/input_data/census/total_returns.csv")

df1['sum'] = df1['england'] + df1['wales']
df2['sum'] = df2['england'] + df2['wales']
df3['sum'] = df3['england'] + df3['wales']

df4 = pd.read_csv("users/amp45/python/current_code/input_data/population/2011_sample.csv")
df4 = pd.read_csv("users/amp45/python/current_code/input_data/population/2021_estimates.csv") / df4

df1['2021'] = df1['sum'] * df4
df2['2021'] = df2['sum'] * df4
df3['2021'] = df3['sum'] * df4

df1.to_csv("users/amp45/python/current_code/input_data/census/online_returns_2021.csv")
df2.to_csv("users/amp45/python/current_code/input_data/census/paper_returns_2021.csv")
df3.to_csv("users/amp45/python/current_code/input_data/census/total_returns_2021.csv")

```
Can you think of some ways to fix this? Have a chat about it. Once you've thought a little, have a look at the steps below, which detail one analyst's valiant attempts to make this bad code better.

## Fixing things.

Here, we present three *easy* fixes for the filepath problem.
```python
#1 Changing the "starting point" for filepaths.
import os
os.chdir("users/amp45/python/current_code/input_data/census/")
df1 = pd.read_csv("online_returns.csv")

#2 Storing a part of the filepath in a string.
filepath = "users/amp45/python/current_code/input_data/census/"
df1 = pd.read_csv(fp + "online_returns.csv")

#3 Using string methods to format the string containing the filepath.
filepath = "users/amp45/python/current_code/input_data/{}/{}.csv"
df1 = pd.read_csv(filepath.format("census", "online_returns"))
df4 = pd.read_csv(filepath.format("population", "2011_sample"))

```
Let's name our DataFrames something more useful too!
```python

import pandas as pd
import os
os.chdir("users/amp45/python/current_code/input_data/census")

df_online = pd.read_csv("online_returns.csv")
df_paper = pd.read_csv("paper_returns.csv")
df_total = pd.read_csv("total_returns.csv")

df_online['sum'] = df_online['england'] + df_online['wales']
df_paper['sum'] = df_paper['england'] + df_paper['wales']
df_total['sum'] = df_total['england'] + df_total['wales']

#Ah. We're stuck. Should we move the working directory again?
#Fortunately, we can use ".." to go up a level.

sample = pd.read_csv("../population/2011_sample.csv")
estimates = pd.read_csv("../population/2021_estimates.csv") / sample

df_online['2021'] = df_online['sum'] * df_estimates
df_paper['2021'] = df_paper['sum'] * df_estimates
df_total['2021'] = df_total['sum'] * df_estimates

df_online.to_csv("online_returns_2021.csv")
df_paper.to_csv("paper_returns_2021.csv")
df_total.to_csv("total_returns_2021.csv")

```
Let's use a for-loop to delete half of this code:
```python

import pandas as pd
import os
os.chdir("users/amp45/python/current_code/input_data/census")

sample = pd.read_csv("../population/2011_sample.csv")
estimates = pd.read_csv("../population/2021_estimates.csv") / sample

for i in ['online', 'paper', 'total']:
    df = pd.read_csv(i + "_returns.csv")
    df['sum'] = df['england'] + df['wales']
    df['2021'] = df['sum'] * df_estimates
    df.to_csv(i + "_returns_2021.csv")

```
Very nice and short! But we could do more for readability,
and we might want to have access to all the data in memory afterwards.
Let's try using a dictionary, and look at the full scope of our code.
```python

import pandas as pd
import os
os.chdir("users/amp45/python/current_code/input_data/census")

sample = pd.read_csv("../population/2011_sample.csv")
estimates = pd.read_csv("../population/2021_estimates.csv") / sample

df_dict = {}

for mode in ['online', 'paper', 'total']: #mode of response
    df = pd.read_csv(mode + "_returns.csv")
    df['sum'] = df['england'] + df['wales']
    df['2021'] = df['sum'] * estimates
    df.to_csv(mode + "_returns_2021.csv")
    df_dict[mode] = df

```
That's the first proper comment I've done so far! The alternative would be having a longer variable name, which may be appropriate in some instances.

The above code might not be "perfect", but it is *better* code, and using simple tricks like these will save you time and effort.

## Reflections

* What examples of "bad code" have you encountered? How could they be made better?

* Remember that all code is written to serve a purpose, and as long as it serves that purpose, it's not really "bad". The code evaluation rubric handout we've given you was written from the point of view of a software engineer, not a data analyst. Is there anything there you disagree with?
