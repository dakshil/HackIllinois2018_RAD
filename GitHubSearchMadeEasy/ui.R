library(shiny)

shinyUI(fluidPage(
  
  titlePanel("GitHub Search Made Easy"),
  
  sidebarLayout(
    sidebarPanel(
      textInput('searchTextInput',
                'Enter Search Query',
                placeholder = 'search query or leave blank'),
      uiOutput('displayLanguagesSelectInput')
    ),
    
    mainPanel(
    )
  )
))
