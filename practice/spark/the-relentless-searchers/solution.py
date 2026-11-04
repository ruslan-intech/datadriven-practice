from pyspark.sql import functions as F, Window

w = Window.orderBy(F.desc("query_count"), F.col("user_id").cast("string"))

result = (
    search_queries
    .groupBy("user_id").count()
    .withColumnRenamed("count", "query_count")
    .withColumn("rnk", F.row_number().over(w))
    .orderBy("rnk")
)
