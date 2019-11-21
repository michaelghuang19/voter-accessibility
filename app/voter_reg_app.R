# Sourcing the other parts of the app
source("voter_reg_server.R", local = TRUE)
source("voter_reg_ui.R", local = TRUE)

library(shiny)
library(datasets)
library(dplyr)

# Run the application 
shinyApp(ui = ui, server = server)