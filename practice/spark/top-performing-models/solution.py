from pyspark.sql import functions as F

df_table = spark.read.table("ml_models")

df_out = (
  df_table
  .filter(F.col("accuracy") >= 0.9)
  .orderBy(F.desc("accuracy"))
)
