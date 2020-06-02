# Sequential regression models

[![Project
Status](http://www.repostatus.org/badges/latest/concept.svg)](http://www.repostatus.org/#concept)
[![ci](https://travis-ci.org/dirmeier/rstansequential.svg?branch=master)](https://travis-ci.org/dirmeier/rstansequential)

> Ordinal sequential regression models in R

## About

This repository implements a case study sequential regression models in Python. Sequential models
are a special type of ordinal regression models, but additionally assume that data can only be reached 
sequentially. Arguably this should make them often more appropriate to use for biological and medical applications than 
conventional ordinal models.

You can find the case study [here](https://dirmeier.github.io/rstansequential/index.html). The case study uses 
[rstan](https://github.com/stan-dev/rstan) for data analysis.

## Installation

You can install `rstansequential` using the latest GitHub 
[release](https://github.com/dirmeier/rstansequential/releases/):

```r
remotes::install_github("dirmeier/rstansequential@v0.1.0")
```

## Author

Simon Dirmeier <a href="mailto:simon.dirmeier @ gmx.de">simon.dirmeier @ gmx.de</a>
