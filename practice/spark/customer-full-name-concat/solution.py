from pyspark.sql import functions as F

df_table = spark.read.table("customers")

df_out = (
  df_table
  .orderBy(
    F.col("first_name"),
    F.col("last_name"),
    F.col("customer_id")  
  )
  .select(
    F.concat("first_name", F.lit(" "), "last_name").alias("full_name"),
    "customer_id",
    "country"
  )
)
