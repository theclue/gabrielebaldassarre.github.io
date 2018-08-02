local({
  # fall back on "/" if baseurl is not specified
  baseurl = blogdown:::get_config2("baseurl", default = "/")
  knitr::opts_knit$set(base.url = baseurl)
  knitr::render_jekyll()  # set output hooks
  
  # input/output filenames as two arguments to Rscript
  a = commandArgs(TRUE)
  d = gsub("^_|[.][a-zA-Z]+$", "", a[1])
  
  library(svglite)
  
  knitr::opts_chunk$set(tidy=FALSE,
                        warning=FALSE,
                        message=FALSE,
                        cache=TRUE, 
                        comment=NA,
                        verbose=TRUE,
                        dev = "svglite")
  
  # Name the cache path and fig.path based on filename...
  knitr::opts_chunk$set(fig.path = paste("assets/figures/",
                                         gsub(".Rmd", "", knitr:::knit_concord$get('infile')),
                                         "-", sep=""),
                        cache.path = paste("cache/",
                                           gsub(".Rmd", "", knitr:::knit_concord$get('infile') ), 
                                           "/", sep=""))

  knitr::knit(
    a[1], a[2], quiet = TRUE, encoding = "UTF-8",
    envir = globalenv()
  )
})
