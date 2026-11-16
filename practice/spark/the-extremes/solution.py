from pyspark.sql import functions as F
from pyspark.sql import Window

df_cte = ( 
  spark
  .read
  .table("cloud_costs")
  .filter(F.col("amount") > 0)
  .groupBy("svc_name")
  .agg(F.sum("amount").alias("total_amount"))
  .select("svc_name", "total_amount") 
)

w_desc = Window.orderBy(F.desc("total_amount"))
w_asc = Window.orderBy(F.asc("total_amount"))
df_cnt = (
  df_cte
  .withColumn("rn_desc", F.row_number().over(w_desc))
  .withColumn("rn_asc", F.row_number().over(w_asc))
)

df_out = (
  df_cnt
  .filter((F.col("rn_asc") <= 3) | (F.col("rn_desc") <= 3))
  ,select("svc_name", "total_amount")
  .orderBy("total_amount")
  )
