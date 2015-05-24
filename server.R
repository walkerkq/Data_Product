library(shiny)
predict.decision <- function(act, gpa, rank) {
     admission <- read.csv("data/sample_admission_data.csv", stringsAsFactors=FALSE)
     fit <- lm(Admission.Decision ~ . -1, admission)
     sample <- data.frame(ACT=c(act), GPA=c(gpa), Class.Rank=c(rank))
     prediction <- predict(fit, sample)
     print(paste("Based on your academic accomplishments, you have a ", round(prediction[[1]], 2), "% chance of being accepted.", sep=""))
}


# Define server logic required to draw a histogram
shinyServer(function(input, output) {
     
     output$likelihood <- renderPrint({
          rank <- input$rank/input$total.class
          predict.decision(input$act, input$gpa, rank)
          })
     
     output$inputACT <- renderPrint({
          paste("ACT:", input$act)
     })
     
     output$inputGPA <- renderPrint({
          paste("GPA:", input$gpa)
     })
     
     output$inputRank <- renderPrint({
          paste("Class Rank:", input$rank, "out of", input$total.class)
     })
     
})