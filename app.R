#Create a simple shiny app
library(shiny)

#ui.R
ui <- fluidPage(
  #Application Title
  titlePanel("Subscribe to Shiny RApp Newsletter"),
  
  #Sidebar Layout
  sidebarLayout(
    sidebarPanel(
      h4("CREATE ACCOUNT"),
        textInput(inputId = "email", label = "EMAIL ADDRESS",value = "",placeholder="@gmail.com",width="50%"),
        passwordInput(inputId="password", label="PASSWORD", value="",placeholder="minimum 4-characters",width="50%"),
      
      h4("PERSONAL INFORMATION"),
        textInput(inputId ="lastname",label="NAME",placeholder="Last Name", width="50%"),
        textInput(inputId ="firstname",label="",placeholder="First Name", width="50%")
    ),
    mainPanel("SUMMARY")
    )
  )

#server.R
server <- function(input,output){
  
}

#Run Application
shinyApp(ui =ui, server = server)
