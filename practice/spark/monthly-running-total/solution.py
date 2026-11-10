from pyspark.sql import functions as F
from pyspark.sql.window import Window

df_transactions = (
  spark
  .read
  .table('transactions')
  .where(F.col('product_id').isNotNull())
  .withColumn('month', F.substring('transaction_date', 1, 7))
  .groupBy('product_id', 'month')
  .agg(F.sum('total_amount').alias('monthly_total'))
)

w = (
  Window
  .partitionBy('product_id')
  .orderBy('month')
  .rowsBetween(Window.unboundedPreceding, Window.currentRow)
)

output = df_transactions.select(
  'product_id',
  'month',
  'monthly_total',
  F.sum('monthly_total').over(w).alias('cumulative_total')
)
