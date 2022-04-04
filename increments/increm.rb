# increments of five from 10 to 100
class IncrementsOfFive
  LIMIT = 100
  NUMBER = 5

  def initialize
    @increment_numbers = [10]
  end

  def call
    increments_calculator
  end

  private

  def increments_calculator
    @increment_numbers << @increment_numbers[-1] + NUMBER until @increment_numbers[-1] == LIMIT
    @increment_numbers
  end
end

puts IncrementsOfFive.new.call
