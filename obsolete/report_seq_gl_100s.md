---
title: "ML Results"
date: "2023-07-24"
output:
  html_document:
    keep_md: true
    self_contained: true
    theme: spacelab
---
            






Machine learning algorithm(s) used: glmnet.
Models were trained with 100 different random
partitions of the seq_gl_100s dataset into training and
testing sets using 5-fold cross validation.
See [config/glmnet.yaml](config/glmnet.yaml) 
for the full configuration.

## Workflow

<img src="figures/graphviz/rulegraph.png" width="80%" />

## Model Performance

<img src="figures/seq_gl_100s/performance.png" width="80%" />

<img src="figures/seq_gl_100s/roc_curves.png" width="80%" />

## Hyperparameter Performance

<img src="figures/seq_gl_100s/hp_performance_glmnet.png" width="80%" />

## Feature Importance

<img src="figures/seq_gl_100s/feature_importance.png" width="80%" />

## Memory Usage & Runtime

Each model training run was given 6 cores
for parallelization.

<img src="figures/seq_gl_100s/benchmarks.png" width="80%" />
