library(shiny)

shinyServer(function(input, output) {
   
  output$displayLanguagesSelectInput <- renderUI({
    languages <- read.csv('github_languages.txt', sep = '\n', header = FALSE, stringsAsFactors = FALSE)
    print(languages)
    
    selectInput(
      "languageSelectInput",
      "Select Programming Languages",
      choices = languages$V1,
      selected = NULL,
      multiple = TRUE
    )
  })
  
})
