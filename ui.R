library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
     
     # Application title
     titlePanel("Admissions Decision Predictor"),
     
     # Sidebar with a slider input for the number of bins
     sidebarLayout(
          sidebarPanel(
               h3("Your Academic Profile"),
               numericInput("act", 
                            label = h4("ACT Score"), 
                            value = 19, min = 0, max = 36, step = 1),
               
               numericInput("gpa", 
                            label = h4("GPA"), 
                            value = 3.0, min = 0, max = 4.0, step = 0.05),
             
               numericInput("rank", 
                            label = h4("Class Rank: your rank"), 
                            value = 1, step = 1),
               
               numericInput("total.class", 
                            label = h4("Class Rank: total students"), 
                            value = 500, step = 1),
               
               submitButton("Go")
          ),
          
          mainPanel(
               img(src = "logo.jpg", height = 125, width = 125),
               #h3("Results"),
               #h4("Your academic profile"),
               #verbatimTextOutput("inputACT"),
               #verbatimTextOutput("inputGPA"),
               #verbatimTextOutput("inputRank"),
               h3("Results"),
               verbatimTextOutput("likelihood")
          )
     )
))