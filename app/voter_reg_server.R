source("voter_data.r", local = TRUE)

library(shiny)
library(dplyr)

# Defined server for the application
server <- function(input, output) {
  
  output$voterPlot <- renderPlot({
    
    # draws barplot
    barplot(WACountyReg[, input$County],
            main=input$County,
            ylab="Registered Voters",
            xlab="Age Groups")
  })
  
  output$nationalDescription <- renderText({
    natDes <- "National data on racial + socioeconomic participation in voting here"
  })
  
  output$waDescription <- renderText({
    waDes <- "Washington data on racial + socioeconomic participation in voting here,
    further connections to how different counties + ages relate"
  })
}