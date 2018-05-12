library(shiny)
function(input, output, session) {
    selectedData <- reactive({
        rock[, c(input$xcol, input$ycol)]
    })
    
    clusters <- reactive({
        kmeans(selectedData(), input$clusters)
    })
    
    output$plot1 <- renderPlot({
        palette(brewer.pal(n = 8, name = 'Dark2'))
        
        par(mar = c(5.1, 4.1, 0, 1))
        plot(selectedData(),
             col = clusters()$cluster,
             pch = 20, cex = 3)
        points(clusters()$centers, pch = 3, cex = 4, lwd = 2)
    })
    
    output$text1 <- renderText({
        'Documentation: This application works on the rock data set which
        contains information about some petroleum rock samples. You can select
        two of the four variables (area, perimeter, shape or permeability),
        and the number of clusters you want to obtain (4 by default). The
        application applies to them the k-means clustering algorithm and plots
        the result. The cluster centroids are also plotted as a plus sign.'
    })
    
}