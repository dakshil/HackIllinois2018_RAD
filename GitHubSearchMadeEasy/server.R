library(shiny)
library(lubridate)
library(httr)

shinyServer(function(input, output) {
   
  output$displayLanguagesSelectInput <- renderUI({
    languages <- read.csv('github_languages.txt', sep = '\n', header = FALSE, stringsAsFactors = FALSE)

    selectInput(
      "languageSelectInput",
      "Select Programming Languages",
      choices = languages$V1,
      selected = NULL,
      multiple = FALSE
    )
  })
  
  createFrameForRepos <- function(get_req_response) {
    req_content <- content(get_req_response, "parsed")
    
    no_of_results <- length(req_content$items)
    
    no_of_columns <- 4

    content_frame <- data.frame(matrix(nrow = no_of_results, ncol = no_of_columns))
    names(content_frame) <- c('URL', 'Title', 'Description', 'Updated_date')
    
    if (no_of_results > 0) {
      for (i in 1:no_of_results) {
        row <- c(req_content$items[[i]]$html_url, 
                 req_content$items[[i]]$title, 
                 req_content$items[[i]]$body,
                 req_content$items[[i]]$updated_at)
        content_frame[i, ] <- row
      }
      
      content_frame$Updated_date <- ymd_hms(content_frame$Updated_date)
    }
    content_frame
  }
  
  output$results <- renderTable({
    if (input$searchButton == 0)
      return()
    
    isolate({
    
      query_helpwanted <- GET(paste0('https://api.github.com/search/issues?q=', input$searchTextInput, '+label:help-wanted+language:', input$languageSelectInput, '+state:open&sort=updated&order=desc'))
      query_upforgrabs <- GET(paste0('https://api.github.com/search/issues?q=', input$searchTextInput, '+label:up-for-grabs+language:', input$languageSelectInput, '+state:open&sort=updated&order=desc'))
      query_beglang <- GET(paste0('https://api.github.com/search/issues?q=', input$searchTextInput, '+label:%20beginner+language:', input$languageSelectInput, '+state:open&sort=created&order=desc'))
      
      full_frame <- createFrameForRepos(query_helpwanted)
      full_frame <- rbind(full_frame, createFrameForRepos(query_upforgrabs))
      full_frame <- rbind(full_frame, createFrameForRepos(query_beglang))
      
      full_frame <- full_frame[order(full_frame$Updated_date), ]
      
      full_frame[, c('URL', 'Title', 'Description')]
    })
  },
  striped = TRUE,
  bordered = TRUE)
  
})
