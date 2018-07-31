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

italian.pl <- conpl$new(italian.towns$PopResidente)
italian.pl$setXmin(estimate_xmin(italian.pl))
italian.pl$setPars(estimate_pars(italian.pl))

italian.ln <- conlnorm$new(italian.towns$PopResidente)
italian.ln$setXmin(estimate_xmin(italian.ln))
italian.ln$setPars(estimate_pars(italian.ln))

#bs.pl <- bootstrap(m_pl, no_of_sims=10, threads=8)

par(mar=c(3, 3, 2, 1), mgp=c(2, 0.4, 0), tck=-.01,
    cex.axis=0.9, las=1)

plot(italian.pl, pch = 16, cex = .5, col = "grey", bg=2, panel.first=grid(col="grey80"),
     xlab="Population", ylab="CDF")
lines(italian.pl, col=2)
lines(italian.ln, col=3)


# Test for hypothesis; null hypothesis is that fit is power-law
italian.pl.fit <- bootstrap_p(italian.pl, no_of_sims = 5000, threads = 8)
plot(italian.pl.fit)

#############
# MOBY DICK #
#############
data("moby", package="poweRlaw")

moby.pl <- displ$new(moby)
moby.pl$setXmin(estimate_xmin(moby.pl))
moby.pl$setPars(estimate_pars(moby.pl))


moby.bs <- bootstrap(moby.pl, no_of_sims=1000, threads=8)
plot(moby.bs, trim = .1)
hist(moby.bs$bootstraps[,2], breaks = "fd")
hist(moby.bs$bootstraps[,3], breaks = "fd")

moby.test <- bootstrap_p()

plot(moby.pl, pch = 16, cex = .5, col = "grey", bg=2, panel.first=grid(col="grey80"),
     xlab="Word Occurrance", ylab="CDF")
lines(moby.pl, col=2)

#################
# UK POPULATION #
#################
data("population", package="poweRlaw")

population_pl <- conpl$new(population)
population.est <- estimate_xmin(population_pl)
population_pl$setXmin(population.est)

population_ln <- conlnorm$new(population)
population.ln.est <- estimate_xmin(population_ln)
population_ln$setXmin(population.ln.est)

population_exp <- conexp$new(population)
population.exp.est <- estimate_xmin(population_exp)
population_exp$setXmin(population.exp.est)

population.bs = bootstrap(population_pl, no_of_sims=100, threads=8)

plot(population_pl, pch = 16, cex = .5, col = "grey", bg=2, panel.first=grid(col="grey80"),
     xlab="Population", ylab="CDF")
lines(population_pl, col=2)
lines(population_ln, col=3)
lines(population_exp, col=4)
