schtools::log_snakemake()
rmarkdown::render(snakemake@input[["Rmd"]],
  output_file = snakemake@output[["doc"]]
)
