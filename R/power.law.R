###############################################
# POWER LAW                                   #
# plots and graphs used in power law tutorial #
###############################################
if (!require("pacman")) install.packages("pacman"); invisible(library(pacman))
tryCatch({
  p_load("tidyverse", "poweRlaw")
}, warning=function(w){
  stop(conditionMessage(w))
})

#################
# ITALIAN TOWNS #
#################
italian.towns <- read.csv2("./data-sources/comuni_italiani.csv")

italian_pl <- conpl$new(italian.towns$PopResidente)
italian.est <- estimate_xmin(italian_pl)
italian_pl$setXmin(italian.est)

italian_ln <- conlnorm$new(italian.towns$PopResidente)
italian.ln.est <- estimate_xmin(italian_ln)
italian_ln$setXmin(italian.ln.est)

italian_exp <- conexp$new(italian.towns$PopResidente)
italian.exp.est <- estimate_xmin(italian_exp)
italian_exp$setXmin(italian.exp.est)


#bs.pl <- bootstrap(m_pl, no_of_sims=10, threads=8)

par(mar=c(3, 3, 2, 1), mgp=c(2, 0.4, 0), tck=-.01,
    cex.axis=0.9, las=1)

plot(italian_pl, pch = 16, cex = .5, col = "grey", bg=2, panel.first=grid(col="grey80"),
     xlab="Population", ylab="CDF")
lines(italian_pl, col=2)
lines(italian_ln, col=3)
lines(italian_exp, col=4)

# Test for hypothesis
#bs_p <- bootstrap_p(m_pl, threads = 7)

#############
# MOBY DICK #
#############
data("moby", package="poweRlaw")

moby_pl <- displ$new(moby)
moby.est <- estimate_xmin(moby_pl)

moby_pl$setXmin(moby.est)

moby.bs = bootstrap(moby_pl, no_of_sims=100, threads=8)

plot(moby_pl, pch = 16, cex = .5, col = "grey", bg=2, panel.first=grid(col="grey80"),
     xlab="Word Occurrance", ylab="CDF")
lines(moby_pl, col=2)

