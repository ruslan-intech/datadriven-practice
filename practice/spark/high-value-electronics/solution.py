from pyspark.sql import functions as F
from pyspark.sql.window import Window

df_table = spark.read.table("products").where("lower(category) = 'electronics' and in_stock = 1")

w = Window.orderBy(F.desc("price"))
df = df_table.withColumn("rn", F.row_number().over(w))

row = (
  df
  .filter("rn < 6")
  .select(F.col("product_name"), F.col("price"))
  .orderBy(F.desc("price"))
)
