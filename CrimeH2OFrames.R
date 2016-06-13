#File: CrimeH2OFrames.R



h2oCrimeTrainFrame = as.h2o(crimeTrain, destination_frame = "h2oCrimeTrainFrame")
h2oCrimeTestFrame = as.h2o(crimeTest, destination_frame = "h2oCrimeTestFrame")

h2o.exportFile(h2oCrimeTrainFrame, path = "./CrimeH2oTrainFrame.out", force = TRUE)
h2o.exportFile(h2oCrimeTestFrame, path = "./CrimeH2oTestFrame.out", force = TRUE)
h2oCrimeTrainFrame = h2o.uploadFile(path = "./CrimeH2oTrainFrame.out")
h2oCrimeTestFrame = h2o.uploadFile(path = "./CrimeH2oTestFrame.out")
