library(shiny)

shinyUI(fluidPage(

    titlePanel("Predicting Fertility from Socio-Economic Data"),

    sidebarLayout(
        sidebarPanel(
            selectInput("regressor","Regressor",choices=names(swiss)[-1])
        ),

        mainPanel(
            plotOutput("plot1")
        )
    )
))
