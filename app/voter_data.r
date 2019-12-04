library(shiny)
library(dplyr)
library(ggplot2)

# Data manipulation goes here

# Load datasets in only once.
# National-level data
natl_voter_reg <- read.csv("data/national_voter_registration.csv", stringsAsFactors = FALSE)
View(natl_voter_reg)

x <-natl_voter_reg$STATE

#creating vectors to look at total voter registration
#natl_voter_reg["natl_reg"] <- NA
#natl_voter_reg$natl_reg <- natl_voter_reg$Registered / natl_voter_reg$Total.population
#natl_voter_reg$natl_reg
#creating vector to look at voter turn out
#natl_voter_reg["voter_turnout"] <- NA
#natl_voter_reg$voter_turnout <- natl_voter_reg$Voted / natl_voter_reg$Registered
#natl_voter_reg$voter_turnout
#write.csv(natl_voter_reg, "voter_part_rates.csv", row.names = FALSE)


natl_voter_reg<- as.data.frame(t(natl_voter_reg[,-1]))
colnames(natl_voter_reg) <- x
natl_voter_reg$Total.population <- factor(row.names(natl_voter_reg))


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