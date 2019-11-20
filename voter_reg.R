#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(datasets)

#Download data files
#natl_voter_reg <- read.csv("national_voter_registration.csv", stringsAsFactors = FALSE)
#natl_voter_reg
WACounty <- read.csv("wa_reg_voters_by_age.csv", stringsAsFactors = FALSE)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Voter Registration in Washington State"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            selectInput("County", "County Registered Voters:",
                        choices = colnames(WACounty)),
        ),        
        
        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("voterPlot")
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$voterPlot <- renderPlot({

        # draw the barplot with the specified number of bins
        barplot(WACounty[, input$County],
                main=input$County,
                ylab="Registered Voters",
                xlab="Age Groups")
    })
}

# Run the application 
shinyApp(ui = ui, server = server)