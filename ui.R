library(shiny)

shinyUI(fluidPage(
    titlePanel("MPG Predictor based on Car Weight & Transmission"),
    
    sidebarLayout(
        sidebarPanel(
            sliderInput("weight",
                        "Select Car Weight (1000 lbs):",
                        min = 1.5,
                        max = 5.5,
                        value = 3,
                        step = 0.1),
            
            radioButtons("am", 
                         "Transmission Type:",
                         choices = list("Automatic" = 0, "Manual" = 1),
                         selected = 0)
        ),
        
        mainPanel(
            h3("Predicted Miles Per Gallon (MPG):"),
            verbatimTextOutput("prediction"),
            hr(),
            h4("Instructions:"),
            p("Use the slider to select the car's weight in 1000 lbs."),
            p("Choose the transmission type (Automatic or Manual)."),
            p("The app will display the predicted MPG based on your selection using a model trained on the mtcars dataset.")
        )
    )
))