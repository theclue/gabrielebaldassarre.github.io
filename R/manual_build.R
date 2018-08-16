manual_build <- function(source){
  
  # fall back on "/" if baseurl is not specified
  baseurl = blogdown:::get_config2("baseurl", default = "/")
  knitr::opts_knit$set(base.url = baseurl)
  knitr::render_jekyll()  # set output hooks
  
  library(svglite)
  library(knitr)
  
  knitr::opts_chunk$set(tidy=FALSE,
                        warning=FALSE,
                        message=FALSE,
                        echo=FALSE,
                        cache=TRUE, 
                        comment=NA,
                        verbose=TRUE,
                        dev = "svglite",
                        dev.args=list(bg='transparent'))
  
  # Name the cache path and fig.path based on filename...
  knitr::opts_chunk$set(fig.path   = sprintf("assets/figures/"),
                        cache.path = sprintf("cache/"))
  
  knit(source, paste(gsub("[.][a-zA-Z]+$", "", source), "md", sep = "."), quiet = FALSE, encoding = "UTF-8")
}
