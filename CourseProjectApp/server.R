library(shiny)
library(ggplot2)

shinyServer(function(input, output) {

    formula <- reactive({
        regressors <- paste(input$formulaRegressor,collapse="+")
        paste("Fertility ~ ",regressors)
    })
    # model <- lm(formula,swiss)
    
    output$plot1 <- renderPlot({
        ggplot(swiss, aes(.data[[input$plotRegressor]], Fertility)) + geom_point()

    })
    output$formula1 <- renderText({
        formula()
    })

})
