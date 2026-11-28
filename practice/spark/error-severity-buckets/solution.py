from pyspark.sql import functions as F

df_features = spark.read.table("err_tracks")

out = (
  df_features
  .filter(F.col("count").isNotNull())
  .withColumn("severity_label", 
      F.when(F.col("count") == 0, "NONE")
      .when( F.col("count").between(1, 5), "LOW")
      .when( F.col("count").between(6, 20), "MODERATE")
      .when( F.col("count").between(21, 50), "HIGH")
      .when(F.col("count") > 50, "CRITICAL")  
  )
  .select("err_type", "severity_label")
)
