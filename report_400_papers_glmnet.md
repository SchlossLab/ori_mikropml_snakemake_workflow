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
Models were trained with 10 different random
partitions of the 400_papers_glmnet dataset into training and
testing sets using 5-fold cross validation.
See [config/glmnet.yaml](config/glmnet.yaml) 
for the full configuration.

## Workflow

<img src="figures/graphviz/rulegraph.png" width="80%" />

## Model Performance

<img src="figures/400_papers_glmnet/performance.png" width="80%" />

<img src="figures/400_papers_glmnet/roc_curves.png" width="80%" />

## Hyperparameter Performance

<img src="figures/400_papers_glmnet/hp_performance_glmnet.png" width="80%" />

## Feature Importance

<img src="figures/400_papers_glmnet/feature_importance.png" width="80%" />

## Memory Usage & Runtime

Each model training run was given 4 cores
for parallelization.

<img src="figures/400_papers_glmnet/benchmarks.png" width="80%" />
