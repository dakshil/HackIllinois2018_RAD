library(shiny)
library(lubridate)
library(httr)
library(DT)
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
  
  output$results <- DT::renderDataTable({
    if (input$searchButton == 0)
      return()
    
    isolate({
      if(input$languageSelectInput == "Any") {
        query_helpwanted <- GET(gsub(" ","%20",paste0('https://api.github.com/search/issues?q=', input$searchTextInput, '+label:help-wanted+language:', input$languageSelectInput, '+state:open&sort=updated&order=desc')))
        query_upforgrabs <- GET(gsub(" ","%20",paste0('https://api.github.com/search/issues?q=', input$searchTextInput, '+label:up-for-grabs+language:', input$languageSelectInput, '+state:open&sort=updated&order=desc')))
        query_beglang <- GET(gsub(" ","%20",paste0('https://api.github.com/search/issues?q=', input$searchTextInput, '+label:%20beginner+language:', input$languageSelectInput, '+state:open&sort=updated&order=desc')))
        query_goodfirstissue <- GET(gsub(" ","%20",paste0('https://api.github.com/search/issues?q=', input$searchTextInput, '+label:%20good%20first%20issue+language:', input$languageSelectInput, '+state:open&sort=updated&order=desc')))
      } else {
        query_helpwanted <- GET(gsub(" ","%20",paste0('https://api.github.com/search/issues?q=', input$searchTextInput, '+label:help-wanted+state:open&sort=updated&order=desc')))
        query_upforgrabs <- GET(gsub(" ","%20",paste0('https://api.github.com/search/issues?q=', input$searchTextInput, '+label:up-for-grabs+state:open&sort=updated&order=desc')))
        query_beglang <- GET(gsub(" ","%20",paste0('https://api.github.com/search/issues?q=', input$searchTextInput, '+label:%20beginner+state:open&sort=updated&order=desc')))
        query_goodfirstissue <- GET(gsub(" ","%20",paste0('https://api.github.com/search/issues?q=', input$searchTextInput, '+label:%20good%20first%20issue+state:open&sort=updated&order=desc')))
      }
      
      full_frame <- createFrameForRepos(query_helpwanted)
      full_frame <- rbind(full_frame, createFrameForRepos(query_upforgrabs))
      full_frame <- rbind(full_frame, createFrameForRepos(query_beglang))
      full_frame <- rbind(full_frame, createFrameForRepos(query_goodfirstissue))
      full_frame$URL <- sapply(full_frame$URL,FUN = function(x) paste0("<a href='",x,"'>",x,"</a>"))
      
      full_frame <- full_frame[order(full_frame$Updated_date), ]
      full_frame[, c('URL', 'Title', 'Description')]
    }) 
  },
      escape=FALSE
  )
  
})
