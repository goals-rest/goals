class GoalsProgressCalendarDay
  attr_reader :date
  attr_reader :updates

  def initialize(date:, updates:)
    @date = date
    @updates = updates
  end
end
