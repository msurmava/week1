# shows days that have 30 days
class MonthsWithThirtyDaysService
  DESIRED = 30
  MONTHS = { 'January' => 31,
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
             'December' => 31 }.freeze

  def call
    "Months with 30 days : #{days30}"
  end

  private

  def days30
    MONTHS.select { |month, length| month if length == DESIRED }.keys.join(', ')
  end
end

puts MonthsWithThirtyDaysService.new.call
