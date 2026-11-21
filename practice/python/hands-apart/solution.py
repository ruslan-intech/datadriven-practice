def clock_angle(hour: int, minute: int) -> float:
  # hour_to_min = hour * 5
  hour_update = (hour + (minute * 1.0 / 60)) * 5
  out = abs((minute - hour_update) * 6) % 360

  return out if out <= 180 else (360 - out)
