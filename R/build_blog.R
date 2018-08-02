if (!require("pacman")) install.packages("pacman"); invisible(library(pacman))
tryCatch({
  p_load_gh("rstudio/blogdown")
  p_load("svglite", "caTools", "Cairo", "knitr")
}, warning=function(w){
  stop(conditionMessage(w))
})

blogdown::build_site()
