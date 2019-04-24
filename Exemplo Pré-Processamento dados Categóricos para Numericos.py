# -*- coding: utf-8 -*-
"""
Created on Fri Apr 19 17:01:19 2019

"""

import pandas as pd
df = pd.DataFrame({'name': ['Maria', 'José', 'Amélia'],
                   'Org':  ['ABC2', 'ABC1', 'NSV2'],
                   'Dept': ['Financeiro', 'HR', 'HR']        
        })


df_2 = pd.get_dummies(df,drop_first=False)

from sklearn.preprocessing import LabelEncoder, OneHotEncoder

X = df.values

labelencoder_X_0 = LabelEncoder()
X[:, 0] = labelencoder_X_0.fit_transform(X[:, 0])

