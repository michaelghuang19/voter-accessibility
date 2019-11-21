library(shiny)
library(dplyr)
library(ggplot2)

# Data manipulation goes here

# Load datasets in only once.
# TODO: Manipulate national-level data
# natl_voter_reg <- read.csv("data/national_voter_registration.csv", stringsAsFactors = FALSE)
WACountyReg <- read.csv("data/wa_reg_voters_by_age.csv", header = TRUE,
                        stringsAsFactors = FALSE)

n <- WACountyReg$County

WACountyReg <- as.data.frame(t(WACountyReg[,-1]))
colnames(WACountyReg) <- n
WACountyReg$Age.17.24 <- factor(row.names(WACountyReg))

# View(WACountyReg)



WACountyTotal <- read.csv("data/wa_pop_by_age.csv", header = TRUE,
                          stringsAsFactors = FALSE)

m <- WACountyTotal$County

WACountyTotal <- as.data.frame(t(WACountyTotal[,-1]))
colnames(WACountyTotal) <- m
WACountyTotal$Age.17.24 <- factor(row.names(WACountyTotal))

  
  