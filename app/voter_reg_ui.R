source("voter_data.r", local = TRUE)

library(shiny)

# Defined UI for the application. Top-page style
ui <- navbarPage("US Voter Registration",
  fluid=TRUE,
  
  tabPanel("Overview", 
           htmlOutput("overviewDescription")),
  
  tabPanel("Methods & Data",
           htmlOutput("dataDescription"),
           htmlOutput("methodDescription")),
  
  navbarMenu("Results",
             # National-Level Analysis
             tabPanel("National Data",
                      htmlOutput("nationalDescription")),
             
             # Washington State Analysis
             tabPanel("Washington State Data",
                      sidebarLayout(
                        sidebarPanel(
                          selectInput("County", 
                                      label=h3("Select County"),
                                      choices = colnames(WACountyReg),
                                      selected = "TOTAL")
                        ),
                        
                        # Results are displayed here
                        # TODO: Fix the issue with spacing that occurs here
                        tabPanel("Washington Data",
                                 plotOutput("voterPlot"),
                                 htmlOutput("waDescription"))
                        
                      )
             
           )
          ),
  
  tabPanel("Conclusions",
           htmlOutput("conclusionDescription")),
  
  tabPanel("Other Info",
           htmlOutput("otherDescription"))
  
)
