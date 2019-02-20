#11.48

SoVTable <- matrix(c(NA, NA, NA, NA, 249.61, 19, NA, NA, 317.80, 25, NA, NA), ncol = 4, byrow = T)
colnames(SoVTable) <- c("SS", "df", "MS", "F")
rownames(SoVTable) <- c("Treatment", "Error", "Total")

SoVTable <- as.table(SoVTable)
SoVTable

SoVTable[1,1] <- SoVTable[3,1]-SoVTable[2,1]
SoVTable[1,2] <- SoVTable[3,2]-SoVTable[2,2]


SoVTable[1,3] <- SoVTable[1,1]/SoVTable[1,2]
SoVTable[2,3] <- SoVTable[2,1]/SoVTable[2,2]

SoVTable[1,4] <- SoVTable[1,3]/SoVTable[2,3]
SoVTable

#11.58----------------------------------------------
blockmethods <- c(1310, 1275, 1280, 1225, 1190, 1300, 1080, 1100, 1050, 1020, 990, 
             1030, 850, 1020, 780, 870, 805, 910)
methods <- c(rep("Method 1", times=6),rep("Method 2", times=6), rep("Method 3", times=6))
mydata <- data.frame(blockmethods, methods)

qf(0.99, df1 = 2, df2 = 15)

anova <- aov(blockmethods~methods, data=mydata) 
summary(anova)

#11.57----------------------------------------------


