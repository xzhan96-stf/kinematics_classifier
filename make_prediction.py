import numpy as np
import joblib
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import precision_score,recall_score,roc_auc_score
from sklearn.preprocessing import StandardScaler
from scipy.io import savemat,loadmat

#Load Model
ss = joblib.load('scaler.joblib') #Please replace the scaler file and the model file according to your setting.
rf = joblib.load('rf_model.joblib')

#Load Data (with features extracted)
X = loadmat('X_class_features_96.mat')['feature_matrix'] #Replace this file name with the one generated
X_std = ss.transform(X)

#Make Prediction
y_pred = rf.predict(X_std) #0-HM, 1-CF, 2-MMA, 3-NFL, 4-NHTSA, 5-NASCAR

#Output Prediction
print(y_pred)
np.save('saved_prediction.npy',y_pred) #Choose a place to store the prediction