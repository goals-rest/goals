require "test_helper"

module Goals
  module ProgressCalendar
    class ComponentTest < ViewComponent::TestCase
      test "renders" do
        days = [
          ProgressCalendarDay.new(
            date: Date.new(2025, 1, 1),
            updates: 1000
          )
        ]

        progress_calendar = ::ProgressCalendar.new(days)

        render_inline(Goals::ProgressCalendar::Component.new(progress_calendar:))

        assert_text I18n.t("date.abbr_month_names")[1].capitalize
        assert_text(
          I18n.t(
            "features.goals.progress_calendar.component.updates",
            count: 1000,
            date: I18n.localize(Date.new(2025, 1, 1), format: :short_month)
          )
        )
      end
    end
  end
end
