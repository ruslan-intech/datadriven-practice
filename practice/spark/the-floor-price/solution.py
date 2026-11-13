from pyspark.sql import functions as F

df_costs = (
  spark
    .read
    .table("cloud_costs")
    .filter(F.col("acct_id").isNotNull())
    .withColumn("provider", F.upper("provider"))
)

df_agg = (
  df_costs
    .groupBy("provider")
    .agg(
      F.max("amount")
      .alias("max_amount")
      )
  .select("provider", "max_amount")
)
