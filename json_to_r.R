library(rjson)
library(jsonlite) 
json_file <- file("input json.json")
json_data <- fromJSON(json_file, simplifyDataFrame = FALSE)
library(plyr)
asFrame <- do.call("rbind.fill", lapply(json_data, as.data.frame))
asFrame

prog<-asFrame[,c("results.values.1","results.values.2","results.values.3","results.attributes.Site_ID","results.attributes.Tank_No")]
prog<- setNames(prog,c("Epoch to Date","B","C","D","E"))
prog

p<- prog

p[,c("Epoch to Date")]<-as.POSIXct((p[,c("Epoch to Date")]+0.1)/1000,origin="1970-01-01")

p

write.csv(p,file = "MyData.csv")