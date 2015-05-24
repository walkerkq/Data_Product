library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
     
     # Application title
     titlePanel("Admissions Decision Predictor"),
     
     # Sidebar with a slider input for the number of bins
     sidebarLayout(
          sidebarPanel(
               img(src = "logo.jpg", height = 200, width = 200),
               h3("Directions"),
               p("Here at Faber College, we are beyond excited to welcome 2,450 first year students for the 2016 Fall Term. We receive more than 8,000 applications each year resulting in high competition. You may use this predictor to help determine if your academic credentials fall within our typical profile."), 
               p("Of course, admissions decisions are based on a rich multitude of factors, including extracurricular activities, your essay and recommendations. This predcitor is not your admissions decision - please use it only to set goals for your senior year of high school.")
          ),
          
          mainPanel(
               h3("Your Academic Profile"),
               numericInput("act", 
                            label = h4("ACT Score"), 
                            value = 30, min = 0, max = 36, step = 1),
               
               numericInput("gpa", 
                            label = h4("GPA"), 
                            value = 3.5, min = 0, max = 4.0, step = 0.05),
               
               numericInput("rank", 
                            label = h4("Class Rank: your rank"), 
                            value = 100, step = 1),
               
               numericInput("total.class", 
                            label = h4("Class Rank: total students"), 
                            value = 500, step = 1),
               
               submitButton("Go"),
               
               h3("Results"),
               verbatimTextOutput("likelihood")
               
          )
     )
))