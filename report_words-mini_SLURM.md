---
title: "ML Results"
date: "2023-07-27"
output:
  html_document:
    keep_md: true
    self_contained: true
    theme: spacelab
---
            






Machine learning algorithm(s) used: glmnet.
Models were trained with 2 different random
partitions of the words-mini_SLURM dataset into training and
testing sets using 2-fold cross validation.
See [config/config.yaml](config/config.yaml) 
for the full configuration.

## Workflow

<img src="figures/graphviz/rulegraph.png" width="80%" />

## Model Performance

<img src="figures/words-mini_SLURM/performance.png" width="80%" />

<img src="figures/words-mini_SLURM/roc_curves.png" width="80%" />

## Hyperparameter Performance

<img src="figures/words-mini_SLURM/hp_performance_glmnet.png" width="80%" />

## Feature Importance

<img src="figures/words-mini_SLURM/feature_importance.png" width="80%" />

## Memory Usage & Runtime

Each model training run was given 4 cores
for parallelization.

<img src="figures/words-mini_SLURM/benchmarks.png" width="80%" />
