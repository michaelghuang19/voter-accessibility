source("voter_data.r", local = TRUE)

library(shiny)
library(dplyr)

# Defined server for the application
server <- function(input, output) {
  # National barplots
    output$voterPart <- renderPlot({
      
      ggplot(natl_voter_reg, aes(x=c("Total Population", "Registered Voters", "Total Voters"),
                                 y=natl_voter_reg[,input$STATE])) + geom_bar(stat="identity") +
                                 labs(title = input$STATE, y = "People (In Thousands)", x= "National Election Participation")
    })
    output$percentPlot <-renderPlot({
      
      ggplot(natl_percent, aes(x=c("% Registered", "% Voted"),
                               y=natl_percent[, input$STATE]))+geom_bar(stat = "identity")+
                               labs(title = input$STATE, y="Percent",x="Participation Measures")
    })
    
  # Washington barplots
  output$voterPlot <- renderPlot({
    
    ggplot(WACountyReg, aes(x=c("17-24", "25-34", "35-44", "45-54",
                                "55-64", "65+"),
                            y=WACountyReg[,input$County])) + geom_bar(stat="identity") + 
      labs(title = input$County, y = "Registered Voters", x = "Age Groups")
    
  })
  
  output$overlayPlot <- renderPlot({
    ggplot(data=WACountyTotal, aes(x=c("17-24", "25-34", "35-44", "45-54",
                                       "55-64", "65+"))) +
      geom_bar(aes(y=WACountyTotal[, input$County]),stat="identity",position ="identity",alpha=.8,fill='lightblue',color='lightblue4') +
      geom_bar(aes(y=WACountyReg[, input$County]),stat="identity",position ="identity",alpha=.8,fill='pink',color='red') + labs(title = input$County, y = "Reg. Voters & County Pop.", x = "Age Groups")
  })
  
  
  output$overviewDescription <- renderText({
    paste("<h3><B>Overview</B></h3>",
          "<h4>The issue we plan on investigating is the lack of participation in elections 
          and specifically compare voter participation among states and various age groups. 
          We believe that everyone living in the states, such as taxpayers, are stakeholders 
          in their democracy because whoever is elected will play a large role in laws and 
          policies that may or may not be passed that can affect our daily lives. Specific 
          direct stakeholders include voting citizens who have a direct involvement and impact 
          on elections by voting, while indirect stakeholders include any person living in the 
          United States, especially those that use government services, that do not vote. In 
          addition, people that are apart of marginalized communities are heavily impacted 
          because when these groups are underrepresented or don’t exercise their right to vote, 
          people who are elected into office generally don’t have diverse opinions or 
          backgrounds.</h4><br>",
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
          "<h4>Voter registration data is transparent because to have free and open elections,
          voters and campaigns should have equal access to information to engage all
          registered voters. The data used in this project were taken from the Washington
          Secretary of State's website and the United States Census Bureau. For the purposes
          of clarity, data points such as margin of error and percentages were filtered out. 
          Find our direct sources in our References section.</h4><br>")
  })
  output$methodDescription <- renderText({
    paste("<h3>Method</h3>",
          "<h4>When inputing our data, we wanted to show how voter registration compared to the
          total population of the specific county in Washington state. When it comes to
          national registered voters, we wanted to look at how voter turnout compares.
          This is why we divided our columns to look at how registed voters compared to the
          total population of a specific state. Also, we looked at turnout by compariing how
          many registered voters actually voted.</h4>")
  })
  
  output$nationalDescription <- renderText({
    natDes <- "<h4>National break down of data on total population, registered voters, and voters 
              in 2018 by state by percentage and totals.</h4>"
  })
  
  output$waDescription <- renderText({
    waDes <- "<br><br><br><br><br><br><br><br><br>
    <h4>Washington data on voter registration compared to population broken into age brackets 
    based on counties.</h4>"
  })
  
  output$conclusionDescription <- renderText({
    conclusion <- paste("<h3>Conclusion</h3>",
                        "<h4>With the 2020 election coming up and multiple senate and all congressional seats up
                        for election next year, engaging voters is critically important. Our hopes with this 
                        project was to help inform voters, non-partisan organizations and campaigns on which 
                        states can increase their voter registration rates. An average high based on our 
                        national data showed that earlier primary voting states and traditionally more comptetitive
                        states had higher rates of voter registration. Additionally, actual voter participation
                        was always greater than registration rates. This means that voters are far more likely to 
                        vote if they are already registered. This information could also help states that are 
                        considering automatic registration because it will increase registration rates and 
                        participation.</h4>",
                        "<h4>For example, one the states that will be considering automatic voter registration is
                        Washington state. There are many differences among registration rates between counties. 
                        While the population may be different depending on the counties. The registration rates can 
                        help target citizens when it comes to voter registration drives to effectively gain a 
                        representative electorate of the county.</h4>",
                        "<h4>From our investigation, we learned that in 2018 there wasn't as large of a percentile
                        gap for voter participation. We think that this could be influenced by increased
                        amounts of petition for voter participation. In addition, the percentiles may
                        seem super high, but we chose to only include total citizen population in stead of
                        the total racial population because we wanted to only account for those that had
                        a right to vote.</h4>")
  })
  
  output$otherDescription <- renderText({
    paste("<h3><B>Acknowledgements</B></h3>",
          "<h4>Thanks to David Hendry and Jeeyoung Kim for their support!</h4>",
          "<h3><B>References</B></h3>",
          a("Elections & Voting - WA Secretary of State,", href="https://www.sos.wa.gov/elections/"),
          a("Washington Data and Research - Office of Financial Management,", href="https://ofm.wa.gov/washington-data-research"),
          a("U.S. Census Bureau,", href="https://www.census.gov/topics/public-sector/voting/data/tables.html"),
          a("MIT Election Lab", href="https://electionlab.mit.edu/data")
          )
  })
}