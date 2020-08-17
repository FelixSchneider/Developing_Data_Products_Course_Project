library(shiny)

shinyUI(fluidPage(

    titlePanel("Predicting Fertility from Socio-Economic Data"),

    sidebarLayout(
        sidebarPanel(
            selectInput("plotRegressor","Plot Regressor",choices=names(swiss)[-1]),
            checkboxGroupInput("formulaRegressor","Formula Regressor",choices=names(swiss)[-1])
        ),

        mainPanel(
            h3("Regression Plot")
           ,plotOutput("plot1")
           ,h3("Regression Formula")
           ,textOutput("formula1")
           ,h3("Regression Coefficients")
           ,tableOutput("coef1")
        )
    )
))
