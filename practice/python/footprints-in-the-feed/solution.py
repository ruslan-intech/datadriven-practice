def aggregate_trades(lines: list[str]) -> list:
  bytes_per_day = {}
  bytes_per_exchange_per_day = {}
  
  for l in lines:
    date,process,host,log_message,bytes = l.split(',')
    bytes_per_day[date] = bytes_per_day.get(date, 0) + int(bytes)
    exchange_name = process.split('_')[0]
    if date not in bytes_per_exchange_per_day:
      bytes_per_exchange_per_day[date] = {exchange_name: int(bytes)}
    else:
      nested_dict = bytes_per_exchange_per_day[date]
      nested_dict[exchange_name] = nested_dict.get(exchange_name, 0) + int(bytes)
      bytes_per_exchange_per_day[date] = nested_dict
      
  return [bytes_per_day, bytes_per_exchange_per_day]
