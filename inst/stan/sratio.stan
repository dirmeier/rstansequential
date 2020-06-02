functions {
#include /include/sratio.stan
}

#include /include/ordered_parameters_and_data.stan

model {
#include /include/ordered_model.stan
  y ~ sratio(X * beta, threshold);
}

