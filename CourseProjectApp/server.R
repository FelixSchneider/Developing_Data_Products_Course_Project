library(shiny)
library(ggplot2)

shinyServer(function(input, output) {

    model <- reactive({
        fr <- input$formulaRegressor
        regressors <- ifelse(length(fr)==0,".",paste(fr,collapse="+"))
        fml <- paste("Fertility ~ ",regressors)
        fit <- lm(fml,swiss)
        list(formula=fml,coef=summary(fit)$coefficients)
    })
    
    output$plot1 <- renderPlot({
        pr <- input$plotRegressor
        g <- ggplot(swiss, aes(.data[[pr]], Fertility)) + geom_point()
        if (pr %in% rownames(model()$coef)) {
               g + geom_abline(slope=model()$coef[{{pr}},"Estimate"],
                               intercept=model()$coef["(Intercept)","Estimate"])
        } else {
               g
        }
    })
    
    output$formula1 <- renderText(model()$formula)
    output$coef1 <- renderTable(model()$coef, rownames=TRUE)

})
