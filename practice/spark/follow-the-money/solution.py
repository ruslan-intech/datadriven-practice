from pyspark.sql import functions as F

df_table = spark.read.table("transactions")
df_out = (
    df_table
    .filter(F.col(F.year("transaction_date")) == 2026)
    .groupBy("user_id")
    .agg(F.sum("total_amount").alias("total_spent"))
    .orderBy(F.desc("total_spent"))
    .select("user_id", "total_spent")
)
