library(shiny)
library(ggplot2)

# Load the datasets package and create a data.frame with the state level variables, along with region
library(datasets)
data(state)
dat <- as.data.frame(cbind(state.x77,state.region))

# Define a server for the Shiny app
shinyServer(function(input, output) {
  
  # Create a plot
  output$statePlot <- renderPlot({
    
    # Specify data frame to use in plot code
    dataframe <- data.frame(region = dat$state.region, var = dat[[input$statistic]])
    # Labels for the y-axis
    ylabel <- c("People","U.S. Dollars","Percent of Population","Years","Rate per 100,000","Percent","Days","Square Miles")
    true_index <- colnames(state.x77)==input$statistic
    i <- which(true_index)
    
    # Create a boxplot
    ggplot(dataframe, aes(factor(region),var)) + 
      geom_boxplot(aes(fill = factor(region))) + 
      scale_x_discrete(labels=c("Northeast", "South", "North Central", "West")) + 
      scale_fill_manual(values=c("cyan", "yellow1", "green1", "magenta2"),                                                                                                                                                                                labels=c("Northeast", "South", "North Central", "West"),                                                                                                                                                                               name="Region") +
      ggtitle(input$statistic) +
      theme_bw() +
      xlab("Region") +
      ylab(ylabel[i])
  })
})