class ProgressCalendarDay
  attr_reader :date
  attr_reader :updates

  def initialize(date:, updates:)
    @date = date
    @updates = updates
  end

  def grade
    case updates
    when 0 then :none
    when 1..4 then :few
    when 5..9 then :some
    when 10..14 then :moderate
    when 15..20 then :many
    else :intense
    end
  end
end
