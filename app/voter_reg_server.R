source("voter_data.r", local = TRUE)

library(shiny)
library(dplyr)

# Defined server for the application
server <- function(input, output) {
  
  # draws barplot
  output$voterPlot <- renderPlot({
    
    ggplot(WACountyReg, aes(x=c("17-24", "25-34", "35-44", "45-54",
                                "55-64", "65+", "Grand Total"),
                            y=WACountyReg[,input$County])) + geom_bar(stat="identity") + 
      labs(title = input$County, y = "Registered Voters", x = "Age Groups")
    
    # TODO: Add/replace barplot to be more effective 
    # barplot(WACountyReg[,input$County],
    #         # c("Ages.17.24", "Ages.25.34", "Ages.35.44", "Ages.45.54",
    #                  # "Ages.55.64", "Age.65.and.over", "Grand.Total"),
    #         main = input$County,
    #         ylab = "Registered Voters",
    #         xlab = "Age Groups")
  })
  
  output$overviewDescription <- renderText({
    paste("<h3><B>Overview</B></h3>",
          "<h4>We are interested in voter registration disparities!</h4><br>",
          "<h3><B>Affiliation</B></h3>",
          "<h4>INFO-201A: Technical Foundations of Informatics</h4>",
          "<h4>The Information School</h4>", 
          "<h4>University of Washington</h4>",
          "<h4>Autumn 2019</h4>")
  })
  
  output$dataDescription <- renderText({
    dataDest <- "<h4>Description of data sets and sources here!</h4>"
  })
  
  output$methodDescription <- renderText({
    methodDes <- "<h4>Description of data manipulation, tooling, display of charts here</h4>"
  })
  
  output$nationalDescription <- renderText({
    natDes <- "<h4>National data on racial + socioeconomic participation in voting here</h4>"
  })
  
  # TODO: Fix the issue with spacing that occurs here
  output$waDescription <- renderText({
    waDes <- "<br><br><br><br><br><br><br><br><br>
    <h4>Washington data on racial + socioeconomic participation in voting here,
    further connections to how different counties + ages relate</h4>"
  })
  
  output$conclusionDescription <- renderText({
    conclusion <- "<h4>Insightful conclusions and future directions here!</h4>"
  })
  
  output$otherDescription <- renderText({
    paste("<h3><B>Acknowledgements</B></h3>",
          "<h4>Thanks Jeeyoung!</h4>",
          "<h3><B>References</B></h3>",
          "<h4>The internet</h4>")
  })
}