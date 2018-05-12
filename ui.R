library(shiny)
library(RColorBrewer)
pageWithSidebar(
    headerPanel('Measurements on Petroleum Rock Samples K-means Clustering'),
    sidebarPanel(
        selectInput('xcol', 'Select X Variable', names(rock)),
        selectInput('ycol', 'Select Y Variable', names(rock),
                    selected = names(rock)[[2]]),
        numericInput('clusters', 'Select Number of Clusters', 4,
                     min = 1, max = 8)
    ),
    mainPanel(
        plotOutput('plot1'),
        textOutput('text1')
    )
)