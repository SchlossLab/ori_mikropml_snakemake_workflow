---
title: "ML Results"
date: "2023-06-16"
output:
  html_document:
    keep_md: true
    self_contained: true
    theme: spacelab
---
            






Machine learning algorithm(s) used: glmnet.
Models were trained with 2 different random
partitions of the words-mini dataset into training and
testing sets using 2-fold cross validation.
See [config/test.yaml](config/test.yaml) 
for the full configuration.

## Workflow

<img src="figures/graphviz/rulegraph.png" width="80%" />

## Model Performance

<img src="figures/words-mini/performance.png" width="80%" />

<img src="figures/words-mini/roc_curves.png" width="80%" />

## Hyperparameter Performance

<img src="figures/words-mini/hp_performance_glmnet.png" width="80%" />

## Feature Importance

<img src="figures/words-mini/feature_importance.png" width="80%" />

## Memory Usage & Runtime

Each model training run was given 4 cores
for parallelization.

<img src="figures/words-mini/benchmarks.png" width="80%" />
