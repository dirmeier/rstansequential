functions {
#include /include/cratio.stan
}

#include /include/ordered_parameters_and_data.stan

model {
#include /include/ordered_model.stan
  y ~ cratio(X * beta, threshold);
}

