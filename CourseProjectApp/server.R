library(shiny)
library(ggplot2)

shinyServer(function(input, output) {

    model <- reactive({
        fr <- input$formulaRegressor
        regressors <- ifelse(length(fr)==0,".",paste(fr,collapse="+"))
        fml <- paste("Fertility ~ ",regressors)
        fit <- lm(formula(fml),swiss)
        list(formula=fml,coef=summary(fit)$coefficients)
    })
    
    output$plot1 <- renderPlot({
        ggplot(swiss, aes(.data[[input$plotRegressor]], Fertility)) + geom_point() #+
            # geom_abline(slope=model()$fit$coef[2], intercept=model()$fit$coef[1])
    })
    
    output$formula1 <- renderText(
        model()$formula
    )
    # output$coef1 <- renderDataTable({
    output$coef1 <- renderTable(
        model()$coef, rownames=TRUE
    )

})
