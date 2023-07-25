library(tidyverse)
library(ggtext)
library(purrr)
library(readr)
library(dplyr)


l2_files<- list.files(path="results/seq_gl_100s/runs",
                       pattern="*.Rds",
                       full.names=TRUE)
#
test <- l2_files[1]

model <- readRDS(test) %>%
            pluck("trained_model")

model <- readRDS(test)

readRDS(test)
coef(model$finalModel, model$bestTune$lambda) %>%
    as.matrix %>%
    as_tibble(rownames = "feature") %>%
    rename(weight = s1)

get_weights <- function(file_name){

  model <- readRDS(file_name)

  coef(model$finalModel, model$bestTune$lambda) %>%
    as.matrix %>%
    as_tibble(rownames="feature") %>%
    rename(weight = `s1`) %>%
    mutate(seed = str_replace(file_name,
                              "results/seq_gl_100s_(\\d*).Rds",
                              "\\1"))

}

l2_weights <- map_dfr(l2_files, get_weights)

summary(l2_weights$weight)

l2_weights %>%
  filter(feature != "(Intercept)") %>%
  group_by(feature) %>%
  summarize(median = median(weight),
            l_quartile = quantile(weight, prob=0.25),
            n = n(),
            u_quartile = quantile(weight, prob=0.75))
#
# %>%
#   mutate(#feature = str_replace(feature, "(.*)", "*\\1*"),
#          #feature = str_replace(feature, "(.*)_unclassified\\*", "Unclassified \\1*"),
#          #feature = str_replace(feature, "_(.*)\\*", "* \\1"),
#          feature = fct_reorder(feature, median)) %>%
#   filter(abs(median) > 0.0000008) %>%
#   ggplot(aes(x=median, y=feature, xmin=l_quartile, xmax=u_quartile)) +
#   geom_vline(xintercept=0, color="gray") +
#   geom_point() +
#   geom_linerange() +
#   labs(x="Weights", y=NULL,
#        title = "Feature Weights") +
#   theme_classic() +
#   theme(axis.text.y = element_markdown())

ggsave("figures/data_gl_lambda/feature_weights.jpg")

l2_files

get_feature_importance <- function(file_name){

  feature_importance <- read_csv(file_name) %>%
    #pluck("feature_importance") %>%
    as_tibble() %>%
    select(feat, perf_metric, perf_metric_diff)

}

l2_files<- list.files(path="results/seq_gl_100s/runs",
                      pattern="*feature-importance.csv",
                      full.names=TRUE)

l2_feature_importance <- map_dfr(l2_files, get_feature_importance)

summary(l2_feature_importance)
l2_feature_importance %>%
  rename(feature = feat) %>%
  group_by(feature) %>%
  summarize(median = median(perf_metric_diff),
            l_quartile = quantile(perf_metric_diff, prob=0.25),
            u_quartile = quantile(perf_metric_diff, prob=0.75)) %>%
  mutate(feature = str_replace(feature, "(.*)", "*\\1*"),
         feature = str_replace(feature, "(.*)_unclassified\\*", "Unclassified \\1*"),
         feature = str_replace(feature, "_(.*)\\*", "* \\1"),
         feature = fct_reorder(feature, median)) %>%
  filter(median > 0.000075) %>%
  ggplot(aes(x=median, y=feature, xmin=l_quartile, xmax=u_quartile)) +
  geom_point() +
  geom_linerange() +
  labs(x="Change in AUC when removed", y=NULL,
       title = "Performance Metric Difference") +
  theme_classic() +
  theme(axis.text.y = element_markdown())

ggsave("figures/data_gl_lambda/l2_feature_importance.tiff", width=5, height=5)
