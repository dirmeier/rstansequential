# On sequential regression models

[![Project
Status](http://www.repostatus.org/badges/latest/concept.svg)](http://www.repostatus.org/#concept)

> A case study on sequential regression models using Stan

## About

This repository implements a case study on sequential regression models. Sequential models
are a special type of ordinal regression models, but additionally assume that data can only be reached 
sequentially. Arguably this should make them often more appropriate to use for biological and medical applications than 
conventional ordinal models.

You can find the case study [here](https://dirmeier.github.io/rstansequential/index.html). The case study uses 
[rstan](https://github.com/stan-dev/rstan) for data analysis.

## Acknowledgements

Thanks to Jana Linnik for introducing me to sequential regression models and for making me aware that many biological data sets can be more appropriately modelled 
using a sequential response mechanism.

## Installation

For convencience, I wrapped the functions into an R package. You can install `rstansequential` using the latest GitHub 
[release](https://github.com/dirmeier/rstansequential/releases/):

```r
remotes::install_github("dirmeier/rstansequential@v0.1.0")
```

## Author

Simon Dirmeier <a href="mailto:simon.dirmeier @ gmx.de">simon.dirmeier @ gmx.de</a>
