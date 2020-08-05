#Create a simple shiny app
library(shiny)

#ui.R
ui <- fluidPage(
  #Application Title
  titlePanel("Subscribe to Shiny RApp Newsletter"),
  
  #Sidebar panel 
  sidebarLayout(
    sidebarPanel("CREATE ACCOUNT"),
    mainPanel("SUMMARY")
    )
  )

#server.R
server <- function(input,output){
  
}

#Run Application
shinyApp(ui =ui, server = server)
