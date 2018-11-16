#
#
#

library(shiny)
shinyUI(fluidPage(
        titlePanel("Predicting the Valume of Black Cherry Trees"),
        tabsetPanel(
                tabPanel(
                        title = "Plot",
                        sidebarLayout(
                                sidebarPanel(
                                        selectInput(
                                                "select",
                                                "Select the Height of the Trees",
                                                choices = c(
                                                        "60 - 70 m" = 1,
                                                        "70 - 80 m" = 2,
                                                        "80 - 90 m" = 3
                                                ),
                                                selectize = FALSE
                                        ),
                                        sliderInput(
                                                "newGirth",
                                                "Pich Girth of the Tree",
                                                min = 5,
                                                max = 25,
                                                value = 10
                                        )
                                ),
                                mainPanel(
                                        h3("Graph of the Regression Line and the Predicted Value"),
                                        plotOutput("thePlot"),
                                        h5("The predicted Volume is:"),
                                        textOutput("predict")
                                )
                        )
                ),
                tabPanel(title = "About the application",
                         mainPanel(
                                 h3("What the application does"),
                                 h4(
                                         "This application uses the dataset 'trees' from the package 'datasets' to predict the volume of Black Cherry Trres.
                                         In order to get better predictions the data is devided into 3 groups depending on the height: 60-70 m, 70-80 m, and 80-90 m.
                                         Then a respective linear regression model is fited for the selected group and a prediction of volume by the girth of a tree is showed."
                                 ),
                                 h3("How to use the application"),
                                 h4(
                                         "You should select a group from the menu and a value of the girth using the slider.
                                         The plot shows the respective regression line - the red line, and the green trialgle points the prediction."
                                 )
                         ))
                
        )))
