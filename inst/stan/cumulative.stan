functions {
#include /include/cumulative.stan
}

#include /include/ordered_parameters_and_data.stan

model {
#include /include/ordered_model.stan
  y ~ cumulative(X * beta, threshold);
}

