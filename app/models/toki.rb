class Toki < ApplicationRecord


  validates :clock_in, presence: true
  validates :clock_out, presence: true
  validates :clock_out, date: {after_or_equal_to: :clock_in}



  def self.hours(id)
    toki = Toki.find_by_id(id)

    toki_hours = (toki.clock_out - toki.clock_in)/60/60 # original = seconds, /60 =  in minutes, /60/60 = in hours
    if toki_hours < 1 then toki_hours = toki_hours.round(3) end # how to separate Hours from Minutes
    
    return toki_hours;
  end

  def self.duration()
    toki = Toki.all
    duration = []

    toki.each do |t| duration.push([Toki.hours(t.id), t.id]) end
    return duration.sort
    binding.pry

  end

end
