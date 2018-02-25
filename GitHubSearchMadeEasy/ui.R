library(shiny)
library(DT)

shinyUI(fluidPage(
  
  titlePanel("GitHub Search Made Easy"),
  
  sidebarLayout(
    sidebarPanel(
      textInput('searchTextInput',
                'Enter Search Query',
                placeholder = 'search query or leave blank'),
      uiOutput('displayLanguagesSelectInput'),
      actionButton('searchButton', 'Search'),
      tags$div(
        tags$br(),
        p("Open Source doesn't have to be scary. Use this tool to
          find projects which need Your HELP and are also friendly
          to first timers and beginners. Feel free to explore the IRC and 
          Slack channels of these projects to get help and an idea
          of the community maintaining it."), 
        
        p("Start you journey into
          Open Source by using this Open Source tool to discover Open
          Source. You can also contribute to this project!"),
        tags$br(),
        p("Please make sure you understand the license of the project 
          you select."),
        tags$a(href="https://github.com/blog/1530-choosing-an-open-source-license","More Info")
      )
    ),
    
    mainPanel(
      wellPanel(
        DT::dataTableOutput('results'),
        style = "overflow-x:scroll; auto"
      )
    )
  )
))
