from pyspark.sql import functions as F
from pyspark.sql.window import Window

df_cc = spark.read.table("cloud_costs")
df_ca = spark.read.table("cost_allocs")

movements = (
  df_cc.select(
    "region",
    F.date_format("bill_date", "yyyy-MM").alias("month"),
    (-F.col("amount").cast("long")).alias("amt"),
  )
  .union(
    df_ca.select(
      "region",
      F.col("period").alias("month"),
      F.col("amount").cast("long").alias("amt"),
    )
  )
)

w = Window.partitionBy("region").orderBy("month")

df_out = (
  movements
  .groupBy("region", "month")
  .agg(F.sum("amt").alias("net_movement"))
  .withColumn("balance", F.sum("net_movement").over(w))
  .orderBy("region", "month")
)
