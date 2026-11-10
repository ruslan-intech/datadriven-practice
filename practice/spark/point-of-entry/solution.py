from pyspark.sql import functions as F
from pyspark.sql.window import Window

df_table = spark.read.table("event_data")

df_tmp = (df_table
  .where(F.lower('event_type') == 'purchase')
  .groupBy('user_id')
  .agg(F.count('*').alias('purchase_count'))  
)

w = Window.partitionBy("user_id").orderBy("event_id")

df_page_views = (
    df_table
      .where(F.lower("event_type") == "page_view")
      .withColumn("rn", F.row_number().over(w))
      .where(F.col("rn") == 1)
      .select("user_id", "event_id", "event_type")
)

result = (
    df_page_views
      .join(df_tmp, "user_id", "left")
      .select(
          "user_id",
          F.coalesce("purchase_count", F.lit(0)).alias("purchase_count"),
      )
      .orderBy(F.desc("purchase_count"))
)
