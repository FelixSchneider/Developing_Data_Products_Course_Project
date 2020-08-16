library(shiny)
library(ggplot2)

shinyServer(function(input, output) {

    output$plot1 <- renderPlot({
        ggplot(swiss, aes(.data[[input$regressor]], Fertility)) + geom_point()

    })

})
