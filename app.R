#Create a simple shiny app
library(shiny)

#ui.R
ui <- fluidPage(
  
  #linked css
  includeCSS("styles.css"),
  
  #Application Title
  titlePanel(windowTitle = "RApp Newsletter",
    h1("Subscribe to Shiny RApp Newsletter")
       ),
  
    #Sidebar Layout
    sidebarLayout(
      #INPUT
      sidebarPanel(
        width = 3,
        h4("CREATE ACCOUNT"), 
          textInput(inputId = "email", label = "Email Address", value = "", placeholder = "@gmail.com", width = "65%"),
          passwordInput(inputId = "password", label = "Password", value = "",placeholder = "minimum 4-characters", width = "65%"),
        
        h4("PERSONAL INFORMATION"),
          #name
          textInput(inputId = "lastname", label="Last Name", placeholder = "Last Name", width = "65%"),
          textInput(inputId = "firstname", label = "First Name", placeholder = "First Name", width = "65%"),
          
          #bday        
          dateInput(inputId = "birthday", label = "Birthday", value = NULL, min = NULL, max = NULL, format = "yyyy-mm-dd", startview = NULL, weekstart = 0, language = "en",  width = "65%"),
          
          #sex
          radioButtons(inputId = "sex", label = "Sex", choices = c("Male", "Female"), width = "65%"),
        
          #maritalstatus
          #selectInput(inputId = "maritalstatus", label = "Marital Status", choices = list("Single", "Married", "Widowed", "Single Parent"), width = "65%")
          selectizeInput(inputId = "maritalstatus", label = "Marital Status", choices = list("Single", "Married", "Widowed", "Single Parent"), width = "65%", selected = NULL, multiple = TRUE, options = list(maxItems = 2)),
        
          #language
          checkboxGroupInput(inputId = "language", label = "Language", choices = list("Filipino", "English", "Others, please specify")),
        
          #numberofchildren
          numericInput(inputId = "numberofchildren", label = "Number of Children", value = 0, min = 0, max = 100, step = 1, width = "65%"),
        
          #workexperienceinyears
          sliderInput(inputId = "workexperienceinyears", label = "Work Experience in years ", min = 0, max = 50, value = NULL, step = 1, ticks = TRUE, animate = FALSE, width = "65%", post = " years"),
          
          #uploadphoto
          fileInput(inputId = "uploadphoto", label = "Upload Photo", multiple = FALSE, accept = c(".png", ".jpg", ".svg", ".gif"), width = "65%", buttonLabel = "Browse...") #placeholder = NULL
        
      ),
      
      #OUTPUT
      mainPanel(
      h4("SUMMARY"),
      textOutput("name"),
      textOutput("birthday"),
      textOutput("age"),
      
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
  output$age <- renderText(
    paste("Age: ", calcage)
  )  

  
  #agecalculation
  library(eeptools)
  age_calc(dob = as.Date('1988-09-05'), units = 'years')
}

#Run Application
shinyApp(ui =ui, server = server)
