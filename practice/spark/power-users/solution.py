from pyspark.sql import functions as F

df_cte = (
    spark
    .read
    .table("user_sessions")
    .groupBy("user_id")
    .agg(F.count("session_id").alias("session_count"))
    .filter(F.col("session_count") > 2)
)

df_users = spark.read.table("users")

df_out = (
    df_cte
    .join(df_users, "user_id", "inner")
    .select("username", "session_count")
    .orderBy(F.desc("session_count"))
)
