library(shiny)

shinyUI(fluidPage(

    titlePanel("Visualizing Linear Regression Models"),

    sidebarLayout(
        sidebarPanel(
            h3("How to use the App:"),
            p("In the 'Plot Regressor' select box, select the variable that you
              want as the x-axis in the 'Regression Plot'. The outcome is fixed
              as 'Fertility'"),
            selectInput("plotRegressor","Plot Regressor",choices=names(swiss)[-1]),
            p("In the 'Formula Regressor' checkbox group, check all variables
              that you want to include in your linear model. The resulting formula
              is displayed under the heading 'Regression Formula'"),
            checkboxGroupInput("formulaRegressor","Formula Regressor",choices=names(swiss)[-1])
           ,p("The 'Regression Plot' displays the line that results from fitting
              the formula (in red). As a comparison, the linear regression line
              is plotted that takes only the shown x-variable into account (in 
              blue). When you select only the plotted regressor in the 'Formula
              Regressor', both lines collapse to one.")
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
