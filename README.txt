This is a brief introduction to how to use the kinematics classification model based on random forest classifier.

1. Firstly, prepare the kinematics file of your impacts, follow the example_kinematics.mat.
	The file should contains a structure variable (1*N, N is number of impacts) named impact, each including at least 3 fields: ang_vel, lin_acc_CG, t.
	ang_vel: angular acceleration in 3 axes;
	lin_acc_CG: linear acceleration at brain center of gravity in 3 axes;
	t: absolute time of each sampling point.

2. Read, fill in the blanks in feature_extraction.m according to your file name to extract the spectral density features for your impacts!

3. Run the python file: make_prediction.py to get the predictions.
	Python requirements: joblib, numpy, scipy, sklearn

Enjoy using this tool for kinematics classification!

If you have any question, please contact xzhan96@stanford.edu