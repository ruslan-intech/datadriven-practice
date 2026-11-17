from pyspark.sql import functions as F

df_passed = spark.read.table("dq_checks").filter(F.col("passed") == 0)
df_out = (
    df_passed
    .groupBy("tbl_name").agg(
        F.count("*").alias("failed_checks"), 
        F.count_distinct("rule").alias("distinct_rules"),
        F.avg("fail_pct").alias("avg_fail_pct")
    )
    .filter(F.col("avg_fail_pct") > 30)
    .orderBy(F.desc("avg_fail_pct"))
)
