library(plot3D)

data <- read.csv(file="data_proj_414.csv", header=TRUE)
x1 <- data["X"][data["Trip"]==1 & data["Close"]!=0]
y1 <- data["Y"][data["Trip"]==1 & data["Close"]!=0]
z1 <- data["Close"][data["Trip"]==1 & data["Close"]!=0]

x <- data["X"][data["Close"]!=0]
y <- data["Y"][data["Close"]!=0]

test <- 1.0

persp3D(x1, y1, test)
