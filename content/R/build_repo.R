library(dplyr)

# TOGGLES
build_all      = FALSE
sessions_home  = "./content/sessions/"
exercises_home = "./content/exercises/"

# SESSIONS ---------------------------------------------------------------------

# Load 'index' of files if it exists
if(file.exists(glue::glue(sessions_home, "sessions_list.csv"))) {
  sessions_list_previous <- 
    readr::read_csv(
      glue::glue(sessions_home, "sessions_list.csv")
    ) %>% 
    dplyr::mutate(
      previous = current
    ) %>% 
    dplyr::select(-current)
}

# Create list of current files in folder
sessions_list_current <-
  tibble::tibble(
    session_name = 
      list.files(sessions_home, recursive = FALSE) %>%
      .[stringr::str_detect(., "Rmd")]
  ) %>% 
  dplyr::mutate(
    current = tools::md5sum(paste0(sessions_home, session_name))
  )

# join lists and update existing one if it exists; otherwise create it
if (file.exists(glue::glue(sessions_home, "sessions_list.csv"))) {
  sessions_list <-
    dplyr::full_join(
      sessions_list_previous,
      sessions_list_current
    ) %>% 
    dplyr::mutate(
      previous = ifelse(is.na(previous), "...", previous)
    ) %>% 
    dplyr::filter(!is.na(current))
  
  readr::write_csv(
    sessions_list, 
    glue::glue(sessions_home, "sessions_list.csv")
  )
} else {
  sessions_list <-
    sessions_list_current %>% 
    dplyr::mutate(previous = current) %>% 
    dplyr::select(
      session_name, previous, current
    )
  
  readr::write_csv(
    sessions_list_current, 
    glue::glue(sessions_home, "sessions_list.csv")
  )
}

# build files that changed
for (i in 1:nrow(sessions_list)) {
  
  if (isFALSE(sessions_list$previous[i] == sessions_list$current[i]) | isTRUE(build_all)) {
    
    rmarkdown::render(
      glue::glue(sessions_home, sessions_list$session_name[i]),
      knit_root_dir = getwd()
    )
    
    html_file <- 
      list.files(sessions_home) %>%
      .[stringr::str_detect(., "html")]
    
    file.copy(
      glue::glue(sessions_home, html_file),
      glue::glue("./slides/", html_file),
      overwrite = TRUE
    )
    
    unlink(glue::glue(sessions_home, html_file))
  }
}



# EXERCISES --------------------------------------------------------------------

# Load 'index' of files if it exists
if(file.exists(glue::glue(exercises_home, "exercises_list.csv"))) {
  exercises_list_previous <- 
    readr::read_csv(
      glue::glue(exercises_home, "exercises_list.csv")
    ) %>% 
    dplyr::mutate(
      previous = current
    ) %>% 
    dplyr::select(-current)
}

# Create list of current files in folder
exercises_list_current <-
  tibble::tibble(
    excercise_name = 
      list.files(exercises_home, recursive = FALSE) %>%
      .[stringr::str_detect(., "Rmd")]
  ) %>% 
  dplyr::mutate(
    current = tools::md5sum(paste0(exercises_home, excercise_name))
  )

# join lists and update existing one if it exists; otherwise create it
if (file.exists(glue::glue(exercises_home, "exercises_list.csv"))) {
  exercises_list <-
    dplyr::full_join(
      exercises_list_previous,
      exercises_list_current
    ) %>% 
    dplyr::mutate(
      previous = ifelse(is.na(previous), "...", previous)
    ) %>% 
    dplyr::filter(!is.na(current))
  
  readr::write_csv(
    exercises_list, 
    glue::glue(exercises_home, "exercises_list.csv")
  )
} else {
  exercises_list <-
    exercises_list_current %>% 
    dplyr::mutate(previous = current) %>% 
    dplyr::select(
      excercise_name, previous, current
    )
  
  readr::write_csv(
    exercises_list_current, 
    glue::glue(exercises_home, "exercises_list.csv")
  )
}

# build files that changed
for (i in 1:nrow(exercises_list)) {
  
  if (isFALSE(exercises_list$previous[i] == exercises_list$current[i]) | isTRUE(build_all)) {
    
    # exercise
    rmarkdown::render(
      glue::glue("./content/exercises/", exercises_list$excercise_name[i]),
      output_format = 
        unilur::tutorial_html(suffix = ""),
      knit_root_dir = getwd()
    )
    
    html_file <-
      list.files("./content/exercises/") %>%
      .[stringr::str_detect(., "html")]
    
    file.copy(
      glue::glue("./content/exercises/", html_file),
      glue::glue("./exercises/", html_file),
      overwrite = TRUE
    )
    
    unlink(glue::glue("./content/exercises/", html_file))
    
    # solution
    rmarkdown::render(
      glue::glue("./content/exercises/", exercises_list$excercise_name[i]),
      output_format = 
        unilur::tutorial_html_solution(suffix = ""),
      knit_root_dir = getwd()
    )
    
    html_file <-
      list.files("./content/exercises/") %>%
      .[stringr::str_detect(., "html")]
    
    file.copy(
      glue::glue("./content/exercises/", html_file),
      glue::glue("./solutions/", html_file),
      overwrite = TRUE
    )
    
    unlink(glue::glue("./content/exercises/", html_file))
  }
}
