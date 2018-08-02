local({
  # fall back on "/" if baseurl is not specified
  baseurl = blogdown:::get_config2("baseurl", default = "/")
  knitr::opts_knit$set(base.url = baseurl)
  knitr::render_jekyll()  # set output hooks
  jekyll.default.plot <- knitr::knit_hooks$get("plot")
  
  # input/output filenames as two arguments to Rscript
  a = commandArgs(TRUE)
  d = gsub("^_|[.][a-zA-Z]+$", "", a[1])
  
  library(svglite)
  library(knitr)
  
  knitr::opts_chunk$set(tidy=FALSE,
                        warning=FALSE,
                        message=FALSE,
                        cache=TRUE, 
                        comment=NA,
                        verbose=TRUE,
                        dev = "svglite",
                        dev.args=list(bg='transparent'))
  
  # Name the cache path and fig.path based on filename...
  knitr::opts_chunk$set(fig.path   = sprintf("assets/figures/", d),
                        cache.path = sprintf("cache/", d))
  
  # knitr::knit_hooks$set(figure = function(before, options, envir) {
  #   if (!before) {
  #     ## after a chunk has been evaluated
  #     name <- paste(options$fig.path, options$label, sep = '')
  #     message(name)
  #     return(sprintf("{%% include figure image_path=\"%s\" alt=\"%s\" caption=\"%s\" %%}", name, options$fig.alt, options$fig.cap))
  # 
  #   }
  # })
  
  knit(
    a[1], a[2], quiet = FALSE, encoding = "UTF-8",
    envir = globalenv()
  )
})
