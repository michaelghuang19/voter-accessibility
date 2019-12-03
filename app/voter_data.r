library(shiny)
library(dplyr)
library(ggplot2)

# Data manipulation goes here

# Load datasets in only once.
# National-level data
natl_voter_reg <- read.csv("data/national_voter_registration.csv", stringsAsFactors = FALSE)
View(natl_voter_reg)

x <-natl_voter_reg$STATE

natl_voter_reg<- as.data.frame(t(natl_voter_reg[,-1]))
colnames(natl_voter_reg) <- x
###creating vectors to look at voter participation
#natl_reg <- natl_voter_reg$Registered / natl_voter_reg$Total.population
#voter_turnout <- natl_voter_reg$Voted / natl_voter_reg$Registered

# Washington State data
WACountyReg <- read.csv("data/wa_reg_voters_by_age.csv", header = TRUE,
                        stringsAsFactors = FALSE)
View(WACountyReg)
n <- WACountyReg$County

WACountyReg <- as.data.frame(t(WACountyReg[,-1]))
colnames(WACountyReg) <- n
WACountyReg$Age.17.24 <- factor(row.names(WACountyReg))


WACountyTotal <- read.csv("data/wa_pop_by_age.csv", header = TRUE,
                          stringsAsFactors = FALSE)

m <- WACountyTotal$County

WACountyTotal <- as.data.frame(t(WACountyTotal[,-1]))
colnames(WACountyTotal) <- m
WACountyTotal$Age.17.24 <- factor(row.names(WACountyTotal))