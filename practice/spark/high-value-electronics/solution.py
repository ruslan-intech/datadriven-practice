from pyspark.sql import functions as F
from pyspark.sql.window import Window

df_table = spark.read.table("products").where(F.col('in_stock') == 1 and F.col('category') == 'Electronics')

w = Window.orderBy(F.desc("price"))
df = df_table.withColumn("rn", F.row_number().over(w)).select("product_name", "price").where(F.col("rn") < 6)
