#
# 
#

library(shiny)
library(dplyr)
library(datasets)
shinyServer(function(input, output) {
        data(trees)
        int <- cut(trees$Height,
                   breaks = c(60, 70, 80, 90),
                   label = c(1, 2, 3))
        df <- data.frame(trees, int)
        
        newdf <-reactive({ filter(df, int == input$select)
        })
        fit <- reactive({lm(Volume ~ Girth, data = newdf())
        })
        pred <- reactive({
                predict(fit(), newdata = data.frame(Girth = input$newGirth))
        })
        
        output$thePlot <- renderPlot({    
                plot(Volume ~ Girth, newdf(), xlim = c(5,25), ylim = c(0, 80))
                abline(fit(), lwd = 2, col = "red")
                points(
                        input$newGirth,
                        pred(),
                        col = "green",
                        pch = 24,
                        lwd = 16
                )
        })
        output$predict <- renderText({
                pred()
        })
        
})
