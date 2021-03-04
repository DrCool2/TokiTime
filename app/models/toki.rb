class Toki < ApplicationRecord

  def self.toki_in_hours(toki_id)
    toki = Toki.find_by(id: toki_id)

    toki_seconds = toki.clock_out - toki.clock_in
    toki_minutes = toki_seconds / 60
    toki_hours   = toki_minutes / 60

    return toki_hours;
  end

  def self.hours(id)
    toki = Toki.find_by_id(id)

    toki_hours = (toki.clock_out - toki.clock_in)/60/60 # original = seconds, /60 =  in minutes, /60/60 = in hours
    if toki_hours < 1 then toki_hours = toki_hours.round(3) end # how to separate Hours from Minutes
    return toki_hours;
  end
end
