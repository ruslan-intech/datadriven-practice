from pyspark.sql.functions import col, year

result_df = (
    user_sessions
  .filter(
      (col("session_duration_sec") < 100) & 
      (year(col("session_start")) == 2026)
    )
  .select(
      "session_id",
      "user_id",
      "session_duration_sec"
    )
  )

result_df.show()
