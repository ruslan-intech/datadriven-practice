from pyspark.sql import functions as F

result = (
  svc_health
    .withColumn(
      'category',
      F.when(F.col('svc_name').like('%api%'), 'api_service')
      .when(
        (F.col('svc_name').like('%cache%')) |
        (F.col('svc_name').like('%redis%')), 'cache_service')
      .when(
        (F.col('svc_name').like('%db%')) |
        (F.col('svc_name').like('%postgres%')), 'database')
      .otherwise('other')
    )
    .select(
      'svc_name',
      'category'
    )
    .distinct()
)

result.show()
