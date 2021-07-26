course_content_1 <-
  tibble::tribble(
    ~Day, ~Time, ~Topic,
    "Monday", "10:30 - 11:30", "Getting Started with R and RStudio",
    "Monday", "11:30 - 11:45", "Break",
    "Monday", "11:45 - 12:45", "Getting Started with R and RStudio",
    "Monday", "12:45 - 13:45", "Lunch Break",
    "Monday", "13:45 - 15:00", "Data Import & Export",
    "Monday", "15:00 - 15:15", "Break",
    "Monday", "15:15 - 16:30", "Data Import & Export",
  ) %>% 
  knitr::kable() %>% 
  kableExtra::kable_styling() %>% 
  kableExtra::column_spec(1, color = "gray") %>% 
  kableExtra::column_spec(2, color = "gray") %>% 
  kableExtra::column_spec(3, bold = TRUE) %>% 
  kableExtra::row_spec(2, color = "gray") %>% 
  kableExtra::row_spec(4, color = "gray") %>%
  kableExtra::row_spec(6, color = "gray")

course_content_2 <-
  tibble::tribble(
    ~Day, ~Time, ~Topic,
    "Tuesday", "10:00 - 11:15", "Data Wrangling - Basics",
    "Tuesday", "11:15 - 11:30", "Break",
    "Tuesday", "11:30 - 12:45", "Data Wrangling - Basics",
    "Tuesday", "12:45 - 13:45", "Lunch Break",
    "Tuesday", "13:45 - 15:00", "Data Wrangling - Advanced",
    "Tuesday", "15:00 - 15:15", "Break",
    "Tuesday", "15:15 - 16:30", "Data Wrangling - Advanced",
    "Wednesday", "10:00 - 11:15", "Exploratory Data Analysis",
    "Wednesday", "11:15 - 11:30", "Break",
    "Wednesday", "11:30 - 12:45", "Exploratory Data Analysis",
    "Wednesday", "12:45 - 13:45", "Lunch Break",
    "Wednesday", "13:45 - 15:00", "Data Visualization - Part 1",
    "Wednesday", "15:00 - 15:15", "Break",
    "Wednesday", "15:15 - 16:30", "Data Visualization - Part 1"
  ) %>% 
  knitr::kable() %>% 
  kableExtra::kable_styling() %>% 
  kableExtra::column_spec(1, color = "gray") %>% 
  kableExtra::column_spec(2, color = "gray") %>% 
  kableExtra::column_spec(3, bold = TRUE) %>% 
  kableExtra::row_spec(2, color = "gray") %>% 
  kableExtra::row_spec(4, color = "gray") %>%
  kableExtra::row_spec(6, color = "gray") %>% 
  kableExtra::row_spec(9, color = "gray") %>% 
  kableExtra::row_spec(11, color = "gray") %>%
  kableExtra::row_spec(13, color = "gray") %>% 
  kableExtra::row_spec

course_content_3 <-
  tibble::tribble(
    ~Day, ~Time, ~Topic,
    "Thursday", "10:00 - 11:15", "Confirmatory Data Analysis",
    "Thursday", "11:15 - 11:30", "Break",
    "Thursday", "11:30 - 12:45", "Confirmatory Data Analysis",
    "Thursday", "12:45 - 13:45", "Lunch Break",
    "Thursday", "13:45 - 15:00", "Data Visualization - Part 2",
    "Thursday", "15:00 - 15:15", "Break",
    "Thursday", "15:15 - 16:30", "Data Visualization - Part 2",
    "Friday", "10:00 - 11:15", "Reporting with R Markdown",
    "Friday", "11:15 - 11:30", "Break",
    "Friday", "11:30 - 12:45", "Reporting with R Markdown",
    "Friday", "12:45 - 13:45", "Lunch Break",
    "Friday", "13:45 - 15:00", "Advanced Use of R, Outlook, Q&A",
    "Friday", "15:00 - 15:15", "Break",
    "Friday", "15:15 - 16:30", "Advanced Use of R, Outlook, Q&A"
  ) %>% 
  knitr::kable() %>% 
  kableExtra::kable_styling() %>% 
  kableExtra::column_spec(1, color = "gray") %>% 
  kableExtra::column_spec(2, color = "gray") %>% 
  kableExtra::column_spec(3, bold = TRUE) %>% 
  kableExtra::row_spec(2, color = "gray") %>% 
  kableExtra::row_spec(4, color = "gray") %>%
  kableExtra::row_spec(6, color = "gray") %>% 
  kableExtra::row_spec(9, color = "gray") %>% 
  kableExtra::row_spec(11, color = "gray") %>%
  kableExtra::row_spec(13, color = "gray") %>% 
  kableExtra::row_spec(7, extra_css = "border-bottom: 1px solid")