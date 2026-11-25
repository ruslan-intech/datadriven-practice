from pyspark.sql import functions as F
from pyspark.sql import window

df_transactions = spark.read.table("transactions")

df_category = ( spark
  .read
  .table("products") 
)

df_cte = (
  df_transactions
  .join(df_category, "product_id", "inner")
  .groupBy('category')
  .agg(
    F.sum("total_amount").alias("total_revenue"),
    F.count("*").alias("transaction_count")
  )
  .orderBy(F.desc("total_revenue"))
)
