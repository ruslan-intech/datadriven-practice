from pyspark.sql import functions as F
from pyspark.sql.window import Window

df_commits = spark.read.table("repo_commits")
w_lead = Window.partitionBy("repo_name").orderBy("commit_at")
df_ld = ( 
  df_commits
  .withColumn("lead_silence", F.lead("commit_at").over(w_lead))
  .select("repo_name", 
          ((F.unix_timestamp("lead_silence") - F.unix_timestamp("commit_at")) / (24*60*60)).alias("longest_silence")
          )
)

df_max_ld = (
  df_ld
    .groupBy("repo_name")
    .agg(F.max("longest_silence").alias("longest_silence"), F.count("*").alias("cnt"))
    .filter(F.col("cnt") > 32)
    .select("repo_name", "longest_silence")
)

w_rank = Window.orderBy(F.desc("longest_silence"))

df_out = ( 
  df_max_ld
    .withColumn("silence_rank", F.row_number().over(w_rank))
    .select(
      "repo_name",
      "longest_silence",
      "silence_rank"
    )
)
