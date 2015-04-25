data <- read.csv("repdata-data-StormData.csv")
head(data)
names(data)

unique(data$PROPDMGEXP)
data$PROPDMGEXP <- as.character(data$PROPDMGEXP)
data$PROPDMGEXP[which(data$PROPDMGEXP == "K")] <- 1e+03
data$PROPDMGEXP[which(data$PROPDMGEXP == "M")] <- 1e+06
data$PROPDMGEXP[which(data$PROPDMGEXP == "")] <- 1
data$PROPDMGEXP[which(data$PROPDMGEXP == "B")] <- 1e+09
data$PROPDMGEXP[which(data$PROPDMGEXP == "m")] <- 1e+06
data$PROPDMGEXP[which(data$PROPDMGEXP == "+")] <- 0
data$PROPDMGEXP[which(data$PROPDMGEXP == "0")] <- 1
data$PROPDMGEXP[which(data$PROPDMGEXP == "5")] <- 1e+05
data$PROPDMGEXP[which(data$PROPDMGEXP == "6")] <- 1e+06
data$PROPDMGEXP[which(data$PROPDMGEXP == "?")] <- 0
data$PROPDMGEXP[which(data$PROPDMGEXP == "4")] <- 1e+04
data$PROPDMGEXP[which(data$PROPDMGEXP == "2")] <- 1e+02
data$PROPDMGEXP[which(data$PROPDMGEXP == "3")] <- 1e+03
data$PROPDMGEXP[which(data$PROPDMGEXP == "h")] <- 1e+02
data$PROPDMGEXP[which(data$PROPDMGEXP == "7")] <- 1e+07
data$PROPDMGEXP[which(data$PROPDMGEXP == "H")] <- 1e+02
data$PROPDMGEXP[which(data$PROPDMGEXP == "-")] <- 0
data$PROPDMGEXP[which(data$PROPDMGEXP == "1")] <- 10
data$PROPDMGEXP[which(data$PROPDMGEXP == "8")] <- 1e+08
data$PROPDMGAMOUNT <- data$PROPDMG * as.numeric(data$PROPDMGEXP)

unique(data$CROPDMGEXP)
data$CROPDMGEXP <- as.character(data$CROPDMGEXP)
data$CROPDMGEXP[which(data$CROPDMGEXP == "")] <- 1
data$CROPDMGEXP[which(data$CROPDMGEXP == "M")] <- 1e+06
data$CROPDMGEXP[which(data$CROPDMGEXP == "K")] <- 1e+03
data$CROPDMGEXP[which(data$CROPDMGEXP == "m")] <- 1e+06
data$CROPDMGEXP[which(data$CROPDMGEXP == "B")] <- 1e+09
data$CROPDMGEXP[which(data$CROPDMGEXP == "?")] <- 0
data$CROPDMGEXP[which(data$CROPDMGEXP == "0")] <- 1
data$CROPDMGEXP[which(data$CROPDMGEXP == "k")] <- 1e+03
data$CROPDMGEXP[which(data$CROPDMGEXP == "2")] <- 1e+02
data$CROPDMGAMOUNT <- data$CROPDMG * as.numeric(data$CROPDMGEXP)

Fatalities <- aggregate(data$FATALITIES, by = list(data$EVTYPE), FUN = sum)
names(Fatalities) <- c("EVTYPE", "FATALITIES")

Injuries <- aggregate(data$INJURIES, by = list(data$EVTYPE), FUN = sum)
names(Injuries) <- c("EVTYPE", "INJURIES")

Propdmgamount <- aggregate(data$PROPDMGAMOUNT, by = list(data$EVTYPE), FUN = sum)
names(Propdmgamount) <- c("EVTYPE", "PROPDMGAMOUNT")

Cropdmgamount <- aggregate(data$CROPDMGAMOUNT, by = list(data$EVTYPE), FUN = sum)
names(Cropdmgamount) <- c("EVTYPE", "CROPDMGAMOUNT")