rule preprocess_data:
    input:
        R="workflow/scripts/preproc.R",
        csv=config["dataset_csv"],
    output:
        rds=f"data/processed/{dataset}_preproc.Rds",
    log:
        "log/preprocess_data.txt",
    benchmark:
        "benchmarks/preprocess_data.txt"
    params:
        outcome_colname=outcome_colname,
    threads: ncores
    resources:
        mem_mb=MEM_PER_GB * 2,
    conda:
        "../envs/mikropml.yml"
    script:
        "../scripts/preproc.R"


rule run_ml:
    input:
        R="workflow/scripts/train_ml.R",
        rds=rules.preprocess_data.output.rds,
    output:
        model="results/{dataset}/runs/{method}_{seed}_model.Rds",
        perf="results/{dataset}/runs/{method}_{seed}_performance.csv",
        test="results/{dataset}/runs/{method}_{seed}_test-data.csv",
    log:
        "log/{dataset}/runs/run_ml.{method}_{seed}.txt",
    benchmark:
        "benchmarks/{dataset}/runs/run_ml.{method}_{seed}.txt"
    params:
        outcome_colname=outcome_colname,
        method="{method}",
        seed="{seed}",
        kfold=kfold,
        hyperparams=hyperparams,
    threads: ncores
    resources:
        mem_mb=MEM_PER_GB * 4,
    conda:
        "../envs/mikropml.yml"
    script:
        "../scripts/train_ml.R"


rule find_feature_importance:
    input:
        R="workflow/scripts/find_feature_importance.R",
        model=rules.run_ml.output.model,
        test=rules.run_ml.output.test,
    output:
        feat="results/{dataset}/runs/{method}_{seed}_feature-importance.csv",
    log:
        "log/{dataset}/runs/find_feature-importance.{method}_{seed}.txt",
    params:
        outcome_colname=outcome_colname,
        method="{method}",
        seed="{seed}",
    threads: ncores
    resources:
        mem_mb=MEM_PER_GB * 1,
    conda:
        "../envs/mikropml.yml"
    script:
        "../scripts/find_feature_importance.R"