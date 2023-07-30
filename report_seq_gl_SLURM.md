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
Models were trained with 10 different random
partitions of the seq_gl_SLURM dataset into training and
testing sets using 5-fold cross validation.
See [config/config.yaml](config/config.yaml) 
for the full configuration.

## Workflow

<img src="figures/graphviz/rulegraph.png" width="80%" />

## Model Performance

<img src="figures/seq_gl_SLURM/performance.png" width="80%" />

<img src="figures/seq_gl_SLURM/roc_curves.png" width="80%" />

## Hyperparameter Performance

<img src="figures/seq_gl_SLURM/hp_performance_glmnet.png" width="80%" />

## Feature Importance

<img src="figures/seq_gl_SLURM/feature_importance.png" width="80%" />

## Memory Usage & Runtime

Each model training run was given 6 cores
for parallelization.

<img src="figures/seq_gl_SLURM/benchmarks.png" width="80%" />
