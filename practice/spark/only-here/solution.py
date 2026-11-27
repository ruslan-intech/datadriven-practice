from pyspark.sql import functions as F

df_features = spark.read.table("ml_features")

out = (

  df_features
  .withColumn("dtype", F.lower("dtype"))
  .filter(F.col("source").isin("transactions", "page_views", "ad_impressions"))
  .groupBy("feat_name", "dtype")
  .agg(
    F.round(F.avg("avg_val"), 2).alias("avg_val"),
    F.round(F.avg("null_pct"), 2).alias("null_pct"),
    F.sum(F.when(F.col("source") == 'transactions', 1).otherwise(0)).alias("trans"),
    F.sum(F.when(F.col("source") == 'page_views', 1).otherwise(0)).alias("page_v"),
    F.sum(F.when(F.col("source") == 'ad_impressions', 1).otherwise(0)).alias("ad_impr")
   )
  .filter(
    (F.col("trans") > 0) & (F.col("page_v") == 0) & (F.col("ad_impr") == 0)
  )
  .select("feat_name", "dtype", "avg_val", "null_pct")

)
