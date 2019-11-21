library(shiny)

#We need to change the columns of this one
# natl_voter_reg <- read.csv("data/national_voter_registration.csv", stringsAsFactors = FALSE)
WACounty <- read.csv("data/wa_reg_voters_by_age.csv", stringsAsFactors = FALSE)

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