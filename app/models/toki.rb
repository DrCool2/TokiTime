class Toki < ApplicationRecord
  belongs_to :status

  validates :clock_in, presence: true
  validates :clock_out, presence: true
  validates :clock_out, date: {after_or_equal_to: :clock_in}



  def self.hours(id)
    toki = Toki.find_by_id(id)

    toki_hours = (toki.clock_out - toki.clock_in)/60/60 # original = seconds, /60 =  in minutes, /60/60 = in hours
    if toki_hours < 1 then toki_hours = toki_hours.round(3) end # how to separate Hours from Minutes
    
    return toki_hours.round(2)
  end

  def self.duration(sort_direction = "ASC") # default is ASC
    toki = Toki.all
    toki_hours_list = []
    toki_duration_sorted = []
    sort_direction.upcase!

    toki.each do |t| toki_hours_list.push([Toki.hours(t.id), t.id]) end

    if    sort_direction == "ASC"
      toki_hours_list.sort.each do |d| toki_duration_sorted << Toki.find_by_id(d[1]) end
    elsif sort_direction == "DESC"
      toki_hours_list.sort.reverse.each do |d| toki_duration_sorted << Toki.find_by_id(d[1]) end
    else
      toki_duration_sorted = "toki.duration(sort_direction.upcase): sort_direction.upcase NOT specified. It should be ASC or DESC!!"
    end

    return toki_duration_sorted
  end

  def self.status(status_id)
    Status.find(status_id).status.camelcase
  end

end
