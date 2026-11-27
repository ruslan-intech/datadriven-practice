from pyspark.sql import functions as F
from pyspark.sql import Window

df = spark.read.table("cloud_costs")
w = Window.partitionBy("svc_name").orderBy("bill_date")

df_out = (
  df
  .withColumn("price_change", F.col("amount") - F.lag("amount").over(w))
  .select(
    "svc_name",
    "bill_date",
    "amount",
    "price_change"
  )
  .orderBy(
    "svc_name",
    "bill_date"
  )
)
