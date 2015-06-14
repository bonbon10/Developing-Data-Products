library(shiny)

# Load the datasets package and create a data.frame with the state level variables, along with region
library(datasets)
data(state)
dat <- as.data.frame(cbind(state.x77,state.region))

# Define the overall UI
shinyUI(
  
  # Use a fluid Bootstrap layout
  fluidPage(    
    
    # Give the page a title
    titlePanel("State Data by Region"),
    
    # Generate a row with a sidebar
    sidebarLayout(      
      
      # Define the sidebar with one input
      sidebarPanel(
        helpText("Choose a statistic to display a boxplot by region in the US"),
        selectInput("statistic", "Statistic:", 
                    choices=colnames(state.x77)),
        hr(),
        helpText("Data from U.S. Department of Commerce, Bureau of the Census (1977)")
      ),
      
      # Create a spot for the barplot
      mainPanel(
        plotOutput("statePlot")  
      )
      
    )
  )
)