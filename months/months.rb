class Thirty_days
  def initialize
     @months = {"January" => 31,
      "February" => 28,
      "March" => 31,
      "April" => 30,
      "May" => 31,
      "June" => 30,
      "July" => 31,
      "August" => 31,
      "September" => 30,
      "Octopber" => 31,
      "November" => 30,
      "December" => 31
     }
  end

  def days_30
    @months.select{|k,v| k if v == 30}.keys.join(", ")
  end
end

p Thirty_days.new.days_30