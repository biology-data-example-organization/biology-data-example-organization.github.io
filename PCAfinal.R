setwd("C:/Users/gurob/OneDrive - UiT Office 365/Arctic Marine Ecology/2024V/Special curriculum")

#Libraries that I will use
library(vegan)
library(corrplot)
library(ggcorrplot)
library(ggplot2)
library(ggstatsplot)

Sorensen_data <- read.csv("Sorensen data.csv",sep=";")

#NOTE: month is not correct, has changed during csv conversion. Remove column 3
Sorensen_data <- Sorensen_data[,-3]
colnames(Sorensen_data)[which(colnames(Sorensen_data) == "Urc_cover")] <- "Urchin_cover" 
colnames(Sorensen_data)[which(colnames(Sorensen_data) == "Lem_sole")] <- "Lemon_sole"
colnames(Sorensen_data)[which(colnames(Sorensen_data) == "Com_dab")] <- "Common_dab" 

envfish_data <- Sorensen_data[,c(3:13)]
rownames(envfish_data) <- Sorensen_data[,1]
rownames(envfish_data) <- 1:nrow(envfish_data)

PCAenvfish <- prcomp(envfish_data,scale=TRUE)

Var <- PCAenvfish$sdev^2
Var.percent <- round(Var/sum(PCAenvfish$sdev)*100, 1)
Tot_var_expl1 <- Var.percent[1]+Var.percent[2]
Tot_var_expl1

loading_scores1 <- PCAenvfish$rotation[,1]
variable.scores1 <- abs(loading_scores1) ## get the magnitudes
variable_score_ranked1 <- sort(variable.scores1, decreasing=TRUE)
top_8_variables1 <- (names(variable_score_ranked1[1:8]))
PCAenvfish$rotation[top_8_variables1,1]

loading_scores2 <- PCAenvfish$rotation[,2]
variable.scores2 <- abs(loading_scores2) ## get the magnitudes
variable_score_ranked2 <- sort(variable.scores2, decreasing=TRUE)
top_8_variables2 <- (names(variable_score_ranked2[1:8]))
PCAenvfish$rotation[top_8_variables2,2]

biplot(PCAenvfish,pch=7, xlim = c(-0.33,0.40), ylim = c(-0.36,0.37), cex=c(0.5,0.9),  xlab=paste("PC1 - ", Var.percent[1], "%", sep=""), ylab = paste("PC2 - ",Var.percent[2],"%", sep="")) 
