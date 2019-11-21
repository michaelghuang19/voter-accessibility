library(shiny)
library(dplyr)

# Data manipulation goes here

# Load datasets in only once.
# TODO: Manipulate national-level data
# natl_voter_reg <- read.csv("data/national_voter_registration.csv", stringsAsFactors = FALSE)
WACountyReg <- read.csv("data/wa_reg_voters_by_age.csv", stringsAsFactors = FALSE)
WACountyTotal <- read.csv("data/wa_pop_by_age.csv", stringsAsFactors = FALSE)