#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

source("voter_reg_server.R", local = TRUE)
source("voter_reg_ui.R", local = TRUE)

library(shiny)
library(datasets)
library(xlsx)
library(dplyr)

# Run the application 
shinyApp(ui = ui, server = server)