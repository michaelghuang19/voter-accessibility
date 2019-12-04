library(shiny)
library(dplyr)
library(ggplot2)

# Data manipulation goes here

# Load datasets in only once.
# National-level data
natl_voter_reg <- read.csv("data/national_voter_registration.csv", stringsAsFactors = FALSE)

x <-natl_voter_reg$STATE

natl_voter_reg<- as.data.frame(t(natl_voter_reg[,-1]))
colnames(natl_voter_reg) <- x
natl_voter_reg$Total.population <- factor(row.names(natl_voter_reg))

#Percentages of national voter participation
natl_percent<-read.csv("data/natl_percent.csv", stringsAsFactors = FALSE)

k<-natl_percent$STATE

natl_percent<-as.data.frame(t(natl_percent[,-1]))
colnames(natl_percent)<-k
natl_percent$X..Registered<-factor(row.names(natl_percent))

# Washington State data
WACountyReg <- read.csv("data/wa_reg_voters_by_age.csv", header = TRUE,
                        stringsAsFactors = FALSE)
View(WACountyReg)
n <- WACountyReg$County

WACountyReg <- as.data.frame(t(WACountyReg[,-1]))
colnames(WACountyReg) <- n
WACountyReg$Age.17.24<- factor(row.names(WACountyReg))


WACountyTotal <- read.csv("data/wa_pop_by_age.csv", header = TRUE,
                          stringsAsFactors = FALSE)
View(WACountyTotal)

m <- WACountyTotal$County

WACountyTotal <- as.data.frame(t(WACountyTotal[,-1]))
colnames(WACountyTotal) <- m
WACountyTotal$Age.17.24 <- factor(row.names(WACountyTotal))