# pystansequential


[![Project
Status](http://www.repostatus.org/badges/latest/concept.svg)](http://www.repostatus.org/#concept)
[![ci](https://github.com/dirmeier/pystansequential/workflows/ci/badge.svg)](https://github.com/dirmeier/pystansequential/actions/)

> Ordinal sequential regression models in Python

## About

This repository implements a case study sequential regression models in Python. Sequential models
are a special type of ordinal regression models, but additionally assume that data can only be reached 
sequentially. Arguably this should make them often more appropriate to use for biological and medical applications than 
conventional ordinal models.

You can find the case study [here](https://dirmeier.github.io/pystansequential/index.html). The case study uses 
[PyStan](https://pystan.readthedocs.io/en/latest/) for data analysis.

## Installation

You can install `pystansequential` using the latest GitHub 
[release](https://github.com/dirmeier/pystansequential/releases/):

```bash
python -m pip install git+https://github.com/dirmeier/pystansequential.git
```

## Author

Simon Dirmeier <a href="mailto:simon.dirmeier @ gmx.de">simon.dirmeier @ gmx.de</a>
