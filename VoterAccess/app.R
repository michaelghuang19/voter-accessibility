#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
#Load packages
library("shiny")
library("dplyr")
install.packages("leaflet")

setwd("/Users/kevinmendez/desktop/INFO201/voter-accessibility")
#Load data
natl_vote_reg <- read.csv("/Users/kevinmendez/desktop/INFO201/voter-accessibility/data/national_voter_registration.csv",stringsAsFactors = FALSE)
natl_vote_reg
wa_age_vote_reg <- read.csv("data/wa_reg_voters_by_age.csv", stringsAsFactors = FALSE)
wa_age_vote_reg

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Voter Registration in Washington State"),
   
   # Sidebar with a slider input for number of bins 
   sidebarLayout(
      sidebarPanel(
         sliderInput("bins",
                     "Number of bins:",
                     min = 1,
                     max = 50,
                     value = 30)
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
         plotOutput("distPlot")
      )
   )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
   
   output$distPlot <- renderPlot({
      # generate bins based on input$bins from ui.R
      x    <- faithful[, 2] 
      bins <- seq(min(x), max(x), length.out = input$bins + 1)
      
      # draw the histogram with the specified number of bins
      hist(x, breaks = bins, col = 'darkgray', border = 'white')
   })
}

# Run the application 
shinyApp(ui = ui, server = server)

