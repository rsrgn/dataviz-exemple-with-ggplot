
#----Cleaning memory----
rm(list = ls())


#----Loading libraries----

library(tidyverse) #to ploting with ggplot2
library(reshape) #to using function melt

#----Setting Working Directory----

#Working directory on my computer
setwd("C:/Users/serou/Documents/cours/MEDAS/DATAVIZ")

#----Loading data----

exo1  <- read.csv2(file="./dataviz_exo_1_data.csv")

#----Data preparation----

exo1 <- melt(exo1, id=c("Titre","Perimetre"))

#----Plot----

p <- ggplot(exo1[exo1$value=="Oui",], aes(variable,Titre))
p <- p + ggtitle("Années de mises à jours des données pour différents projets open data") +
  xlab("Années") + ylab("Projets")
p <- p + geom_point(aes(colour = factor(Perimetre)) , size = 10 , shape = 19)
p <- p + labs(colour = "Périmètre du projet")
p <- p + theme_minimal()
p

#----Exporting plot----

image_width <- 1920 
image_heigth <- 1200
image_resolution <- 140 
file_name <- "plot_01"

dev.off() 
#image file 
png(paste("./img/",file_name,".png",sep=""), width=image_width ,height=image_heigth  ,res=image_resolution)

p

dev.off() 

