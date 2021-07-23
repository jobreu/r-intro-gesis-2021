include_picture <- 
  function(
    picture_name,
    picture_path = "./content/img/"
  ) {
    paste0(picture_path, picture_name) %>% 
      normalizePath() %>% 
      knitr::include_graphics()
  }
