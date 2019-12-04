source("voter_data.r", local = TRUE)

library(shiny)
library(dplyr)

# Defined server for the application
server <- function(input, output) {
  # National barplots
    output$voterPart <- renderPlot({
      
      ggplot(natl_voter_reg, aes(x=c("Total Population", "Registered Voters", "Total Voters", "% Registered", "% Voted"),
                                 y=natl_voter_reg[,input$STATE])) + geom_bar(stat="identity") +
                                 #geom_bar(aes(y=natl_voter_reg[,input$STATE]),stat = "identity",position ="identity",alpha=.8,fill='lightblue',color='lightblue4') +
                                 labs(title = input$STATE, y = "People (In Thousands)", x= "National Election Participation")
                                 #y=natl_voter_reg[,input$STATE])) + geom_bar(stat = "identity") +
       #labs(title = input$STATE, y = "People (In Thousands)", x= "National Election Participation")
    })
    
  # Washington barplots
  output$voterPlot <- renderPlot({
    
    ggplot(WACountyReg, aes(x=c("17-24", "25-34", "35-44", "45-54",
                                "55-64", "65+", "Grand Total"),
                            y=WACountyReg[,input$County])) + geom_bar(stat="identity") + 
      labs(title = input$County, y = "Registered Voters", x = "Age Groups")
    
  })
  
  output$overlayPlot <- renderPlot({
    ggplot(data=WACountyTotal, aes(x=c("17-24", "25-34", "35-44", "45-54",
                                       "55-64", "65+", "Grand Total"))) +
      geom_bar(aes(y=WACountyTotal[, input$County]),stat="identity",position ="identity",alpha=.8,fill='lightblue',color='lightblue4') +
      geom_bar(aes(y=WACountyReg[, input$County]),stat="identity",position ="identity",alpha=.8,fill='pink',color='red') + labs(title = input$County, y = "Reg. Voters & County Pop.", x = "Age Groups")
  })
  
  
  output$overviewDescription <- renderText({
    paste("<h3><B>Overview</B></h3>",
          "<h4>We are interested in voter registration disparities!</h4><br>",
          "<h3><B>Team members</B></h3>",
          "<h4>Anush Mughnetsyan</h4>",
          "<h4>Kevin Mendez</h4>",
          "<h4>Michael Huang</h4>",
          "<h4>Zufan Mitiku</h4><br>",
          "<h3><B>Affiliation</B></h3>",
          "<h4>INFO-201A: Technical Foundations of Informatics</h4>",
          "<h4>The Information School</h4>", 
          "<h4>University of Washington</h4>",
          "<h4>Autumn 2019</h4>")
  })
  
  output$dataDescription <- renderText({
    #dataDest <- "<h4>Description of data sets and sources here!</h4>"
    paste("<h3>Data</h3>",
          "<h4>Voter registration data is transparent because to have free and open elections,</h4>",
          "<h4>voters and campaigns should have equal access to information to engage all</h4>",
          "<h4>registered voters. The data used in this project were taken from the Washington</h4>",
          "<h4>Secretary of State's website and the United States Census Bureau. For the purposes</h4>",
          "<h4>of clarity, data points such as margin of error and percentages were filtered out.</h4> <br>")
  })
  output$methodDescription <- renderText({
    #methodDes <- "<h4>Description of data manipulation, tooling, display of charts here</h4>"
    paste("<h3>Method</h3>",
          "<h4>When inputing our data, we wanted to show how voter registration compared to the</h4>",
          "<h4>total population of the specific county in Washington state. When it comes to</h4>",
          "<h4>national registered voters, we wanted to look at how voter turnout compares.</h4>",
          "<h4>This is why we divided our columns to look at how registed voters compared to the</h4>",
          "<h4>total population of a specific state. Also, we looked at turnout by compariing how</h4>",
          "<h4>many registered voters actually voted.</h4>")
  })
  
  output$nationalDescription <- renderText({
    natDes <- "<h4>National break down of data on total population, registered voters, and voters 
              in 2018 by state by percentage and totals.</h4>"
  })
  
  # TODO: Fix the issue with spacing that occurs here
  output$waDescription <- renderText({
    waDes <- "<br><br><br><br><br><br><br><br><br>
    <h4>Washington data on voter registration compared to population broken into age brackets 
    based on counties.</h4>"
  })
  
  output$conclusionDescription <- renderText({
    conclusion <- "<h4>Insightful conclusions and future directions here!</h4>"
  })
  
  output$otherDescription <- renderText({
    paste("<h3><B>Acknowledgements</B></h3>",
          "<h4>Thanks Jeeyoung!</h4>",
          "<h3><B>References</B></h3>",
          a("Elections & Voting - WA Secretary of State,", href="https://www.sos.wa.gov/elections/"),
          a("Washington Data and Research - Office of Financial Management,", href="https://ofm.wa.gov/washington-data-research"),
          a("U.S. Census Bureau,", href="https://www.census.gov/topics/public-sector/voting/data/tables.html"),
          a("MIT Election Lab", href="https://electionlab.mit.edu/data")
          )
  })
}

# TODO: Add/replace barplot to be more effective 
# barplot(WACountyReg[,input$County],
#         # c("Ages.17.24", "Ages.25.34", "Ages.35.44", "Ages.45.54",
#                  # "Ages.55.64", "Age.65.and.over", "Grand.Total"),
#         main = input$County,
#         ylab = "Registered Voters",
#         xlab = "Age Groups")
