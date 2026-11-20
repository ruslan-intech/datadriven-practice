from pyspark.sql import functions as F

df_table = spark.read.table("devices")

df_cte = (
  df_table
  .filter(F.col("browser").isNotNull())
  .groupBy("device_type", "os_name")
  .agg(F.count("*").alias("device_count"))
  .filter(F.col("device_count") >= 3)
)
