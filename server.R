library(shiny)

# Build a linear model using mtcars dataset
mpg_model <- lm(mpg ~ wt + am, data = mtcars)

shinyServer(function(input, output) {
    output$prediction <- renderText({
        weight <- input$weight
        am <- input$am
        
        # Predict MPG based on user input
        new_data <- data.frame(wt = weight, am = as.numeric(am))
        predicted_mpg <- predict(mpg_model, newdata = new_data)
        
        paste0(round(predicted_mpg, 2), " MPG")
    })
})