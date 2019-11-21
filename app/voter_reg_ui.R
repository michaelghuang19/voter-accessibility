source("voter_data.r", local = TRUE)

library(shiny)

# Defined UI for the application. Top-page style
ui <- navbarPage("US Voter Registration",
  fluid=TRUE,
  
  tabPanel("Overview"),
  tabPanel("Methods & Data"),
  tabPanel("Results",
           sidebarLayout(
             sidebarPanel(
               selectInput("County", "County Registered Voters:",
                           choices = colnames(WACountyReg))
             ),
             
             # Results are displayed here
             tabsetPanel(
               tabPanel("National Data",
                        htmlOutput("nationalDescription")),
               tabPanel("Washington Data",
                        plotOutput("voterPlot"),
                        htmlOutput("waDescription"))
             )
             
           )
          ),
  
  tabPanel("Conclusions"),
  tabPanel("Other Info")
  
)
