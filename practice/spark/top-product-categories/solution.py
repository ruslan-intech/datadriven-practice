from pyspark.sql import functions as F
from pyspark.sql import Window

df_transactions = spark.read.table("transactions")
df_category = ( spark
  .read
  .table("products")
  .filter(F.col("rating") >= 3.0) 
)

df_cte = (
  df_transactions
  .join(df_category, "product_id", "inner")
  .groupBy(F.col("category"))
  .agg(F.count("*").alias("txn_count"))
)

w = Window.orderBy(F.desc("txn_count"))

df_out = (
  df_cte
  .withColumn("rnk", F.dense_rank().over(w))
  .filter(F.col("rnk") < 4)
)
