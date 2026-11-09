from pyspark.sql import functions as F
from pyspark.sql.window import Window

w = Window.partitionBy("user_id").orderBy("transaction_date")

df = (
    spark.read.table("transactions")
    .withColumn("rn", F.row_number().over(w))
    .filter(F.col("rn") == 2)
    .select("user_id", "total_amount", "transaction_date")
)
