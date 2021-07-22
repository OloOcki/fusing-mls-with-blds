## Loading data stored in package
network <- system.file("coregistration", "georegistration.net", package = "bnspatial")

spatialData <- c(system.file("coregistration", "mls.tif", package = "bnspatial"),
                 system.file("coregistration", "grWall.tif", package = "bnspatial"),
                 system.file("coregistration", "wall.tif", package = "bnspatial"),
                 system.file("coregistration", "grBuilding.tif", package = "bnspatial"))

lookup <- system.file("coregistration", "classAssignment.txt", package = "bnspatial")

targetNode <- "OccupiedSpacesBldWalls"
##entropyChangeTargetNode <- "ModelDifferences"

outPath <- "D:/projects/PassageFinder/PointCloudGeoregistration/Bayesian/outNetwork"
###


###1. Probability of Target node###
## Run a spatial query on the Bayesian network
bn <- bnspatial(network, targetNode, spatialData, lookup, 
                what="probability", targetState=c("occupied","unoccupied"), 
                path = outPath, exportRaster = TRUE)
par(mfrow=c(1,2))
plot(bn$Probability$occupied, main="Probability of wall confirmation")
plot(bn$Probability$unoccupied, main="Probability of wall unconfirmation")



