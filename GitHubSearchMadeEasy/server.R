library(shiny)

shinyServer(function(input, output) {
   
  output$displayLanguagesSelectInput <- renderUI({
    languages <- read.csv('github_languages.txt', sep = '\n', header = FALSE, stringsAsFactors = FALSE)

    selectInput(
      "languageSelectInput",
      "Select Programming Languages",
      choices = languages$V1,
      selected = NULL,
      multiple = TRUE
    )
  })
  
  createFrameForRepos <- function(get_req_response) {
    req_content <- content(get_req_response, "parsed")
    
    no_of_results <- length(req_content$items)
    
    no_of_columns <- 3

    content_frame <- data.frame(matrix(nrow = no_of_results, ncol = no_of_columns))
    names(content_frame) <- c('URL', 'Title', 'Description')
    
    for (i in 1:no_of_results) {
      row <- c(req_content$items[[i]]$html_url, 
               req_content$items[[i]]$title, 
               req_content$items[[i]]$body)
      content_frame[i, ] <- row
    }
    
    content_frame
  }
  
})
