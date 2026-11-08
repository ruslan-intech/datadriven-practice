from pyspark.sql import functions as F
from pyspark.sql.window import Window

df_table = spark.read.table("alert_events").where(F.col("resolved").isNull())

w = Window.partitionBy("svc_name").orderBy("fired_at", "alert_id")
df = df_table.withColumn("rn", F.row_number().over(w))

row = (
  df
  .select("svc_name", "alert_id", "severity", "status", "fired_at")
  .filter("rn = 1")
  .orderBy("svc_name")
)
