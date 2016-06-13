# Generate and return H2O Data Frame with predictions on crime test set based
# on specified model. Also export CSV file for submission (and safety)
# Filename includes model name and provided suffix
# 
predictCrimeTestSet = function(model, suffix) {
    system.time((H2oTestPred = predict(model, newdata = h2oCrimeTestFrame)))
    result =  h2o.cbind(h2oCrimeTestFrame[,1], H2oTestPred[,-1])
    filename = paste("./kaggleCrimeTestPred", modelName(model), sep="", suffix, ".csv")
    h2o.exportFile(H2oTestPred, path = filename, force = TRUE)
    result
}


