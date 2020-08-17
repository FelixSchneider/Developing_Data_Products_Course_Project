library(shiny)

shinyUI(fluidPage(

    titlePanel("Predicting Fertility from Socio-Economic Data"),

    sidebarLayout(
        sidebarPanel(
            selectInput("plotRegressor","Plot Regressor",choices=names(swiss)[-1]),
            checkboxGroupInput("formulaRegressor","Formula Regressor",choices=names(swiss)[-1])
        ),

        mainPanel(
            plotOutput("plot1")
           ,textOutput("formula1")
           ,dataTableOutput("coef1")
        )
    )
))
