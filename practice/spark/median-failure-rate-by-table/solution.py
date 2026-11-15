from pyspark.sql import functions as F

df_table = spark.read.table("dq_checks")
df_out = (
    df_table
    .groupBy("tbl_name")
    .agg(F.median("fail_pct").alias("median_fail_pct"))
    .select("tbl_name", "median_fail_pct")
)
