# shows days that have 30 days
class MonthsWithThirtyDaysService
  def initialize
    @months = { 'January' => 31,
                'February' => 28,
                'March' => 31,
                'April' => 30,
                'May' => 31,
                'June' => 30,
                'July' => 31,
                'August' => 31,
                'September' => 30,
                'October' => 31,
                'November' => 30,
                'December' => 31 }
  end

  def call
    "Months with 30 days : #{days30}"
  end

  private

  def days30
    @months.select { |month, length| month if length == 30 }.keys.join(', ')
  end
end

puts MonthsWithThirtyDaysService.new.call
