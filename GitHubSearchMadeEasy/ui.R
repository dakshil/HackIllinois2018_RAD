library(shiny)

shinyUI(fluidPage(
  
  titlePanel("GitHub Search Made Easy"),
  
  sidebarLayout(
    sidebarPanel(
      textInput('searchTextInput',
                'Enter Search Query',
                placeholder = 'search query or leave blank'),
      uiOutput('displayLanguagesSelectInput'),
      actionButton('searchButton', 'Search')
    ),
    
    mainPanel(
      wellPanel(
        tableOutput('results'),
        style = "overflow-y:scroll; max-height: 500px;
                       overflow-x:scroll; auto"
      )
    )
  )
))
