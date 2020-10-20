if (!require("pacman")) install.packages("pacman"); invisible(library(pacman))
tryCatch({
  p_load("blogdown", "svglite", "caTools", "Cairo", "knitr", "rprojroot")
}, warning=function(w){
  stop(conditionMessage(w))
})

setwd(find_root_file(criterion = is_git_root))

blogdown::build_site(run_hugo = FALSE)
