from pyspark.sql import functions as F

df_table = spark.read.table("chat_msgs")

df_cte = (
  df_table
  .withColumn("date_edit", F.to_date("sent_at"))
  .groupBy("date_edit")
  .agg(
    F.sum(F.when(F.col("edited"), 1).otherwise(0)).alias("edit_cnt"),
    F.sum(F.when(~F.col("edited"), 1).otherwise(0)).alias("nedit_cnt"),
  )
  .filter(F.col("edit_cnt") > F.col("nedit_cnt"))
)

df_out = (
  df_table
  .alias("cm")
  .withColumn("date_edit", F.to_date("sent_at"))
  .join(df_cte, "date_edit", "inner")
  .select("cm.*")
)
