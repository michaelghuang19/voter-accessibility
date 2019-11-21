library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(
  
  # Application title
  titlePanel("Voter Registration in Washington State"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      selectInput("County", "County Registered Voters:",
                  choices = colnames(WACounty))
    ),        
    
    # Show a plot of the generated distribution
    mainPanel(
      tabsetPanel(
        tabPanel("Washington Data", plotOutput("voterPlot")),
        tabPanel("National Data"),
        tabPanel("Conclusions")
      )
    )
  ),
  
  tabPanel("National Level Registration")
)