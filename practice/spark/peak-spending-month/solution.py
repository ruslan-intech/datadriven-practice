from pyspark.sql import functions as F

df = spark.table("cloud_costs")

result = (
  df
  .withColumn(
    "bill_month",
    F.substring("bill_date", 1, 7)
  )
  .groupBy("bill_month")
  .agg(
    F.sum("amount").alias("total_spend")
  )
  .orderBy(F.desc("total_spend"))
  .limit(1)
)
