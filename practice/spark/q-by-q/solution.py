from pyspark.sql import functions as F

df_table = spark.read.table("deploy_logs")

df_cte = (
  df_table
  .withColumn('year_quarter', F.date_trunc('quarter', "deploy_at"))
  .groupBy('year_quarter')
  .agg(F.count("*").alias("cnt"))
  .select((F.col("cnt")*1.0 / 13).alias("deploys_per_week"), 
    F.date_format("year_quarter", "yyyy").alias("yr"),
    F.date_format("year_quarter", "MM").alias("mt")
  )
)

df_out = (
  df_cte
  .select(
    F.concat(
      F.col("yr"), 
      F.lit("-"), 
      F.when(F.col("mt")=="01", "Q1").when(F.col("mt")=="04", "Q2").when(F.col("mt")=="07", "Q3").when(F.col("mt")=="10", "Q4")
    ).alias("quarter"),
    F.col("deploys_per_week")
  )
  .orderBy(F.desc("deploys_per_week"))
)
