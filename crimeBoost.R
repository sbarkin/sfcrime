
set.seed(20000)

#Naive submission: list(ntrees = 100, max_depth = 5, min_rows = 10, learn_rate = 0.1)
#Grid June10: crimeBoostHyper = list(ntrees = c(100,200), max_depth = c(5,7), 
#                      min_rows = c(10,20), learn_rate = c(0.01, 0.1))
# Winner was ntrees = 100, max_depth = 5, min_rows = 20, learn_rate = 0.1

crimeBoostHyper = list(ntrees = c(50,100), max_depth = c(3,5), min_rows = c(20,50),
                       learn_rate = c(0.1, 0.2))
#crimeXLabels = grep("Category", colnames(crimeTrain), invert = TRUE, value = TRUE)
crimeXLabels = c("X", "Y", "DayOfWeek", "Month", "PdDistrict")
system.time((crimeBoostGrid = h2o.grid("gbm",
                          grid_id = "crimeBoostgrid",distribution = "multinomial",
                         x = crimeXLabels, y = "Category",
                         training_frame = h2oCrimeTrainFrame, hyper_params = crimeBoostHyper,
                         nfolds = 5)))

bestCrimeBoostModelName = crimeBoostGrid@model_ids[[1]]
bestCrimeBoostModel = h2o.getModel(bestCrimeBoostModelName)
crimeModelPath <- h2o.saveModel(
    object = bestCrimeBoostModel,
    path = "./models", 
    force = TRUE)
bestCrimeBoostModel = h2o.loadModel(crimeModelPath)

#crimeModtab <- h2o.getGrid(grid_id = "crimeBoostgrid", sort_by = "mse", decreasing = FALSE)

