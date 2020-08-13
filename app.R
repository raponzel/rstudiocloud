#Create a simple shiny app
library(shiny)

#ui.R
ui <- fluidPage(
  
  #linked css
  includeCSS("styles.css"),
  
  #Application Title
  titlePanel(
    h1("Subscribe to Shiny RApp Newsletter")
       ),
  
    #Sidebar Layout
    sidebarLayout(
      #INPUT
      sidebarPanel(
        h4("CREATE ACCOUNT"),
          textInput(inputId = "email", label = "Email Address", value = "", placeholder = "@gmail.com", width="50%"),
          passwordInput(inputId = "password", label = "Password", value = "",placeholder = "minimum 4-characters", width = "50%"),
        h4("PERSONAL INFORMATION"),
          
          #name
          textInput(inputId = "lastname", label="Last Name", placeholder = "Last Name", width = "50%"),
          textInput(inputId = "firstname", label = "First Name", placeholder = "First Name", width = "50%"),
          
          #bday        
          dateInput(inputId = "birthday", label = "Birthday", value = NULL, min = NULL, max = NULL, format = "yyyy-mm-dd", startview = NULL, weekstart = 0, language = "en"),
          
          #gender
          radioButtons(inputId = "gender", label = "Gender", choices = c("Male", "Female")

)  
      ),
      
      #OUTPUT
      mainPanel(
      h4("SUMMARY"),
      textOutput("name"),
      textOutput("birthday")
      )
    )
)
      
#server.R
server <- function(input,output){
  output$name <- renderText(
    paste("Name: ",input$firstname, input$lastname)
  )
  output$birthday <- renderText(
    paste("Birthday: ",input$birthday)
  )
}

#Run Application
shinyApp(ui =ui, server = server)
